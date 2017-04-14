=head1 NAME

PPIx::Regexp::Lexer - Assemble tokenizer output.

=head1 SYNOPSIS

 use PPIx::Regexp::Lexer;
 use PPIx::Regexp::Dumper;
 my $lex = PPIx::Regexp::Lexer->new('qr{foo}smx');
 my $dmp = PPIx::Regexp::Dumper->new( $lex );
 $dmp->print();

=head1 INHERITANCE

C<PPIx::Regexp::Lexer> is a
L<PPIx::Regexp::Support|PPIx::Regexp::Support>.

C<PPIx::Regexp::Lexer> has no descendants.

=head1 DESCRIPTION

This class takes the token stream generated by
L<PPIx::Regexp::Tokenizer|PPIx::Regexp::Tokenizer> and generates the
parse tree.

=head1 METHODS

This class provides the following public methods. Methods not documented
here are private, and unsupported in the sense that the author reserves
the right to change or remove them without notice.

=cut

package PPIx::Regexp::Lexer;

use strict;
use warnings;

use base qw{ PPIx::Regexp::Support };

use Carp qw{ confess };
use PPIx::Regexp::Constant qw{ TOKEN_LITERAL TOKEN_UNKNOWN };
use PPIx::Regexp::Node::Range				();
use PPIx::Regexp::Node::Unknown				();
use PPIx::Regexp::Structure				();
use PPIx::Regexp::Structure::Assertion			();
use PPIx::Regexp::Structure::BranchReset		();
use PPIx::Regexp::Structure::Code			();
use PPIx::Regexp::Structure::Capture			();
use PPIx::Regexp::Structure::CharClass			();
use PPIx::Regexp::Structure::Subexpression		();
use PPIx::Regexp::Structure::Main			();
use PPIx::Regexp::Structure::Modifier			();
use PPIx::Regexp::Structure::NamedCapture		();
use PPIx::Regexp::Structure::Quantifier			();
use PPIx::Regexp::Structure::Regexp			();
use PPIx::Regexp::Structure::RegexSet			();
use PPIx::Regexp::Structure::Replacement		();
use PPIx::Regexp::Structure::Switch			();
use PPIx::Regexp::Structure::Unknown			();
use PPIx::Regexp::Token::Unmatched			();
use PPIx::Regexp::Tokenizer				();
use PPIx::Regexp::Util qw{ __choose_tokenizer_class __instance };

our $VERSION = '0.050';

=head2 new

This method instantiates the lexer. It takes as its argument either a
L<PPIx::Regexp::Tokenizer|PPIx::Regexp::Tokenizer> or the text to be
parsed. In the latter case the tokenizer is instantiated from the text.

Any optional name/value pairs after the first argument are passed to the
tokenizer, which interprets them or not as the case may be.

=cut

{

    my $errstr;

    sub new {
	my ( $class, $tokenizer, %args ) = @_;
	ref $class and $class = ref $class;

	unless ( __instance( $tokenizer, 'PPIx::Regexp::Tokenizer' ) ) {
	    my $tokenizer_class = __choose_tokenizer_class(
		$tokenizer, \%args )
		or do {
		    $errstr = 'Data not supported';
		    return;
		};
	    $tokenizer = $tokenizer_class->new( $tokenizer, %args )
		or do {
		    $errstr = $tokenizer_class->errstr();
		    return;
		};
	}

	my $self = {
	    deferred	=> [],	# Deferred tokens
	    failures	=> 0,
	    strict	=> $args{strict},
	    tokenizer	=> $tokenizer,
	};

	bless $self, $class;
	return $self;
    }

    sub errstr {
	return $errstr;
    }

}

=head2 errstr

This method returns the error string from the last attempt to
instantiate a C<PPIx::Regexp::Lexer>. If the last attempt succeeded, the
error will be C<undef>.

=cut

# Defined above

=head2 failures

 print $lexer->failures(), " parse failures\n";

This method returns the number of parse failures encountered. A
parse failure is either a tokenization failure (see
L<< PPIx::Regexp::Tokenizer->failures()|PPIx::Regexp::Tokenizer/failures >>)
or a structural error.

=cut

sub failures {
    my ( $self ) = @_;
    return $self->{failures};
}

=head2 lex

This method lexes the tokens in the text, and returns the lexed list of
elements.

=cut

sub lex {
    my ( $self ) = @_;

    my @content;
    $self->{failures} = 0;

    # Accept everything up to the first delimiter.
    my $kind;	# Initial PPIx::Regexp::Token::Structure
    {
	my $token = $self->_get_token()
	    or return $self->_finalize( @content );
	$token->isa( 'PPIx::Regexp::Token::Delimiter' ) or do {
	    not $kind
		and $token->isa( 'PPIx::Regexp::Token::Structure' )
		and $kind = $token;
	    push @content, $token;
	    redo;
	};
	$self->_unget_token( $token );
    }

    my ( $part_0_class, $part_1_class ) =
	$self->{tokenizer}->__part_classes();

    # Accept the first delimited structure.
    push @content, ( my $part_0 = $self->_get_delimited(
	    $part_0_class ) );

    # If we are a substitution ...
    if ( defined $part_1_class ) {

	# Accept any insignificant stuff.
	while ( my $token = $self->_get_token() ) {
	    if ( $token->significant() ) {
		$self->_unget_token( $token );
		last;
	    } else {
		push @content, $token;
	    }
	}

	# Figure out if we should expect an opening bracket.
	my $expect_open_bracket = $self->close_bracket(
	    $part_0->start( 0 ) ) || 0;

	# Accept the next delimited structure.
	push @content, $self->_get_delimited(
		$part_1_class,
		$expect_open_bracket,
	);
    }

    # Accept the modifiers (we hope!) plus any trailing white space.
    while ( my $token = $self->_get_token() ) {
	push @content, $token;
    }

    # Let all the elements finalize themselves, recording any additional
    # errors as they do so.
    $self->_finalize( @content );

    # If we found a regular expression (and we should have done so) ...
    if ( $part_0 && $part_0->can( 'max_capture_number' ) ) {
	# TODO the above line is really ugly. I'm wondering about
	# string implementations like:
	# * return a $part_0_class of undef (but that complicates the
	#   lexing of the structure itself);
	# * hang this logic on the tokenizer somehow (where it seems out
	#   of place)
	# * hang this logic on PPIx::Regexp::Structure::Regexp and
	#   ::Replacement.
	# I also need to figure out how to make \n backreferences come
	# out as literals. Maybe that is a job best done by the
	# tokenizer.

	# Retrieve the maximum capture group.
	my $max_capture = $part_0->max_capture_number();

	# Hashify the known capture names
	my $capture_name = {
	    map { $_ => 1 } $part_0->capture_names(),
	};

	# For all the backreferences found
	foreach my $elem ( @{ $part_0->find(
	    'PPIx::Regexp::Token::Backreference' ) || [] } ) {
	    # Rebless them as needed, recording any errors found.
	    $self->{failures} +=
		$elem->__PPIX_LEXER__rebless(
		    capture_name	=> $capture_name,
		    max_capture		=> $max_capture,
		);
	}
    }

    return @content;

}

=head2 strict

This method returns true or false based on the value of the C<'strict'>
argument to C<new()>.

=cut

sub strict {
    my ( $self ) = @_;
    return $self->{strict};
}

# Finalize the content array, updating the parse failures count as we
# go.
sub _finalize {
    my ( $self, @content ) = @_;
    foreach my $elem ( @content ) {
	$self->{failures} += $elem->__PPIX_LEXER__finalize( $self );
    }
    defined wantarray and return @content;
    return;
}

{

    my %bracket = (
	'{' => '}',
	'(' => ')',
	'[' => ']',
	'(?['	=> '])',
    ##  '<' => '>',
    );

    my %unclosed = (
	'{' => '_recover_curly',
    );

    sub _get_delimited {
	my ( $self, $class, $expect_open_bracket ) = @_;
	defined $expect_open_bracket or $expect_open_bracket = 1;

	my @rslt;
	$self->{_rslt} = \@rslt;

	if ( $expect_open_bracket ) {
	    if ( my $token = $self->_get_token() ) {
		push @rslt, [];
		if ( $token->isa( 'PPIx::Regexp::Token::Delimiter' ) ) {
		    push @{ $rslt[-1] }, '', $token;
		} else {
		    push @{ $rslt[-1] }, '', undef;
		    $self->_unget_token( $token );
		}
	    } else {
		return;
	    }
	} else {
	    push @rslt, [ '', undef ];
	}

	while ( my $token = $self->_get_token() ) {
	    if ( $token->isa( 'PPIx::Regexp::Token::Delimiter' ) ) {
		$self->_unget_token( $token );
		last;
	    }
	    if ( $token->isa( 'PPIx::Regexp::Token::Structure' ) ) {
		my $content = $token->content();

		if ( my $finish = $bracket{$content} ) {
		    # Open bracket
		    push @rslt, [ $finish, $token ];

		} elsif ( $content eq $rslt[-1][0] ) {

		    # Matched close bracket
		    $self->_make_node( $token );

		} elsif ( $content ne ')' ) {

		    # If the close bracket is not a parenthesis, it becomes
		    # a literal.
		    TOKEN_LITERAL->__PPIX_ELEM__rebless( $token );
		    push @{ $rslt[-1] }, $token;

		} elsif ( $content eq ')'
			and @rslt > 1	# Ignore enclosing delimiter
			and my $recover = $unclosed{$rslt[-1][1]->content()} ) {
		    # If the close bracket is a parenthesis and there is a
		    # recovery procedure, we use it.
		    $self->$recover( $token );

		} else {

		    # Unmatched close with no recovery.
		    $self->{failures}++;
		    PPIx::Regexp::Token::Unmatched->
			__PPIX_ELEM__rebless( $token );
		    push @{ $rslt[-1] }, $token;
		}

	    } else {
		push @{ $rslt[-1] }, $token;
	    }

	    # We have to hand-roll the Range object.
	    if ( __instance( $rslt[-1][-2], 'PPIx::Regexp::Token::Operator' )
		&& $rslt[-1][-2]->content() eq '-'
		&& $rslt[-1][0] eq ']'	# It's a character class
	    ) {
		my @tokens = splice @{ $rslt[-1] }, -3;
		push @{ $rslt[-1] },
		    PPIx::Regexp::Node::Range->__new( @tokens );
	    }
	}

	while ( @rslt > 1 ) {
	    if ( my $recover = $unclosed{$rslt[-1][1]->content()} ) {
		$self->$recover();
	    } else {
		$self->{failures}++;
		$self->_make_node( undef );
	    }
	}

	if ( @rslt == 1 ) {
	    my @last = @{ pop @rslt };
	    shift @last;
	    push @last, $self->_get_token();
	    return $class->__new( @last );
	} else {
	    confess "Missing data";
	}

    }

}

#	$token = $self->_get_token();
#
#	This method returns the next token from the tokenizer.

sub _get_token {
    my ( $self ) = @_;

    if ( @{ $self->{deferred} } ) {
	return shift @{ $self->{deferred} };
    }

    my $token = $self->{tokenizer}->next_token() or return;

    return $token;
}

{

    my %handler = (
	'(' => '_round',
	'[' => '_square',
	'{' => '_curly',
	'(?['	=> '_regex_set',
    );

    sub _make_node {
	my ( $self, $token ) = @_;
	my @args = @{ pop @{ $self->{_rslt} } };
	shift @args;
	push @args, $token;
	my @node;
	if ( my $method = $handler{ $args[0]->content() } ) {
	    @node = $self->$method( \@args );
	}
	@node or @node = PPIx::Regexp::Structure->__new( @args );
	push @{ $self->{_rslt}[-1] }, @node;
	return;
    }

}

# Called as $self->$method( ... ) in _make_node(), above
sub _curly {	## no critic (ProhibitUnusedPrivateSubroutines)
    my ( $self, $args ) = @_;

    if ( $args->[-1] && $args->[-1]->is_quantifier() ) {

	# If the tokenizer has marked the right curly as a quantifier,
	# make the whole thing a quantifier structure.
	return PPIx::Regexp::Structure::Quantifier->__new( @{ $args } );

    } elsif ( $args->[-1] ) {

	# If there is a right curly but it is not a quantifier,
	# make both curlys into literals.
	foreach my $inx ( 0, -1 ) {
	    TOKEN_LITERAL->__PPIX_ELEM__rebless( $args->[$inx] );
	}

	# Try to recover possible quantifiers not recognized because we
	# thought this was a structure.
	$self->_recover_curly_quantifiers( $args );

	return @{ $args };

    } else {

	# If there is no right curly, just make a generic structure
	# TODO maybe this should be something else?
	return PPIx::Regexp::Structure->__new( @{ $args } );
    }
}

# Recover from an unclosed left curly.
# Called as $self->$revover( ... ) in _get_delimited, above
sub _recover_curly {	## no critic (ProhibitUnusedPrivateSubroutines)
    my ( $self, $token ) = @_;

    # Get all the stuff we have accumulated for this curly.
    my @content = @{ pop @{ $self->{_rslt} } };

    # Lose the right bracket, which we have already failed to match.
    shift @content;

    # Rebless the left curly to a literal.
    TOKEN_LITERAL->__PPIX_ELEM__rebless( $content[0] );

    # Try to recover possible quantifiers not recognized because we
    # thought this was a structure.
    $self->_recover_curly_quantifiers( \@content );

    # Shove the curly and its putative contents into whatever structure
    # we have going.
    # The checks are to try to trap things like RT 56864, though on
    # further reflection it turned out that you could get here with an
    # empty $self->{_rslt} on things like 'm{)}'. This one did not get
    # made into an RT ticket, but was fixed by not calling the recovery
    # code if $self->{_rslt} contained only the enclosing delimiters.
    'ARRAY' eq ref $self->{_rslt}
	or confess 'Programming error - $self->{_rslt} not array ref, ',
	    "parsing '", $self->{tokenizer}->content(), "' at ",
	    $token->content();
    @{ $self->{_rslt} }
	or confess 'Programming error - $self->{_rslt} empty, ',
	    "parsing '", $self->{tokenizer}->content(), "' at ",
	    $token->content();
    push @{ $self->{_rslt}[-1] }, @content;

    # Shove the mismatched delimiter back into the input so we can have
    # another crack at it.
    $token and $self->_unget_token( $token );

    # We gone.
    return;
}

sub _recover_curly_quantifiers {
    my ( undef, $args ) = @_;	# Invocant unused

    if ( __instance( $args->[0], TOKEN_LITERAL )
	&& __instance( $args->[1], TOKEN_UNKNOWN )
	&& PPIx::Regexp::Token::Quantifier->could_be_quantifier(
	$args->[1]->content() )
    ) {
	PPIx::Regexp::Token::Quantifier->
	    __PPIX_ELEM__rebless( $args->[1] );

	if ( __instance( $args->[2], TOKEN_UNKNOWN )
	    && PPIx::Regexp::Token::Greediness->could_be_greediness(
		$args->[2]->content() )
	) {
	    PPIx::Regexp::Token::Greediness
		->__PPIX_ELEM__rebless( $args->[2] );
	}

    }

    return;
}

sub _in_regex_set {
    my ( $self ) = @_;
    foreach my $stack_entry ( reverse @{ $self->{_rslt} } ) {
	$stack_entry->[0] eq '])'
	    and return 1;
    }
    return 0;
}

# Called as $self->$method( ... ) in _make_node(), above
sub _round {	## no critic (ProhibitUnusedPrivateSubroutines)
    my ( $self, $args ) = @_;

    # If we're inside a regex set, parens do not capture.
    $self->_in_regex_set()
	and return PPIx::Regexp::Structure->__new( @{ $args } );

    # If /n is asserted, parens do not capture.
    $self->{tokenizer}->modifier( 'n' )
	and return PPIx::Regexp::Structure->__new( @{ $args } );

    # The instantiator will rebless based on the first token if need be.
    return PPIx::Regexp::Structure::Capture->__new( @{ $args } );
}

# Called as $self->$method( ... ) in _make_node(), above
sub _square {	## no critic (ProhibitUnusedPrivateSubroutines)
    my ( undef, $args ) = @_;	# Invocant unused
    return PPIx::Regexp::Structure::CharClass->__new( @{ $args } );
}

# Called as $self->$method( ... ) in _make_node(), above
sub _regex_set {	## no critic (ProhibitUnusedPrivateSubroutines)
    my ( undef, $args ) = @_;	# Invocant unused
    return PPIx::Regexp::Structure::RegexSet->__new( @{ $args } );
}

#	$self->_unget_token( $token );
#
#	This method caches its argument so that it will be returned by
#	the next call to C<_get_token()>. If more than one argument is
#	passed, they will be returned in the order given; that is,
#	_unget_token/_get_token work like unshift/shift.

sub _unget_token {
    my ( $self, @args ) = @_;
    unshift @{ $self->{deferred} }, @args;
    return $self;
}

1;

__END__

=head1 SUPPORT

Support is by the author. Please file bug reports at
L<http://rt.cpan.org>, or in electronic mail to the author.

=head1 AUTHOR

Thomas R. Wyant, III F<wyant at cpan dot org>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2009-2016 by Thomas R. Wyant, III

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl 5.10.0. For more details, see the full text
of the licenses in the directory LICENSES.

This program is distributed in the hope that it will be useful, but
without any warranty; without even the implied warranty of
merchantability or fitness for a particular purpose.

=cut

# ex: set textwidth=72 :
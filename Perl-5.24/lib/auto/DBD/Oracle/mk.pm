$dbd_oracle_mm_opts = {
                        'INC' => '-IC:/cygwin/home/gecko/AP-5.24.1.2402-MSWin32-x86-64int-401627/DBD-Oracle/instantclient_11_2/sdk/include -IC:/cygwin/home/gecko/AP-5.24.1.2402-MSWin32-x86-64int-401627/DBD-Oracle/instantclient_11_2/rdbms/demo -IC:\Perl\\lib\\auto\\DBI',
                        'AUTHOR' => 'Tim Bunce (dbi-users@perl.org)',
                        'DEFINE' => ' -Wall -Wno-comment -DUTF8_SUPPORT -DORA_OCI_VERSION=\\"11.2.0.3\\" -DORA_OCI_102 -DORA_OCI_112',
                        'LIBS' => [
                                    '-LC:/cygwin/home/gecko/AP-5.24.1.2402-MSWin32-x86-64int-401627/DBD-Oracle -loci'
                                  ],
                        'NAME' => 'DBD::Oracle',
                        'ABSTRACT_FROM' => 'lib/DBD/Oracle.pm',
                        'META_MERGE' => {
                                          'configure_requires' => {
                                                                    'DBI' => '1.51'
                                                                  },
                                          'resources' => {
                                                           'repository' => {
                                                                             'web' => 'http://github.com/yanick/DBD-Oracle/tree',
                                                                             'url' => 'git://github.com/yanick/DBD-Oracle.git',
                                                                             'type' => 'git'
                                                                           },
                                                           'bugtracker' => {
                                                                             'mailto' => 'bug-dbd-oracle at rt.cpan.org',
                                                                             'web' => 'http://rt.cpan.org/Public/Dist/Display.html?Name=DBD-Oracle'
                                                                           },
                                                           'homepage' => 'http://search.cpan.org/dist/DBD-Oracle'
                                                         },
                                          'build_requires' => {
                                                                'Test::Simple' => '0.90',
                                                                'DBI' => '1.51',
                                                                'ExtUtils::MakeMaker' => 0
                                                              }
                                        },
                        'PREREQ_PM' => {
                                         'DBI' => '1.51'
                                       },
                        'DIR' => [],
                        'LICENSE' => 'perl',
                        'dist' => {
                                    'PREOP' => '$(MAKE) -f Makefile.old distdir',
                                    'COMPRESS' => 'gzip -v9',
                                    'DIST_DEFAULT' => 'clean distcheck disttest tardist',
                                    'SUFFIX' => 'gz'
                                  },
                        'clean' => {
                                     'FILES' => 'xstmp.c Oracle.xsi dll.base dll.exp sqlnet.log libOracle.def mk.pm DBD_ORA_OBJ.*'
                                   },
                        'OBJECT' => '$(O_FILES)',
                        'VERSION_FROM' => 'lib/DBD/Oracle.pm'
                      };
$dbd_oracle_mm_self = bless( {
                               'LD_RUN_PATH' => '',
                               'ECHO' => '$(ABSPERLRUN) -l -e "binmode STDOUT, qq{{:raw}}; print qq{{@ARGV}}" --',
                               'INSTALLVENDORSCRIPT' => '',
                               'ZIPFLAGS' => '-r',
                               'OBJ_EXT' => '.o',
                               'OBJECT' => '$(O_FILES)',
                               'FULLEXT' => 'DBD\\Oracle',
                               'DESTINSTALLSITEMAN3DIR' => '$(DESTDIR)$(INSTALLSITEMAN3DIR)',
                               'SKIPHASH' => {},
                               'CHMOD' => '$(ABSPERLRUN) -MExtUtils::Command -e chmod --',
                               'INST_LIB' => 'blib\\lib',
                               'ABSTRACT_FROM' => 'lib/DBD/Oracle.pm',
                               'CCCDLFLAGS' => ' ',
                               'TRUE' => '$(ABSPERLRUN)  -e "exit 0" --',
                               'LIBC' => '',
                               'ABSPERLRUN' => '$(ABSPERL)',
                               'INST_BIN' => 'blib\\bin',
                               'DESTINSTALLSITEMAN1DIR' => '$(DESTDIR)$(INSTALLSITEMAN1DIR)',
                               'DESTDIR' => '',
                               'PMLIBPARENTDIRS' => [
                                                      'lib'
                                                    ],
                               'MM_Win32_VERSION' => '7.24',
                               'INST_MAN3DIR' => 'blib\\man3',
                               'INST_SCRIPT' => 'blib\\script',
                               'BOOTDEP' => '',
                               'FIXIN' => 'pl2bat.bat',
                               'INSTALLSCRIPT' => 'C:\Perl\\bin',
                               'RCS_LABEL' => 'rcs -Nv$(VERSION_SYM): -q',
                               'TAR' => 'tar',
                               'VERBINST' => 0,
                               'PREFIX' => '$(PERLPREFIX)',
                               'PERM_RW' => 644,
                               'PERL_LIB' => 'C:\Perl\\lib',
                               'INSTALLVENDORMAN1DIR' => '',
                               'INSTALLSITEARCH' => 'C:\Perl\\site\\lib',
                               'CP' => '$(ABSPERLRUN) -MExtUtils::Command -e cp --',
                               'VERSION' => '1.74',
                               'DESTINSTALLVENDORARCH' => '$(DESTDIR)$(INSTALLVENDORARCH)',
                               'DESTINSTALLPRIVLIB' => '$(DESTDIR)$(INSTALLPRIVLIB)',
                               'FULLPERLRUNINST' => '$(FULLPERLRUN) "-I$(INST_ARCHLIB)" "-I$(INST_LIB)"',
                               'TEST_F' => '$(ABSPERLRUN) -MExtUtils::Command -e test_f --',
                               'FULL_AR' => '',
                               'SITEPREFIX' => 'C:\Perl\\site',
                               'CONFIG' => [
                                             'ar',
                                             'cc',
                                             'cccdlflags',
                                             'ccdlflags',
                                             'dlext',
                                             'dlsrc',
                                             'exe_ext',
                                             'full_ar',
                                             'ld',
                                             'lddlflags',
                                             'ldflags',
                                             'libc',
                                             'lib_ext',
                                             'obj_ext',
                                             'osname',
                                             'osvers',
                                             'ranlib',
                                             'sitelibexp',
                                             'sitearchexp',
                                             'so',
                                             'vendorarchexp',
                                             'vendorlibexp'
                                           ],
                               'MACROEND' => '',
                               'PERL_INC' => 'C:\Perl\\lib\\CORE',
                               'INSTALLVENDORHTMLDIR' => 'C:\Perl\\html',
                               'PREOP' => '$(NOECHO) $(NOOP)',
                               'PERL_SRC' => undef,
                               'DESTINSTALLSITEHTMLDIR' => '$(DESTDIR)$(INSTALLSITEHTMLDIR)',
                               'INSTALLPRIVLIB' => 'C:\Perl\\lib',
                               'EXTRALIBS' => '"liboci.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libmoldname.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libkernel32.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libuser32.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libgdi32.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libwinspool.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libcomdlg32.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libadvapi32.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libshell32.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libole32.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\liboleaut32.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libnetapi32.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libuuid.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libws2_32.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libmpr.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libwinmm.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libversion.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libodbc32.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libodbccp32.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libcomctl32.a"',
                               'INC' => '-IC:/cygwin/home/gecko/AP-5.24.1.2402-MSWin32-x86-64int-401627/DBD-Oracle/instantclient_11_2/sdk/include -IC:/cygwin/home/gecko/AP-5.24.1.2402-MSWin32-x86-64int-401627/DBD-Oracle/instantclient_11_2/rdbms/demo -IC:\Perl\\lib\\auto\\DBI',
                               'LDLOADLIBS' => '"liboci.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libmoldname.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libkernel32.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libuser32.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libgdi32.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libwinspool.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libcomdlg32.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libadvapi32.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libshell32.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libole32.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\liboleaut32.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libnetapi32.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libuuid.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libws2_32.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libmpr.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libwinmm.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libversion.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libodbc32.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libodbccp32.a" "C:\\MinGW\\i686-w64-mingw32\\lib\\libcomctl32.a"',
                               'PERLPREFIX' => 'C:\Perl',
                               'INSTALLVENDORBIN' => '',
                               'MAKEFILE' => 'Makefile',
                               'MM_VERSION' => '7.24',
                               'INST_AUTODIR' => '$(INST_LIB)\\auto\\$(FULLEXT)',
                               'UNINSTALL' => '$(ABSPERLRUN) -MExtUtils::Command::MM -e uninstall --',
                               'DESTINSTALLVENDORSCRIPT' => '$(DESTDIR)$(INSTALLVENDORSCRIPT)',
                               'UNINST' => 0,
                               'PL_FILES' => {},
                               'SHAR' => 'shar',
                               'INST_ARCHLIBDIR' => '$(INST_ARCHLIB)\\DBD',
                               'AUTHOR' => [
                                             'Tim Bunce (dbi-users@perl.org)'
                                           ],
                               'MAKEMAKER' => 'C:/cygwin/home/gecko/tmp/perl-yuuxlxoofadrrlvopqiurqxnbmbfdixeyg/lib/ExtUtils/MakeMaker.pm',
                               'SO' => 'dll',
                               'DEV_NULL' => '> NUL',
                               'PERLMAINCC' => '$(CC)',
                               'DIR' => $dbd_oracle_mm_opts->{'DIR'},
                               'VENDORLIBEXP' => '',
                               'MAN1EXT' => '1',
                               'INSTALLDIRS' => 'perl',
                               'META_MERGE' => $dbd_oracle_mm_opts->{'META_MERGE'},
                               'RM_RF' => '$(ABSPERLRUN) -MExtUtils::Command -e rm_rf --',
                               'ABSTRACT' => 'Oracle database driver for the DBI module',
                               'DLSRC' => 'dl_win32.xs',
                               'INSTALLVENDORARCH' => '',
                               'AR' => 'ar',
                               'USEMAKEFILE' => '-f',
                               'RM_F' => '$(ABSPERLRUN) -MExtUtils::Command -e rm_f --',
                               'PERL' => '"C:\Perl\\bin\\perl.exe"',
                               'PERL_ARCHIVE' => '$(PERL_INC)\\libperl524.a',
                               'LDFLAGS' => '-s -static-libgcc -static-libstdc++ -L"C:\Perl\\lib\\CORE" -L"C:\\MinGW\\i686-w64-mingw32\\lib"',
                               'RANLIB' => 'ranlib',
                               'O_FILES' => [
                                              'Oracle.o',
                                              'dbdimp.o',
                                              'oci8.o'
                                            ],
                               'LIBS' => $dbd_oracle_mm_opts->{'LIBS'},
                               'DESTINSTALLBIN' => '$(DESTDIR)$(INSTALLBIN)',
                               'CP_NONEMPTY' => '$(ABSPERLRUN) -MExtUtils::Command::MM -e cp_nonempty --',
                               'VERSION_FROM' => 'lib/DBD/Oracle.pm',
                               'SITELIBEXP' => 'C:\Perl\\site\\lib',
                               'CI' => 'ci -u',
                               'BSLOADLIBS' => '',
                               'dist' => $dbd_oracle_mm_opts->{'dist'},
                               'ECHO_N' => '$(ABSPERLRUN)  -e "print qq{{@ARGV}}" --',
                               'LIB_EXT' => '.a',
                               'PERL_ARCHLIB' => 'C:\Perl\\lib',
                               'CC' => 'gcc',
                               'MKPATH' => '$(ABSPERLRUN) -MExtUtils::Command -e mkpath --',
                               'BUILD_REQUIRES' => {},
                               'PERM_DIR' => 755,
                               'EQUALIZE_TIMESTAMP' => '$(ABSPERLRUN) -MExtUtils::Command -e eqtime --',
                               'NOOP' => 'rem',
                               'DESTINSTALLVENDORHTMLDIR' => '$(DESTDIR)$(INSTALLVENDORHTMLDIR)',
                               'DIRFILESEP' => '\\\\',
                               'HAS_LINK_CODE' => 1,
                               'XS_VERSION_MACRO' => 'XS_VERSION',
                               'MACROSTART' => '',
                               'PREREQ_PM' => {
                                                'DBI' => '1.51'
                                              },
                               'TEST_REQUIRES' => {},
                               'INSTALLMAN1DIR' => 'C:\Perl\\man\\man1',
                               'DIST_DEFAULT' => 'tardist',
                               'INSTALLSITESCRIPT' => 'C:\Perl\\site\\bin',
                               'MV' => '$(ABSPERLRUN) -MExtUtils::Command -e mv --',
                               'PARENT_NAME' => 'DBD',
                               'CCDLFLAGS' => ' ',
                               'DLEXT' => 'dll',
                               'POSTOP' => '$(NOECHO) $(NOOP)',
                               'MAKEFILE_OLD' => 'Makefile.old',
                               'MAP_TARGET' => 'perl',
                               'PERL_INCDEP' => 'C:\Perl\\lib\\CORE',
                               'INSTALLMAN3DIR' => 'C:\Perl\\man\\man3',
                               'DESTINSTALLSCRIPT' => '$(DESTDIR)$(INSTALLSCRIPT)',
                               'TO_UNIX' => '$(NOECHO) $(NOOP)',
                               'DESTINSTALLSITESCRIPT' => '$(DESTDIR)$(INSTALLSITESCRIPT)',
                               'ZIP' => 'zip',
                               'PERLRUN' => '$(PERL)',
                               'LIBPERL_A' => 'libperl.a',
                               'XS_DEFINE_VERSION' => '-D$(XS_VERSION_MACRO)=\\"$(XS_VERSION)\\"',
                               'INSTALLHTMLDIR' => 'C:\Perl\\html',
                               'NAME' => 'DBD::Oracle',
                               'C' => [
                                        'Oracle.c',
                                        'dbdimp.c',
                                        'oci8.c'
                                      ],
                               'BASEEXT' => 'Oracle',
                               'MOD_INSTALL' => '$(ABSPERLRUN) -MExtUtils::Install -e "install([ from_to => {{@ARGV}}, verbose => \'$(VERBINST)\', uninstall_shadows => \'$(UNINST)\', dir_mode => \'$(PERM_DIR)\' ]);" --',
                               'RESULT' => [
                                             '# This Makefile is for the DBD::Oracle extension to perl.
#
# It was generated automatically by MakeMaker version
# 7.24 (Revision: 72400) from the contents of
# Makefile.PL. Don\'t edit this file, edit Makefile.PL instead.
#
#       ANY CHANGES MADE HERE WILL BE LOST!
#
#   MakeMaker ARGV: (q[INSTALLDIRS=perl])
#
',
                                             '#   MakeMaker Parameters:
',
                                             '#     ABSTRACT_FROM => q[lib/DBD/Oracle.pm]',
                                             '#     AUTHOR => [q[Tim Bunce (dbi-users@perl.org)]]',
                                             '#     BUILD_REQUIRES => {  }',
                                             '#     CONFIGURE_REQUIRES => {  }',
                                             '#     DEFINE => q[ -Wall -Wno-comment -DUTF8_SUPPORT -DORA_OCI_VERSION=\\"11.2.0.3\\" -DORA_OCI_102 -DORA_OCI_112]',
                                             '#     DIR => []',
                                             '#     INC => q[-IC:/cygwin/home/gecko/AP-5.24.1.2402-MSWin32-x86-64int-401627/DBD-Oracle/instantclient_11_2/sdk/include -IC:/cygwin/home/gecko/AP-5.24.1.2402-MSWin32-x86-64int-401627/DBD-Oracle/instantclient_11_2/rdbms/demo -IC:\Perl\\lib\\auto\\DBI]',
                                             '#     LIBS => [q[-LC:/cygwin/home/gecko/AP-5.24.1.2402-MSWin32-x86-64int-401627/DBD-Oracle -loci]]',
                                             '#     LICENSE => q[perl]',
                                             '#     META_MERGE => { build_requires=>{ DBI=>q[1.51], ExtUtils::MakeMaker=>q[0], Test::Simple=>q[0.90] }, configure_requires=>{ DBI=>q[1.51] }, resources=>{ bugtracker=>{ mailto=>q[bug-dbd-oracle at rt.cpan.org], web=>q[http://rt.cpan.org/Public/Dist/Display.html?Name=DBD-Oracle] }, homepage=>q[http://search.cpan.org/dist/DBD-Oracle], repository=>{ type=>q[git], url=>q[git://github.com/yanick/DBD-Oracle.git], web=>q[http://github.com/yanick/DBD-Oracle/tree] } } }',
                                             '#     NAME => q[DBD::Oracle]',
                                             '#     OBJECT => q[$(O_FILES)]',
                                             '#     PREREQ_PM => { DBI=>q[1.51] }',
                                             '#     TEST_REQUIRES => {  }',
                                             '#     VERSION_FROM => q[lib/DBD/Oracle.pm]',
                                             '#     clean => { FILES=>q[xstmp.c Oracle.xsi dll.base dll.exp sqlnet.log libOracle.def mk.pm DBD_ORA_OBJ.*] }',
                                             '#     dist => { COMPRESS=>q[gzip -v9], DIST_DEFAULT=>q[clean distcheck disttest tardist], PREOP=>q[$(MAKE) -f Makefile.old distdir], SUFFIX=>q[gz] }',
                                             '
# --- MakeMaker post_initialize section:'
                                           ],
                               'VENDORPREFIX' => '',
                               'DESTINSTALLSITELIB' => '$(DESTDIR)$(INSTALLSITELIB)',
                               'MAKE_APERL_FILE' => 'Makefile.aperl',
                               'INST_ARCHLIB' => 'blib\\arch',
                               'INSTALLSITEBIN' => 'C:\Perl\\site\\bin',
                               'DLBASE' => '$(BASEEXT)',
                               'NOECHO' => '@',
                               'ARGS' => {
                                           'NAME' => 'DBD::Oracle',
                                           'LIBS' => $dbd_oracle_mm_opts->{'LIBS'},
                                           'AUTHOR' => $dbd_oracle_mm_self->{'AUTHOR'},
                                           'DEFINE' => ' -Wall -Wno-comment -DUTF8_SUPPORT -DORA_OCI_VERSION=\\"11.2.0.3\\" -DORA_OCI_102 -DORA_OCI_112',
                                           'INC' => '-IC:/cygwin/home/gecko/AP-5.24.1.2402-MSWin32-x86-64int-401627/DBD-Oracle/instantclient_11_2/sdk/include -IC:/cygwin/home/gecko/AP-5.24.1.2402-MSWin32-x86-64int-401627/DBD-Oracle/instantclient_11_2/rdbms/demo -IC:\Perl\\lib\\auto\\DBI',
                                           'VERSION_FROM' => 'lib/DBD/Oracle.pm',
                                           'clean' => $dbd_oracle_mm_opts->{'clean'},
                                           'OBJECT' => '$(O_FILES)',
                                           'LICENSE' => 'perl',
                                           'dist' => $dbd_oracle_mm_opts->{'dist'},
                                           'DIR' => $dbd_oracle_mm_opts->{'DIR'},
                                           'INSTALLDIRS' => 'perl',
                                           'PREREQ_PM' => $dbd_oracle_mm_opts->{'PREREQ_PM'},
                                           'META_MERGE' => $dbd_oracle_mm_opts->{'META_MERGE'},
                                           'ABSTRACT_FROM' => 'lib/DBD/Oracle.pm'
                                         },
                               'MM_REVISION' => 72400,
                               'LICENSE' => 'perl',
                               'SUFFIX' => '.gz',
                               'MAKE' => 'dmake',
                               'PERM_RWX' => 755,
                               'DESTINSTALLSITEARCH' => '$(DESTDIR)$(INSTALLSITEARCH)',
                               'LINKTYPE' => 'dynamic',
                               'FALSE' => '$(ABSPERLRUN)  -e "exit 1" --',
                               'INSTALLSITEHTMLDIR' => 'C:\Perl\\html',
                               'LDDLFLAGS' => '-mdll -s -static-libgcc -static-libstdc++ -L"C:\Perl\\lib\\CORE" -L"C:\\MinGW\\i686-w64-mingw32\\lib"',
                               'MAN3PODS' => {
                                               'lib/DBD/Oracle/Troubleshooting/Vms.pod' => '$(INST_MAN3DIR)\\DBD.Oracle.Troubleshooting.Vms.$(MAN3EXT)',
                                               'lib/DBD/Oracle/Troubleshooting/Win64.pod' => '$(INST_MAN3DIR)\\DBD.Oracle.Troubleshooting.Win64.$(MAN3EXT)',
                                               'lib/DBD/Oracle/Troubleshooting/Hpux.pod' => '$(INST_MAN3DIR)\\DBD.Oracle.Troubleshooting.Hpux.$(MAN3EXT)',
                                               'lib/DBD/Oracle/Object.pm' => '$(INST_MAN3DIR)\\DBD.Oracle.Object.$(MAN3EXT)',
                                               'lib/DBD/Oracle/Troubleshooting/Linux.pod' => '$(INST_MAN3DIR)\\DBD.Oracle.Troubleshooting.Linux.$(MAN3EXT)',
                                               'lib/DBD/Oracle/Troubleshooting/Sun.pod' => '$(INST_MAN3DIR)\\DBD.Oracle.Troubleshooting.Sun.$(MAN3EXT)',
                                               'lib/DBD/Oracle.pm' => '$(INST_MAN3DIR)\\DBD.Oracle.$(MAN3EXT)',
                                               'lib/DBD/Oracle/Troubleshooting/Cygwin.pod' => '$(INST_MAN3DIR)\\DBD.Oracle.Troubleshooting.Cygwin.$(MAN3EXT)',
                                               'lib/DBD/Oracle/Troubleshooting.pod' => '$(INST_MAN3DIR)\\DBD.Oracle.Troubleshooting.$(MAN3EXT)',
                                               'lib/DBD/Oracle/Troubleshooting/Aix.pod' => '$(INST_MAN3DIR)\\DBD.Oracle.Troubleshooting.Aix.$(MAN3EXT)',
                                               'lib/DBD/Oracle/Troubleshooting/Macos.pod' => '$(INST_MAN3DIR)\\DBD.Oracle.Troubleshooting.Macos.$(MAN3EXT)',
                                               'lib/DBD/Oracle/GetInfo.pm' => '$(INST_MAN3DIR)\\DBD.Oracle.GetInfo.$(MAN3EXT)',
                                               'lib/DBD/Oracle/Troubleshooting/Win32.pod' => '$(INST_MAN3DIR)\\DBD.Oracle.Troubleshooting.Win32.$(MAN3EXT)'
                                             },
                               'PERL_ARCHIVE_AFTER' => '',
                               'EXPORT_LIST' => '$(BASEEXT).def',
                               'DIST_CP' => 'best',
                               'SITEARCHEXP' => 'C:\Perl\\site\\lib',
                               'DOC_INSTALL' => '$(ABSPERLRUN) -MExtUtils::Command::MM -e perllocal_install --',
                               'INST_LIBDIR' => '$(INST_LIB)\\DBD',
                               'FIRST_MAKEFILE' => 'Makefile',
                               'DESTINSTALLVENDORMAN1DIR' => '$(DESTDIR)$(INSTALLVENDORMAN1DIR)',
                               'LD' => 'g++',
                               'XS' => {
                                         'Oracle.xs' => 'Oracle.c'
                                       },
                               'DESTINSTALLVENDORBIN' => '$(DESTDIR)$(INSTALLVENDORBIN)',
                               'INSTALLSITELIB' => 'C:\Perl\\site\\lib',
                               'INSTALLARCHLIB' => 'C:\Perl\\lib',
                               'TARFLAGS' => 'cvf',
                               'DISTNAME' => 'DBD-Oracle',
                               'INST_BOOT' => '$(INST_ARCHAUTODIR)\\$(BASEEXT).bs',
                               'PMLIBDIRS' => [
                                                'lib'
                                              ],
                               'AR_STATIC_ARGS' => 'cr',
                               'FULLPERLRUN' => '$(FULLPERL)',
                               'INSTALLBIN' => 'C:\Perl\\bin',
                               'INSTALLSITEMAN3DIR' => '$(INSTALLMAN3DIR)',
                               'TEST_S' => '$(ABSPERLRUN) -MExtUtils::Command::MM -e test_s --',
                               'DESTINSTALLMAN3DIR' => '$(DESTDIR)$(INSTALLMAN3DIR)',
                               'DESTINSTALLARCHLIB' => '$(DESTDIR)$(INSTALLARCHLIB)',
                               'FULLPERL' => '"C:\Perl\\bin\\perl.exe"',
                               'INST_ARCHAUTODIR' => '$(INST_ARCHLIB)\\auto\\$(FULLEXT)',
                               'DEFINE' => ' -Wall -Wno-comment -DUTF8_SUPPORT -DORA_OCI_VERSION=\\"11.2.0.3\\" -DORA_OCI_102 -DORA_OCI_112',
                               'H' => [
                                        'Oracle.h',
                                        'dbdimp.h',
                                        'dbivport.h',
                                        'ocitrace.h'
                                      ],
                               'TOUCH' => '$(ABSPERLRUN) -MExtUtils::Command -e touch --',
                               'DEFINE_VERSION' => '-D$(VERSION_MACRO)=\\"$(VERSION)\\"',
                               'PM' => {
                                         'lib/DBD/Oracle.pm' => 'blib\\lib\\DBD\\Oracle.pm',
                                         'lib/DBD/Oracle/Troubleshooting/Sun.pod' => 'blib\\lib\\DBD\\Oracle\\Troubleshooting\\Sun.pod',
                                         'mk.pm' => '$(INST_LIB)\\DBD\\mk.pm',
                                         'lib/DBD/Oracle/Troubleshooting/Win64.pod' => 'blib\\lib\\DBD\\Oracle\\Troubleshooting\\Win64.pod',
                                         'lib/DBD/Oracle/Troubleshooting/Hpux.pod' => 'blib\\lib\\DBD\\Oracle\\Troubleshooting\\Hpux.pod',
                                         'lib/DBD/Oracle/Troubleshooting/Vms.pod' => 'blib\\lib\\DBD\\Oracle\\Troubleshooting\\Vms.pod',
                                         'lib/DBD/Oracle/Troubleshooting/Linux.pod' => 'blib\\lib\\DBD\\Oracle\\Troubleshooting\\Linux.pod',
                                         'lib/DBD/Oracle/Object.pm' => 'blib\\lib\\DBD\\Oracle\\Object.pm',
                                         'lib/DBD/Oracle/GetInfo.pm' => 'blib\\lib\\DBD\\Oracle\\GetInfo.pm',
                                         'lib/DBD/Oracle/Troubleshooting/Win32.pod' => 'blib\\lib\\DBD\\Oracle\\Troubleshooting\\Win32.pod',
                                         'lib/DBD/Oracle/Troubleshooting/Cygwin.pod' => 'blib\\lib\\DBD\\Oracle\\Troubleshooting\\Cygwin.pod',
                                         'lib/DBD/Oracle/Troubleshooting.pod' => 'blib\\lib\\DBD\\Oracle\\Troubleshooting.pod',
                                         'lib/DBD/Oracle/Troubleshooting/Aix.pod' => 'blib\\lib\\DBD\\Oracle\\Troubleshooting\\Aix.pod',
                                         'lib/DBD/Oracle/Troubleshooting/Macos.pod' => 'blib\\lib\\DBD\\Oracle\\Troubleshooting\\Macos.pod'
                                       },
                               'INSTALLVENDORMAN3DIR' => '',
                               'DESTINSTALLMAN1DIR' => '$(DESTDIR)$(INSTALLMAN1DIR)',
                               'OSVERS' => '6.1',
                               'ABSPERL' => '$(PERL)',
                               'clean' => $dbd_oracle_mm_opts->{'clean'},
                               'COMPRESS' => 'gzip --best',
                               'PERLRUNINST' => '$(PERLRUN) "-I$(INST_ARCHLIB)" "-I$(INST_LIB)"',
                               'XS_VERSION' => '1.74',
                               'VERSION_MACRO' => 'VERSION',
                               'WARN_IF_OLD_PACKLIST' => '$(ABSPERLRUN) -MExtUtils::Command::MM -e warn_if_old_packlist --',
                               'INST_STATIC' => '$(INST_ARCHAUTODIR)\\$(BASEEXT)$(LIB_EXT)',
                               'CONFIGURE_REQUIRES' => {},
                               'DESTINSTALLVENDORMAN3DIR' => '$(DESTDIR)$(INSTALLVENDORMAN3DIR)',
                               'INST_MAN1DIR' => 'blib\\man1',
                               'EXE_EXT' => '.exe',
                               'MAN3EXT' => '3',
                               'INST_DYNAMIC' => '$(INST_ARCHAUTODIR)\\$(DLBASE).$(DLEXT)',
                               'DESTINSTALLSITEBIN' => '$(DESTDIR)$(INSTALLSITEBIN)',
                               'PERL_ARCHLIBDEP' => 'C:\Perl\\lib',
                               'UMASK_NULL' => 'umask 0',
                               'DESTINSTALLVENDORLIB' => '$(DESTDIR)$(INSTALLVENDORLIB)',
                               'PERL_CORE' => 0,
                               'LDFROM' => '$(OBJECT)',
                               'INST_HTMLDIR' => 'blib\\html',
                               'VENDORARCHEXP' => '',
                               'DISTVNAME' => 'DBD-Oracle-1.74',
                               'PERL_ARCHIVEDEP' => '$(PERL_INCDEP)\\libperl524.a',
                               'INSTALLSITEMAN1DIR' => '$(INSTALLMAN1DIR)',
                               'INSTALLVENDORLIB' => '',
                               'OSNAME' => 'MSWin32',
                               'VERSION_SYM' => '1_74',
                               'DESTINSTALLHTMLDIR' => '$(DESTDIR)$(INSTALLHTMLDIR)',
                               'ABSPERLRUNINST' => '$(ABSPERLRUN) "-I$(INST_ARCHLIB)" "-I$(INST_LIB)"',
                               'NAME_SYM' => 'DBD_Oracle'
                             }, 'PACK001' );

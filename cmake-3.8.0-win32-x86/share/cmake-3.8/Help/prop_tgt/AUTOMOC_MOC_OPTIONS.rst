AUTOMOC_MOC_OPTIONS
-------------------

Additional options for moc when using :prop_tgt:`AUTOMOC`

This property is only used if the :prop_tgt:`AUTOMOC` property is ``ON``
for this target.  In this case, it holds additional command line
options which will be used when ``moc`` is executed during the build, i.e.
it is equivalent to the optional ``OPTIONS`` argument of the
:module:`qt4_wrap_cpp() <FindQt4>` macro.

By default it is empty.

See the :manual:`cmake-qt(7)` manual for more information on using CMake
with Qt.

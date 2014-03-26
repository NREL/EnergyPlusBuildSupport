# dummy file, should include commands for:
# building fortran pieces
# making installers via bringing in binary executables, docs, etc.


SET( BUILD_TRANSITION TRUE CACHE BOOL "Build transition program?" )
IF( BUILD_TRANSITION )
  ADD_SUBDIRECTORY(SourceCode/Transition)
ENDIF()
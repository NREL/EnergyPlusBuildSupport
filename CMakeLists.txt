# dummy file, should include commands for:
# building fortran pieces
# making installers via bringing in binary executables, docs, etc.

cmake_minimum_required(VERSION 2.8.9) # IVF 13 requires this version of CMake
enable_language(Fortran)


SET( BUILD_TRANSITION TRUE CACHE BOOL "Build transition program?" )
IF( BUILD_TRANSITION )
  ADD_SUBDIRECTORY(src/Transition)
ENDIF()
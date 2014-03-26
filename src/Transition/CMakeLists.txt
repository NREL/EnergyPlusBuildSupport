SET(SRC
  Transition.f90
  DataGlobals.f90
  DataStringGlobals.f90
  DataVCompareGlobals.f90
  DisplayRoutines.f90
  General.f90
  InputProcessor.f90
  platformDepUtilityRoutines.f90
  SortAndStringUtilities.f90
  UtilityRoutines.f90
  VCompareGlobalRoutines.f90
  VCompareUtilityRoutines.f90
)

list( APPEND VERSIONS 1_0_0 )
list( APPEND VERSIONS 1_0_1 )
list( APPEND VERSIONS 1_0_2 )
list( APPEND VERSIONS 1_0_3 )
list( APPEND VERSIONS 1_1_0 )
list( APPEND VERSIONS 1_1_1 )
list( APPEND VERSIONS 1_2_0 )
list( APPEND VERSIONS 1_2_1 )
list( APPEND VERSIONS 1_2_2 )
list( APPEND VERSIONS 1_2_3 )
list( APPEND VERSIONS 1_3_0 )
list( APPEND VERSIONS 1_4_0 )
list( APPEND VERSIONS 2_0_0 )
list( APPEND VERSIONS 2_1_0 )
list( APPEND VERSIONS 2_2_0 )
list( APPEND VERSIONS 3_0_0 )
list( APPEND VERSIONS 3_1_0 )
list( APPEND VERSIONS 4_0_0 )
list( APPEND VERSIONS 5_0_0 )
list( APPEND VERSIONS 6_0_0 )
list( APPEND VERSIONS 7_0_0 )
list( APPEND VERSIONS 7_1_0 )
list( APPEND VERSIONS 7_2_0 )
list( APPEND VERSIONS 8_0_0 )
list( APPEND VERSIONS 8_1_0 )

IF(UNIX) # Mac and Linux
  SET(CMAKE_Fortran_FLAGS "-nologo")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -assume buffered_io")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -fpscomp nolibs")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -zero")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -save")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -fpe0")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -fp-model source")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -fp-speculation=safe")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -names lowercase")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -check uninit")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -threads")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -assume protect_parens")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -prec-div")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -prec-sqrt")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -fpp")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -inline-level=0")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -Qvec-")
ELSE()
  SET(CMAKE_Fortran_FLAGS_RELEASE "")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} /assume:buffered_io")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} /fpscomp:nolibs")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} /libs:static")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} /Oy-")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} /traceback")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} /fpp")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} /fpe:0")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} /fp:source")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} /check:uninit")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} /Qsave")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} /Qzero")
  SET(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} /Qvec-")
  set (CMAKE_Fortran_MODULE_DIRECTORY  "$(IntDir)/")
ENDIF()

#LKL: 9/2012 this is for extra large files.
FOREACH(f ${SRC})
  IF( ${f}  MATCHES ".*InputProcessor.f90" )
    IF( UNIX )
      IF(CMAKE_Fortran_COMPILER MATCHES "ifort")
       SET_SOURCE_FILES_PROPERTIES( ${f} PROPERTIES COMPILE_FLAGS "-heap-arrays:10000" )
      ENDIF()
    ENDIF()
  ENDIF()
ENDFOREACH()

FOREACH(f ${SRC})
  IF( ${f}  MATCHES ".*InputProcessor.f90" )
    IF( WIN32 )
      IF(CMAKE_Fortran_COMPILER MATCHES "ifort")
       SET_SOURCE_FILES_PROPERTIES( ${f} PROPERTIES COMPILE_FLAGS "/heap-arrays:10000" )
      ENDIF()
    ENDIF()
  ENDIF()
ENDFOREACH()

list( LENGTH VERSIONS VERSIONS_SIZE)

math(EXPR end "${VERSIONS_SIZE} - 1")

FOREACH( i RANGE 1 ${end} )

math(EXPR ii "${i} - 1")

LIST(GET VERSIONS ${ii} OLD_VERSION)
LIST(GET VERSIONS ${i} NEW_VERSION)

STRING( REPLACE _ - OLD-VERSION ${OLD_VERSION} )
STRING( REPLACE _ - NEW-VERSION ${NEW_VERSION} )

SET(LAST_NAME "Transition-V${OLD-VERSION}-to-V${NEW-VERSION}" )

ADD_EXECUTABLE( "${LAST_NAME}" ${SRC} )
SET_PROPERTY( TARGET "${LAST_NAME}"
              PROPERTY COMPILE_DEFINITIONS V${NEW_VERSION} )

ENDFOREACH()

INSTALL( TARGETS "${LAST_NAME}" DESTINATION PreProcess/IDFVersionUpdater )


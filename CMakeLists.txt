# CMake project for starspan

# This script expects that the following configuration variables are
# set and passed during CMake invocation:

# CMAKE_BINARY_DIR
# DESIRED_BUILD_TYPE     | possible values: "debug", "release", "profile"
# CMAKE_INSTALL_PREFIX   | ex: "D:/DOS"

message("Processing top-level CMakelists.txt for project starspan")

include( CMakeForceCompiler )

#------------------------------------------------------------------------------------#
#                           Build directory check                                    #
#------------------------------------------------------------------------------------#
if(${CMAKE_SOURCE_DIR}/src STREQUAL ${CMAKE_BINARY_DIR})
  message(FATAL_ERROR "Cannot be built in the source directory. Use out-of-source build instead.")
  message(FATAL_ERROR "  cd /some/work/dir/build")
  message(FATAL_ERROR "  cmake -i /path/to/source")
endif()

#------------------------------------------------------------------------
# Set basic project settings
#------------------------------------------------------------------------

project (starspan C CXX)

SET(CPACK_GENERATOR "TGZ")
include(CPack)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(PACKAGE_BUGREPORT "smwesten@usgs.gov")
set(PACKAGE_NAME "starspan")
set(PACKAGE_STRING "starspan")
set(PACKAGE_TARNAME "starspan")
set(PACKAGE_VERSION "1.0.1")

cmake_minimum_required(VERSION 2.8)

#include( cmake/version_control.cmake )

set( EXTERNAL_LIBS ${CMAKE_EXE_LINKER_FLAGS} )
#set( EXTERNAL_LIBS ${EXTERNAL_LIBS} ${LIB_GCC} ${LIB_GXX})

link_libraries( ${EXTERNAL_LIBS} )

set( INCLUDE_DIRECTORIES ${PROJECT_SOURCE_DIR}/src/csv )
set( INCLUDE_DIRECTORIES ${INCLUDE_DIRECTORIES} ${PROJECT_SOURCE_DIR}/src/jts )
set( INCLUDE_DIRECTORIES ${INCLUDE_DIRECTORIES} ${PROJECT_SOURCE_DIR}/src/raster )
set( INCLUDE_DIRECTORIES ${INCLUDE_DIRECTORIES} ${PROJECT_SOURCE_DIR}/src/rasterizers )
set( INCLUDE_DIRECTORIES ${INCLUDE_DIRECTORIES} ${PROJECT_SOURCE_DIR}/src/stats )
set( INCLUDE_DIRECTORIES ${INCLUDE_DIRECTORIES} ${PROJECT_SOURCE_DIR}/src/traverser )
set( INCLUDE_DIRECTORIES ${INCLUDE_DIRECTORIES} ${PROJECT_SOURCE_DIR}/src/util )
set( INCLUDE_DIRECTORIES ${INCLUDE_DIRECTORIES} ${PROJECT_SOURCE_DIR}/src/vector )

include_directories( ${INCLUDE_DIRECTORIES} )

if ("${SYSTEM_TYPE}" STREQUAL "win_x64" OR "${SYSTEM_TYPE}" STREQUAL "win_x86")
  add_custom_target(copy ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/src/starspan.exe ${CMAKE_INSTALL_PREFIX}/starspan.exe
  )
else()
  add_custom_target(copy ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/src/starspan ${CMAKE_INSTALL_PREFIX}/starspan
  )
endif()

include( cmake/print_summary.cmake )

enable_testing()
add_subdirectory(src)

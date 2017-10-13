#!/bin/bash
#remove existing Cmake cache and directories
# remove existing Cmake cache and directories
rm -fr CMake*
rm -rf Testing
rm -rf src
rm -rf tests
rm -f CPack*
rm -f *.txt

export GCC_VERSION=7.2.0
# set CMAKE-related and build-related variables
export GCCLIST=$( glocate gcc-7 | grep Cellar | grep bin | grep $GCC_VERSION )
export GCCARR=($GCCLIST)
export GCC=${GCCARR[1]}

export GXXLIST=$( glocate g++-7 | grep Cellar | grep bin | grep $GCC_VERSION )
export GXXARR=($GXXLIST)
export GXX=${GXXARR[1]}

export CMAKEROOT=/usr/bin/cmake
export R_HOME=/usr/bin/R

export LIB_PROJ=$( glocate libproj.a | grep Cellar )
export LIB_JSON_C=$( glocate libjson-c.a | grep Cellar )
export LIB_FREEXL=$( glocate libfreexl.a | grep Cellar )
export LIB_GEOS_C=$( glocate libgeos_c.a | grep Cellar )
export LIB_EXPAT=$( glocate libexpat.a | grep Cellar )
export LIB_JPEG=$( glocate libjpeg.a | grep Cellar )
export LIB_PNG=$( glocate libpng.a | grep Cellar )
export LIB_GIF=$( glocate libgif.a | grep Cellar )
export LIB_TIFF=$( glocate libtiff.a | grep Cellar )
export LIB_SPATIALITE=$( glocate libspatialite.a | grep Cellar )
export LIB_SQLITE3=$( glocate libsqlite3.a | grep Cellar )
export LIB_XML2=$( glocate libxml2.a | grep Cellar )

export LIB_GDAL=$( glocate libgdal.a | grep Cellar )
export LIB_GCC=$( glocate libgcc.a | grep Cellar | grep $GCC_VERSION | grep -v i386 )

export PATH=/usr/local:/usr/local/bin:/usr/local/lib:/usr/bin/cmake:$PATH

# define where 'make copy' will place executables
export INSTALL_PREFIX=/usr/local/bin

# define other variables for use in the CMakeList.txt file
# options are "Release" or "Debug"
export BUILD_TYPE="DEBUG"
export SYSTEM_TYPE="MacOS"

# define platform and compiler specific compilation flags
export CMAKE_CXX_FLAGS_DEBUG="-O0 -g -ggdb -Wuninitialized -fexceptions -fsanitize=null -fsanitize=leak -fmax-errors=6 -Wno-maybe-uninitialized"
export CMAKE_CXX_FLAGS_RELEASE="-O2 -mtune=native -Wno-maybe-uninitialized"

# set important environment variables
export CC=$GCC
export CXX=$GXX

cmake "../../.." -G "Unix Makefiles"                         \
-DSYSTEM_TYPE="$SYSTEM_TYPE "                                \
-DCMAKE_BUILD_TYPE="$BUILD_TYPE "                            \
-DLIB_PROJ="$LIB_PROJ "                                      \
-DLIB_JSON_C="$LIB_JSON_C "                                  \
-DLIB_FREEXL="$LIB_FREEXL "                                  \
-DLIB_GDAL="$LIB_GDAL "                                      \
-DLIB_GEOS_C="$LIB_GEOS_C "                                  \
-DLIB_JPEG="$LIB_JPEG "                                      \
-DLIB_PNG="$LIB_PNG "                                        \
-DLIB_GIF="$LIB_GIF "                                        \
-DLIB_TIFF="$LIB_TIFF "                                      \
-DLIB_SPATIALITE="$LIB_SPATIALITE "                          \
-DLIB_SQLITE3="$LIB_SQLITE3 "                                \
-DLIB_EXPAT="$LIB_EXPAT "                                    \
-DLIB_XML2="$LIB_XML2 "                                      \
-DLIB_GCC="$LIB_GCC "                                        \
-DCMAKE_INSTALL_PREFIX:PATH="$INSTALL_PREFIX "               \
-DCMAKE_CXX_FLAGS_DEBUG="$CMAKE_CXX_FLAGS_DEBUG "            \
-DCMAKE_CXX_FLAGS_RELEASE="$CMAKE_CXX_FLAGS_RELEASE"

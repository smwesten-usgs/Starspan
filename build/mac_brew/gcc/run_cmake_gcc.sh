#!/bin/bash
#remove existing Cmake cache and directories
# remove existing Cmake cache and directories
rm -fr CMake*
rm -rf Testing
rm -rf src
rm -rf tests
rm -f CPack*
rm -f *.txt

# set important environment variables

export GCC_VERSION=7.2.0
# set CMAKE-related and build-related variables
export GCCLIST=$( glocate gcc-7 | grep Cellar | grep bin | grep $GCC_VERSION )
export GCCARR=($GCCLIST)
export CC=${GCCARR[1]}

export GXXLIST=$( glocate g++-7 | grep Cellar | grep bin | grep $GCC_VERSION )
export GXXARR=($GXXLIST)
export CXX=${GXXARR[1]}

export CMAKEROOT=/usr/bin/cmake
export R_HOME=/usr/bin/R


export LIB_GDAL=$(glocate gdal.dylib | grep Cellar )
export CMAKE_EXE_LINKER_FLAGS=$(gdal-config --dep-libs)
#export LIB_GCC=$( glocate libgcc.a | grep Cellar | grep $GCC_VERSION | grep -v i386 )
#export LIB_GXX=$( glocate libstdc++.a | grep Cellar | grep $GCC_VERSION | grep -v i386 | grep -v gdb.py )

export PATH=/usr/local:/usr/local/bin:/usr/local/lib:/usr/bin/cmake:$PATH

# define where 'make copy' will place executables
export INSTALL_PREFIX=/usr/local/bin

# define other variables for use in the CMakeList.txt file
# options are "Release" or "Debug"
export BUILD_TYPE="DEBUG"
export SYSTEM_TYPE="MacOS"

# define platform and compiler specific compilation flags
export CMAKE_CXX_FLAGS_DEBUG="-O0 -g -ggdb"
export CMAKE_CXX_FLAGS_RELEASE="-O2 -mtune=native -Wno-maybe-uninitialized"

cmake "../../.." -G "Unix Makefiles"                         \
-DSYSTEM_TYPE="$SYSTEM_TYPE "                                \
-DCMAKE_BUILD_TYPE="$BUILD_TYPE "                            \
-DLIB_GCC="$LIB_GCC "                                        \
-DLIB_GXX="$LIB_GXX "                                        \
-DCMAKE_EXE_LINKER_FLAGS="$CMAKE_EXE_LINKER_FLAGS "          \
-DCMAKE_INSTALL_PREFIX:PATH="$INSTALL_PREFIX "               \
-DCMAKE_CXX_FLAGS_DEBUG="$CMAKE_CXX_FLAGS_DEBUG "            \
-DCMAKE_CXX_FLAGS_RELEASE="$CMAKE_CXX_FLAGS_RELEASE"

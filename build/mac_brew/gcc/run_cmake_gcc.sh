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
export CC=clang
export CXX=clang++
export CXXFLAGS="-std=c++11 -stdlib=libc++"


#export GCC_VERSION=7.2.0
# set CMAKE-related and build-related variables
#export GCCLIST=$( glocate gcc-7 | grep Cellar | grep bin | grep $GCC_VERSION )
#export GCCARR=($GCCLIST)
#export GCC=${GCCARR[1]}

#export GXXLIST=$( glocate g++-7 | grep Cellar | grep bin | grep $GCC_VERSION )
#export GXXARR=($GXXLIST)
#export GXX=${GXXARR[1]}

export CMAKEROOT=/usr/bin/cmake
export R_HOME=/usr/bin/R

export LIB_PROJ=$( glocate libproj.a | grep Cellar )
# export LIB_CURL=$( glocate libcurl.a | grep Cellar )
# export LIB_SSL=$(glocate libssl.a | grep Cellar )
# export LIB_DAP=$( glocate libdap.a | grep Cellar )
# export LIB_LDAP=$( glocate libldap.a)
# export LIB_Z=$( glocate libz.a | grep Cellar )
# export LIB_LWGEOM=$( glocate liblwgeom.a | grep Cellar | grep postgis)
export LIB_ICONV=$( glocate libiconv.a | grep Cellar )
export LIB_PQ=$( glocate libpq.a | grep Cellar )
# export LIB_PCRE=$( glocate libpcre.a | grep Cellar )
# export LIB_JSON_C=$( glocate libjson-c.a | grep Cellar )
# export LIB_FREEXL=$( glocate libfreexl.a | grep Cellar )
export LIB_GEOS=$( glocate libgeos.a | grep Cellar )
export LIB_GEOS_C=$( glocate libgeos_c.a | grep Cellar )
# export LIB_EXPAT=$( glocate libexpat.a | grep Cellar )
# export LIB_JPEG=$( glocate libjpeg.a | grep Cellar )
# export LIB_PNG=$( glocate libpng.a | grep Cellar )
# export LIB_GIF=$( glocate libgif.a | grep Cellar )
# export LIB_TIFF=$( glocate libtiff.a | grep Cellar )
# export LIB_GEOTIFF=$( glocate libgeotiff.a | grep Cellar )
# export LIB_SPATIALITE=$( glocate libspatialite.a | grep Cellar )
# export LIB_SQLITE3=$( glocate libsqlite3.a | grep Cellar )
# export LIB_XML2=$( glocate libxml2.a | grep Cellar )

export LIB_GDAL=/Users/smwesten/SMWData/Static/Source_Code/gdal/gdal/.libs/libgdal.a
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
-DLIB_PQ="$LIB_PQ "                                          \
-DLIB_Z="$LIB_Z "                                            \
-DLIB_PCRE="$LIB_PCRE "                                      \
-DLIB_LWGEOM="$LIB_LWGEOM "                                  \
-DLIB_CURL="$LIB_CURL "                                      \
-DLIB_SSL="$LIB_SSL "                                        \
-DLIB_DAP="$LIB_DAP "                                        \
-DLIB_LDAP="$LIB_LDAP "                                      \
-DLIB_ICONV="$LIB_ICONV "                                    \
-DLIB_PROJ="$LIB_PROJ "                                      \
-DLIB_JSON_C="$LIB_JSON_C "                                  \
-DLIB_FREEXL="$LIB_FREEXL "                                  \
-DLIB_GDAL="$LIB_GDAL "                                      \
-DLIB_GEOS="$LIB_GEOS "                                      \
-DLIB_GEOS_C="$LIB_GEOS_C "                                  \
-DLIB_JPEG="$LIB_JPEG "                                      \
-DLIB_PNG="$LIB_PNG "                                        \
-DLIB_GIF="$LIB_GIF "                                        \
-DLIB_TIFF="$LIB_TIFF "                                      \
-DLIB_GEOTIFF="$LIB_GEOTIFF "                                \
-DLIB_SPATIALITE="$LIB_SPATIALITE "                          \
-DLIB_SQLITE3="$LIB_SQLITE3 "                                \
-DLIB_EXPAT="$LIB_EXPAT "                                    \
-DLIB_XML2="$LIB_XML2 "                                      \
-DLIB_GCC="$LIB_GCC "                                        \
-DLIB_GXX="$LIB_GXX "                                        \
-DCMAKE_INSTALL_PREFIX:PATH="$INSTALL_PREFIX "               \
-DCMAKE_CXX_FLAGS_DEBUG="$CMAKE_CXX_FLAGS_DEBUG "            \
-DCMAKE_CXX_FLAGS_RELEASE="$CMAKE_CXX_FLAGS_RELEASE"

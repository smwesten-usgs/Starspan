StarSpan
=========

StarSpan is designed to bridge the raster and vector worlds of spatial
analysis using fast algorithms for pixel level extraction from
geometry features (points, lines, polygons). StarSpan generates
databases of extracted pixel values (from one or a set of raster
images), fused with the database attributes from the vector files.
This allows a user to do statistical analysis of the pixel vs.
attribute data in many existing packages and can greatly speed up
classification training and testing. See the documentation for more
details about commands, operations, and options.

This development has been possible thanks to California State
Department of Boating and Waterways.

StarSpan should compile and run on most Unix flavor (including MacOs X
and Windows via MinGW) although it has been mainly tested on Linux and
MacOS X. StarSpan's core program is run from the command line. An
experimental Java-based graphical user interface (GUI) is also
available.


Installing StarSpan on Ubuntu 10.04
------------------------------------

This fork builds clean against Ubuntu 10.04. 
We have built StarSpan using the EC2 AMI: ami-714ba518.

    sudo apt-get update
    sudo apt-get -y install build-essential wget libgeos-3.1.0 libgeos-dev libgdal1-1.6.0 libgdal1-dev
    cd /tmp
    wget http://github.com/tokumine/Starspan/tarball/1.0.08g
    tar zxvf tokumine-Starspan-*
    cd tokumine-Starspan-*
    ./configure
    make
    sudo make install

Installing StarSpan on other systems
------------------------------------

StarSpan requires the GDAL and GEOS libraries properly installed on 
your system. For more details, see INSTALL.

Status and documentation 
-------------------------

This is an open source software project and you are welcome to use the
tool and contribute to this ongoing project. Please read the copyright
agreement (copyright.txt). We encourage feature requests and bug
reports, and these can be posted on the gforge website at:
http://casil.ucdavis.edu/projects/starspan/ 
The main website is located at: http://starspan.casil.ucdavis.edu/


--------------------------------------------------------


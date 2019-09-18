#!/bin/bash

mkdir work
mkdir work/jdk
mkdir work/tomcat
mkdir work/tcnative
tar -xvzf tomcat_latest.tar.gz --strip 1 -C work/tomcat
tar -xvzf jdk_latest.tar.gz --strip 1 -C work/jdk
tar -xvzf work/tomcat/bin/tomcat-native.tar.gz --strip 1 -C work/tcnative
cd work/tcnative/native
./configure --with-java-home="../../jdk" --prefix=$(pwd)/compiled && make && make install
cp compiled/lib/libtcnative-1.so ../../jdk/lib/
cd ../..
tar -cvzf jdk_latest_with_apr.tar.gz jdk



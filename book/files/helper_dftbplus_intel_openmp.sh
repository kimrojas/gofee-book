#!/bin/bash

# Recipe needs to run in the following order:
# 1. ./helper_dftbplus_intel_openmp.sh config
# 2. ./helper_dftbplus_intel_openmp.sh build
# 3. ./helper_dftbplus_intel_openmp.sh test
# 4. ./helper_dftbplus_intel_openmp.sh install
# This is just configures, builds, test and installs 

INP=$1
maindir='intelomp'
builddir="./${maindir}/_build"
installdir="./${maindir}/_install"
srcdir="./"

compiler_opt='FC=mpiifort CC=mpiicc'
python_opt='-DENABLE_DYNAMIC_LOADING=1 -DWITH_PYTHON=1 -DBUILD_SHARED_LIBS=1 -DWITH_API=1'
ase_opt='-DWITH_SOCKETS=1'

CMAKE_OPT="-DCMAKE_INSTALL_PREFIX=${installdir} ${compiler_opt} ${python_opt} ${ase_opt} -DTEST_OMP_THREADS=2"

buildlog='build.log'
configlog='config.log'
testlog='test.log'
installlog='install.log'

if [ $INP == 'config' ]
then
    rm -rf $builddir
    mkdir -p $builddir
    command="$option cmake $CMAKE_OPT -B $builddir $srcdir | tee ./$maindir/$configlog"
    eval $command
elif [ $INP == 'build' ]
then
    command="cmake --build $builddir -- -j  | tee ./$maindir/$buildlog"
    eval $command
elif [ $INP == 'test' ]
then
    cd $builddir
    command="ctest -j2 | tee ./$testlog"
    eval $command
    cd ..
elif [ $INP == 'install' ]
then
    command="cmake --install $builddir | tee ./$builddir/$installlog"
    eval $command
else
    echo "Wrong input. Choose 'config', 'build' or 'test'"
fi
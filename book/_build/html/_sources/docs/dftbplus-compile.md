# Compiling DFTB+

DFTB+ can be compiled with 4 parallelism types:

1. Serial (non-parallelized)
2. OpenMP (parallelize via threads, shared memory)
3. MPI (parallelize via mpi, distributed memory)
4. OpenMP-MPI hybrid (parallelize via thread and mpi, not discussed)

In this section, installation method of OpenMP will be discussed. 

```{admonition} What to use: Serial, OpenMP or MPI
:class: tip
**Serial** is just good for testing. 

**OpenMP** seems good for relatively small systems that uses a single node.

**MPI** *may* be better for larger systems that requires more than a single node. For small systems, MPI takes longer than OpenMP. 

Between **OpenMP** and **MPI**, OpenMP parallization is the default way of using DFTB+. Its usage is also heavily documented. MPI, on the otherhand, is not. The non-MPI version supports more excited state methods, while the MPI version has better parallelism for many tasks.
```


## DFTB+ OpenMP setup

### Load compilers and python environment

```bash
# Load compilers
module load cmake/3.18.3
module load intel/2020.2.254
module load intelmpi/2020.2.254
module load python/3.8

# Load python environment
source activate tutorial
```

### Download and use the DFTB+ installer

We will use the DFTB+ version 22.1 (Other releases are available [here](https://github.com/dftbplus/dftbplus/releases/))

I assume that `tutorial_files` is in the home directory.

#### 1. Prepare the installation directory

```bash
# Download source files
tutordir=~/tutorial_files
mkdir -p $tutordir/apps && cd $tutordir/apps
```

#### 2. Install using the automation script

Download the installer. There are two installers available: (a) OpenMP version and (b) MPI version. Feel free to choose any, but here we use OpenMP version.

**OpenMP version** Installer

```bash
wget https://raw.githubusercontent.com/kimrojas/gofee-book/master/book/files/install-dftb-openmp.py
chmod +x install-dftb-openmp.py
./install-dftb-openmp.py
```

```{admonition} Want the MPI version?
:class: tip
In case you want the MPI version, it is available here: 
[install-dftb-mpi.py](https://raw.githubusercontent.com/kimrojas/gofee-book/master/book/files/install-dftb-mpi.py)

It works and has been tested very slightly. Hard to use.
```

#### 3. Declare the path

The Installer script will return an advice on how to properly declare the PATHing of DFTB+.
In my case, it looks like this:

```
SHOWING IMPORTANT PATHS
BASE DIRECTORY = /home/krojas/tutorial_files/apps/dftbplus-22.1-OpenMP/_install
- - - - -
add to PATH            : /home/krojas/tutorial_files/apps/dftbplus-22.1-OpenMP/_install/bin
add to LD_LIBRARY_PATH : /home/krojas/tutorial_files/apps/dftbplus-22.1-OpenMP/_install/lib64
add to PYTHONPATH      : /home/krojas/tutorial_files/apps/dftbplus-22.1-OpenMP/_install/lib/python3.8/site-packages/pythonapi-0.1-py3.8.egg
set variable DFTB_LIB  :  /home/krojas/tutorial_files/apps/dftbplus-22.1-OpenMP/_install/lib64
- - - - -
SLAKOS FILES
https://dftb.org/parameters/download/all-sk-files
```

There are a few ways to declare this: (a) Update startup script (bashrc or bash_profile), (b) custom module environment, or (c) exporter script. For simplicity, let's create an exporter script.

Create an 'activate_dftb.sh' file:

```bash
#!/bin/bash
export PATH=/home/krojas/tutorial_files/apps/dftbplus-22.1-OpenMP/_install/bin:$PATH
export LD_LIBRARY_PATH=/home/krojas/tutorial_files/apps/dftbplus-22.1-OpenMP/_install/lib64:$LD_LIBRARY_PATH
export PYTHONPATH=/home/krojas/tutorial_files/apps/dftbplus-22.1-OpenMP/_install/lib/python3.8/site-packages/pythonapi-0.1-py3.8.egg:$PYTHONPATH
export DFTB_LIB=/home/krojas/tutorial_files/apps/dftbplus-22.1-OpenMP/_install/lib64
```

From now on, we just use this script to activate dftb+,

```bash
source ~/tutorial_files/apps/activate_dftb.sh
```

## TESTING THE EXECUTABLE

To test the executable we compiled, simply follow the steps
```bash
# Make sure of the following environment are activate
# module load cmake/3.18.3
# module load intel/2020.2.254
# module load intelmpi/2020.2.254
# module load python/3.8

# source activate tutorial

# source ~/tutorial_files/apps/activate_dftb.sh

cd ~/tutorial/test_suite/01_dftb_ase
./run.sh
```

It should return the energies without error. 









# DFTB+ via compilation

DFTB+ can be compiled with 4 parallelism types:

1. Serial (non-parallelized)
2. OpenMP (parallelize via threads)
3. MPI (parallelize via mpi)
4. OpenMP-MPI hybrid (parallelize via thread and mpi, not discussed)

In this section, installation method of OpenMP will be discussed. 

```{admonition} What to use: Serial, OpenMP or MPI
:class: tip
**Serial** is just good for testing. 

**OpenMP** seems good for relatively small systems that uses a single node.

**MPI** *may* be better for larger systems that requires more than a single node. For small systems, MPI takes longer than OpenMP. 
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

### Download the DFTB+ package

We will use the DFTB+ version 22.1 (Other releases are available [here](https://github.com/dftbplus/dftbplus/releases/))

I assume that `tutorial_files` is in the home directory.

```bash
# Download source files
cd ~/tutorial_files/apps
wget https://github.com/dftbplus/dftbplus/archive/refs/tags/22.1.tar.gz
tar zxvf 22.1.tar.gz 
cd dftbplus-22.1

# Download external components
./utils/get_opt_externals
```

### Use helper codes for the recipe

<!-- For intel-based OpenMP: {download}`HELPER File <https://raw.githubusercontent.com/kimrojas/gofee-book/master/files/helper_dftbplus_intel_openmp.sh>` -->

For intel-based OpenMP: {download}`HELPER File <../files/helper_dftbplus_intel_openmp.sh>`













<!-- 


## Using available Quantum Espresso

A compiled and optimized quantum espresso is already made so you just need to use it. To use it:

### Add the custom modules to ~/.bashrc
```bash
echo "module use --append /home/krojas/share/modulefiles" >> ~/.bashrc

# Refresh environment
source ~/.bashrc
```

### Activate the environment
```bash
module load qe/7.0
```

-----

## Compiling from source files

If you wish to compile your own or a different version of Quantum Espresso, the following procedure is the recipe for the compiled Quantum Espresso discussed above. 

:::{note}
The compiled Quantum Espresso is okay to use in most general calculations
:::

### Download the source files

The source file releases can be found in [QE Releases](https://gitlab.com/QEF/q-e/-/tags). In this specific tutorial, we use the [QE 7.0 Release](https://gitlab.com/QEF/q-e/-/releases/qe-7.0)

```bash
# Download
wget https://gitlab.com/QEF/q-e/-/archive/qe-7.0/q-e-qe-7.0.tar.gz
# Extract
tar zxvf q-e-qe-7.0.tar.gz
```

### Activate compiler environment

We need to activate the required depdendency modules.

```bash
module load cmake/3.18.3
module load intel/2020.2.254
module load intelmpi/2020.2.254
module load python/3.8
module load libxc/5.2.2
module load git/2.17
```

### Build and install

Follow the following commands:

```bash
# Initialize build directory
mkdir q-e-qe-7.0/_build
cd q-e-qe-7.0/_build

# Build
cmake \
    -DQE_ENABLE_MPI=ON \
    -DQE_ENABLE_TEST=ON \
    -DQE_ENABLE_SCALAPACK=ON \
    -DQE_FFTW_VENDOR=Intel_DFTI \
    -DCMAKE_C_COMPILER=mpiicc \
    -DCMAKE_Fortran_COMPILER=mpiifort \
    -DCMAKE_INSTALL_PREFIX=../_install \
    -DQE_ENABLE_LIBXC=ON \
    ../

# Compile
make -j8

# Install
make install
```

### Add to PATH

Add the compiled executables (fancy way to say "program") to the PATH so it can be discovered by the system

```{note}
Replace `<full-QE-directory-path>` with the full path of your quantum espresso directory.
```

```bash
echo 'export PATH=<full-QE-directory-path>/q-e-qe-7.0/_install/bin:$PATH' >> ~/.bashrc

source ~/.bashrc
```



 -->

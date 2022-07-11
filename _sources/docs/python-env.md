# Python environment

This part can be considered as the most difficult part due to latest version of dependencies breaking compatability.

## General requirements

### GOFEE

1. python (3.6.3 or newer)
2. ASE (3.17 or newer)
3. cython (0.28 or newer)
4. cymem (1.31.2 or newer)
5. mpi4py (3.0 or newer)

### DFTB+ 
1. numpy (any except 1.23.1)
2. ASE

```{warning}
NUMPY version 1.23.1 breaks the ASE and DFTB+ compatability which is a core process in the calculations.
```

### Custom requirements

The following requirements are tested (locally and on smith). The versions are hard set for future reproducability. 

1. numpy etc
2. ase etc


## Creating the python environment

```bash
envname='tutorial'
conda create -c conda-forge -n $envname python=3.8 python=3.8.13 ase=3.22.1 cymem=2.0.6 cython=0.29.30 mpi4py=3.1.3 numpy=1.22.1 pytest=7.1.2  scikit-learn=1.1.1 scipy=1.8.1 dscribe=1.2.1 matplotlib=3.5.2 

```
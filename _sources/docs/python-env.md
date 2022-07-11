# Python environment

This part can be considered as the most difficult part due to latest version of dependencies breaking compatability.

GOFEE requirements are

1. python (3.6.3 or newer)
2. ASE (3.17 or newer)
3. cython (0.28 or newer)
4. cymem (1.31.2 or newer)
5. mpi4py (3.0 or newer)

DFTB+ 
1. numpy (any except 1.23.1)

```{warning}
NUMPY version 1.23.1 breaks the ASE and DFTB+ compatability which is a core process in the calculations.
```
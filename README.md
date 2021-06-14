# ccmi2022-ukca
UKCA scripts for data conversion for CCMI2022

For use on JASMIN platform with the module `jaspy/3.7/r20200606`.

The NetCDF files created are viewable by `Xconv` or `ncview`.

When using the `DECADE` variable for submitting to lotus, use the following command, e.g.
```
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_o3_r2.sh ; done
```

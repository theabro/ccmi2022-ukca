# ccmi2022-ukca
UKCA scripts for data conversion for CCMI2022

For use on JASMIN platform with the module `jaspy/3.7`.

The NetCDF files created are viewable by `Xconv` or `ncview`. If the files have been created in an iPython environment they may not work with Xconv - the reasons for this are currently unknown.

When using the `DECADE` variable for submitting to lotus, use the following command, e.g.
```
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_o3_r2.sh ; done
```

To extract the variables from the MASS dataset, use the following `moo select` command, e.g.
```
nohup moo select -v -I /home/users/nlabraham/git/ccmi2022-ukca/stash/ccmi2022_v4.stash moose:/crum/u-cd797/apn.pp ./apn4.pp &> v4_1.sel &
```

If all files are in the same directory, the following command will list them by variable name, giving the total number of each and allow file-sizes to be compared (useful when checking for missing files)
```
for i in `ls *.nc | awk -F\_ '{print $1}' | sort -u`; do echo $i `ls ${i}_*.nc | wc`; ls -l ${i}_*.nc ; done | less
```

Compile the fortran by
```
f2py -c -m pressureconv pressureconv.f90
```

The script `cly_bry.py` should be used separately once the corresponding Cl & Br species AmonZ files have been written to construct the summed Cly & Bry files. 

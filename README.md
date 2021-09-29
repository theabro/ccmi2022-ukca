# ccmi2022-ukca

UKCA scripts for data conversion for CCMI2022. These are based on the [PPNC tool](https://github.com/rcurr/ppnc) written for CCMI1.


## Technical information

For use on JASMIN platform with the module `jaspy/3.7`.

Compile the fortran file by
```
f2py -c -m pressureconv pressureconv.f90
```
 
The NetCDF files created are viewable by `Xconv` or `ncview`. If the files have been created in an iPython environment they may not work with Xconv - the reasons for this are currently unknown.


## Using these scripts

To convert a variable considering all possible times you run these scripts like
```
python /home/users/nlabraham/git/ccmi2022-ukca/src/convert_pp2nc.py -f h2o_z.json -r refD1_r1i1p1f2_apo.json -s AmonZ
```
It is also recommended to wrap these in SLURM commands and submit to LOTUS. 

For large datasets you can use the `DECADE` variable e.g.
```
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/Amon/submit_o3_r2.sh ; done
```
This will then break the output files into 10-year chunks, each one submitted to the batch system independently. For some files you may need to use the `high-mem` queue and increase the allowed memory.

There are a large number of different scripts in the `lotus` directory for submitting the conversion of different variables to the batch system.

The script [cly_bry.py](src/cly_bry.py) should be used separately once the corresponding Cl & Br species AmonZ files have been written to construct the summed Cly & Bry files. This can be run on the command line.


### Available command-line options

Option | Description
-------|-------------
`-o` / `--odir` | Top-level of the output directory, e.g. `/gws/nopw/j04/ukca_vol2/nlabraham/CCMI2022/upload` (default)
`-s` / `--stream` | Output table requested, e.g. `A10dayPt`, `Aday`, `AdayZ`, `Amon` (default), or `AmonZ`
`-j` / `--json_dir` | Directory containing the JSON tables from [ccmi-2022](https://github.com/cedadev/ccmi-2022), e.g. `/home/users/nlabraham/git/ccmi-2022/Tables` (default)
`-e` / `--ens_dir` | Directory containing the ensemble member JSON file, e.g. `/home/users/nlabraham/git/ccmi2022-ukca/ens` (default)
`-r` / `--ens_file` | Name of ensemble member file, e.g. `refD1_r1i1p1f2_apn.json` (default)
`-v` / `--var_dir` | Directory containing the variable JSON file, e.g. `/home/users/nlabraham/git/ccmi2022-ukca/vars` (default)
`-f` / `--var_file` | Name of variable file, e.g. `toz.json` (default)
`-d` / `--decade` | Decade to start taking data from, e.g. `1960`, `1990`, `2010` etc. Using a value of **0** (default) will result in all time points being considered.


## Extracting fields from pp files on MASS using `moo select`

To extract the variables from the MASS dataset, use the following `moo select` command, e.g.
```
nohup moo select -v -I /home/users/nlabraham/git/ccmi2022-ukca/stash/ccmi2022_v4.stash moose:/crum/u-cd797/apn.pp ./apn4.pp &> v4_1.sel &
```


## Output files

Output files will be placed in a directory structure from a base directory, e.g.
```
upload/CCMI2022/model-output/NCAS-CAMBRIDGE/UKESM1-StratTrop/refD1/mon/atmos/monthly/r1i1p1f2/v20210924/h2o
```
etc.

If you place all files in the same directory, the following command will list them by variable name, giving the total number of each and allow file-sizes to be compared (useful when checking for missing files)
```
for i in `ls *.nc | awk -F\_ '{print $1}' | sort -u`; do echo $i `ls ${i}_*.nc | wc`; ls -l ${i}_*.nc ; done | less
```


## How the scripts are controlled

Information on how the files should be output, including various metadata values and information on the co-ordinates, are taken from Tables provided in the [ccmi-2022](https://github.com/cedadev/ccmi-2022) repository. The scripts read from a local copy.

The scripts are controlled by different JSON-format input files contained in the `ens` and `vars` directories. The `ens` files describe the input data and the `vars` files describe the input variable. 

Usually data is kept on the input grid, but it is possible to interpolate to pressure levels by providing additional information about the pressure field - see the [h2o_z_pinterp.json](vars/h2o_z_pinterp.json) file for information here. For AmonZ fields on pressure levels a Heaviside function is required - see e.g. the [o3_z.json](vars/o3_z.json) file for an example here. The field is divided by the Heaviside function to mask the data correctly. 

The information in the `ens` files covers the experiment, the ensemble member, suite-ids used, and the location of the data on a JASMIN GWS. See, for example, [refD1_r1i1p1f2_apo.json](ens/refD1_r1i1p1f2_apo.json).

#!/bin/bash

# submit all the current fields to the lotus queues

for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/submit_wa_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/submit_wa_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/submit_wa_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/submit_zg_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/submit_zg_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/submit_zg_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/submit_cl_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/submit_cl_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/submit_cl_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/submit_clc_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/submit_clc_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/submit_clc_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/submit_tntrs_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/submit_tntrs_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/submit_tntrs_r3.sh ; done

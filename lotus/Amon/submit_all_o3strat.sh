#!/bin/bash

# submit all the current fields to the lotus queues

for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3strat_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3strat_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3strat_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3stratloss_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3stratloss_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3stratloss_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3stratdep_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3stratdep_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3stratdep_r3.sh ; done

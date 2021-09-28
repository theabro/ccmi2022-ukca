#!/bin/bash

# submit all the current fields to the lotus queues

sbatch --export=ALL,DECADE=1960 /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3strat_r1.sh 
sbatch --export=ALL,DECADE=1980 /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3strat_r1.sh 
sbatch --export=ALL,DECADE=1990 /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3strat_r1.sh 
sbatch --export=ALL,DECADE=2000 /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3strat_r1.sh
sbatch --export=ALL,DECADE=1960 /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3strat_r2.sh
sbatch --export=ALL,DECADE=1990 /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3stratloss_r2.sh
sbatch --export=ALL,DECADE=1970 /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3stratdep_r3.sh

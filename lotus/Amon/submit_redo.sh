#!/bin/bash

# resubmit all the failed fields to the lotus queues

sbatch --export=ALL,DECADE=1990 /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_va_r1.sh
sbatch --export=ALL,DECADE=1990 /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_wa_r2.sh
sbatch --export=ALL,DECADE=1990 /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_va_r3.sh
sbatch --export=ALL,DECADE=1960 /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ta_r3.sh
sbatch --export=ALL,DECADE=1960 /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ua_r3.sh
sbatch --export=ALL,DECADE=1970 /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ua_r3.sh
sbatch --export=ALL,DECADE=2010 /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ua_r3.sh

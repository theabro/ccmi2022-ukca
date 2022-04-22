| `moo select` file | directory | notes | `moo` command |
|-------------------|-----------|-------|---------------|
| ccmi2022_v1.stash       | apn.pp  |monthly files | `nohup moo select -v /home/users/nlabraham/git/ccmi2022-ukca/stash/ccmi2022_v1.stash moose:/crum/u-cj037/apn.pp ./apn.pp &> v1.sel 2>&1 &` |
| ccmi2022_v2.stash       | apn2.pp | monthly files | `nohup moo select -v /home/users/nlabraham/git/ccmi2022-ukca/stash/ccmi2022_v2.stash moose:/crum/u-cj037/apn.pp ./apn2.pp &> v2.sel 2>&1 &` |
| ccmi2022_v3.stash       | apn3.pp | monthly files | `nohup moo select -v /home/users/nlabraham/git/ccmi2022-ukca/stash/ccmi2022_v3.stash moose:/crum/u-cj037/apn.pp ./apn3.pp &> v3.sel 2>&1 &` |
| ccmi2022_v4.stash       | apn4.pp | monthly files | `nohup moo select -v /home/users/nlabraham/git/ccmi2022-ukca/stash/ccmi2022_v4.stash moose:/crum/u-cj037/apn.pp ./apn4.pp &> v4.sel 2>&1 &` |
| ccmi2022_v5.stash       | apn5.pp | monthly files | `nohup moo select -v /home/users/nlabraham/git/ccmi2022-ukca/stash/ccmi2022_v5.stash moose:/crum/u-cj037/apn.pp ./apn5.pp &> v5.sel 2>&1 &` |
| ccmi2022_hono2.stash    | ap4.pp  | monthly files (p levs) | `nohup moo select -v /home/users/nlabraham/git/ccmi2022-ukca/stash/ccmi2022_hono2.stash moose:/crum/u-cj037/ap4.pp ./ap4.pp &> hono2.sel 2>&1 &` |
| ccmi2022_v6_1960s.stash | | | |
| ccmi2022_v6_1970s.stash | | | |
| ccmi2022_v6_1980s.stash | | | |
| ccmi2022_v6_1990s.stash | apr.pp | daily files (p levs) | |
| ccmi2022_v6_2000s.stash | | |	|
| ccmi2022_v6_2010s.stash | | |	|
| ccmi2022_v6_9dec.stash  | | |	|
| GET command - ALL FILES | apo.pp  | monthly files (p levs) | `nohup moo get -v moose:/crum/u-cj037/apo.pp/*.pp . &> ../apo.get 2>&1 &` |

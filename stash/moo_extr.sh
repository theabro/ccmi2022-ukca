#!/bin/bash

# cope with suite-id in either u-ab123 OR ab123 formats
sid=u-`echo $1 | awk -F\- '{print $NF}'`

sdir=/home/users/nlabraham/git/ccmi2022-ukca/stash

# can get all of apo
nohup moo get -v moose:/crum/${sid}/apo.pp/*.pp ./apo.pp/. &> apo.get 2>&1 &

# selects - apn stream is split across multiple dirs
nohup moo select -v ${sdir}/ccmi2022_v1.stash moose:/crum/${sid}/apn.pp ./apn.pp &> v1.sel 2>&1 &
nohup moo select -v ${sdir}/ccmi2022_v2.stash moose:/crum/${sid}/apn.pp ./apn2.pp &> v2.sel 2>&1 &
nohup moo select -v ${sdir}/ccmi2022_v3.stash moose:/crum/${sid}/apn.pp ./apn3.pp &> v3.sel 2>&1 &
nohup moo select -v ${sdir}/ccmi2022_v4.stash moose:/crum/${sid}/apn.pp ./apn4.pp &> v4.sel 2>&1 &
nohup moo select -v ${sdir}/ccmi2022_v5.stash moose:/crum/${sid}/apn.pp ./apn5.pp &> v5.sel 2>&1 &
nohup moo select -v ${sdir}/ccmi2022_hono2.stash moose:/crum/${sid}/ap4.pp ./ap4.pp &> hono2.sel 2>&1 &

# do the v6 by decade
nohup moo select -v ${sdir}/ccmi2022_v6_1960s.stash moose:/crum/${sid}/apr.pp ./apr.pp &> v6_1960s.sel 2>&1 &
nohup moo select -v ${sdir}/ccmi2022_v6_1970s.stash moose:/crum/${sid}/apr.pp ./apr.pp &> v6_1970s.sel 2>&1 &
nohup moo select -v ${sdir}/ccmi2022_v6_1980s.stash moose:/crum/${sid}/apr.pp ./apr.pp &> v6_1980s.sel 2>&1 &
nohup moo select -v ${sdir}/ccmi2022_v6_1990s.stash moose:/crum/${sid}/apr.pp ./apr.pp &> v6_1990s.sel 2>&1 &
nohup moo select -v ${sdir}/ccmi2022_v6_2000s.stash moose:/crum/${sid}/apr.pp ./apr.pp &> v6_2000s.sel 2>&1 &
nohup moo select -v ${sdir}/ccmi2022_v6_2010s.stash moose:/crum/${sid}/apr.pp ./apr.pp &> v6_2010s.sel 2>&1 &

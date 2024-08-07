@echo off

call set_env.cmd

call br_load_bvlncmbr.cmd %1\BVLNCMBR

call br_load_bvlncmaa.cmd %1\BVLNCMAA

call br_load_bvlncmac.cmd %1\BVLNCMAC

call br_load_bvddclims.cmd %1\BVDDCLIMS

call br_load_bvcdclims.cmd %1\BVCDCLIMS

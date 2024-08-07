@echo off

call ..\set_db2_env.cmd

call si_load_cU005.cmd %1\CU005BOST

call si_load_ca001.cmd %1\CA001BOST

call si_load_ca015.cmd %1\CA015BOST

call si_load_cO025.cmd %1\CO025BOST

call si_load_cO022.cmd %1\CO022BOST

call si_load_cO023.cmd %1\CO023BOST

call si_load_sh001.cmd %1\SH001BOST

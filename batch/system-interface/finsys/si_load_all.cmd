@echo off

call ..\set_db2_env.cmd

call si_load_cu006.cmd

call si_load_cu007.cmd

call si_load_cu002.cmd

call si_load_ca001.cmd

call si_load_ca017.cmd

call si_load_ca018.cmd
#!/bin/bash

. ../set_db2_env.sh

"$DB2_HOME"/bin/db2 call SI_RUN_TEMP_ARBS_CA019

"$DB2_HOME"/bin/db2 call si_run_temp_arbs_co015

"$DB2_HOME"/bin/db2 call si_run_temp_arbs_co016

"$DB2_HOME"/bin/db2 call si_run_temp_arbs_co017

"$DB2_HOME"/bin/db2 call si_run_temp_arbs_co018

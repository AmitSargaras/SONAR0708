mkdir ..\mock-backup

pushd ..\mock-backup

db2 connect to CLIMS_LC user db2admin using db2admin

db2move CLIMS_LC export -sn CLIMS_LOCAL

popd
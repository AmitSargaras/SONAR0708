#!/bin/bash

MSG_DIR=/cms/simessage/ASOA
export MSG_DIR

chmod 777 $MSG_DIR/*

. ../set_db2_env.sh

. hp_load_pf100.cmd $MSG_DIR/PF100ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf101.cmd $MSG_DIR/PF101ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf102.cmd $MSG_DIR/PF102ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf103.cmd $MSG_DIR/PF103ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf104.cmd $MSG_DIR/PF104ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf105.cmd $MSG_DIR/PF105ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf106.cmd $MSG_DIR/PF106ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf107.cmd $MSG_DIR/PF107ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf108.cmd $MSG_DIR/PF108ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf109.cmd $MSG_DIR/PF109ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf110.cmd $MSG_DIR/PF110ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf111.cmd $MSG_DIR/PF111ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf112.cmd $MSG_DIR/PF112ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf113.cmd $MSG_DIR/PF113ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf114.cmd $MSG_DIR/PF114ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf115.cmd $MSG_DIR/PF115ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf116.cmd $MSG_DIR/PF116ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf117.cmd $MSG_DIR/PF117ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf118.cmd $MSG_DIR/PF118ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf119.cmd $MSG_DIR/PF119ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf120.cmd $MSG_DIR/PF120ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf121.cmd $MSG_DIR/PF121ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf122.cmd $MSG_DIR/PF122ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf123.cmd $MSG_DIR/PF123ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf124.cmd $MSG_DIR/PF124ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf125.cmd $MSG_DIR/PF125ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf126.cmd $MSG_DIR/PF126ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf127.cmd $MSG_DIR/PF127ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf128.cmd $MSG_DIR/PF128ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf129.cmd $MSG_DIR/PF129ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf130.cmd $MSG_DIR/PF130ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf131.cmd $MSG_DIR/PF131ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf132.cmd $MSG_DIR/PF132ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf133.cmd $MSG_DIR/PF133ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf134.cmd $MSG_DIR/PF134ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf135.cmd $MSG_DIR/PF135ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf136.cmd $MSG_DIR/PF136ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf137.cmd $MSG_DIR/PF137ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf138.cmd $MSG_DIR/PF138ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf139.cmd $MSG_DIR/PF139ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf140.cmd $MSG_DIR/PF140ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf141.cmd $MSG_DIR/PF141ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf142.cmd $MSG_DIR/PF142ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf143.cmd $MSG_DIR/PF143ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf144.cmd $MSG_DIR/PF144ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf145.cmd $MSG_DIR/PF145ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf146.cmd $MSG_DIR/PF146ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf147.cmd $MSG_DIR/PF147ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf148.cmd $MSG_DIR/PF148ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf149.cmd $MSG_DIR/PF149ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf150.cmd $MSG_DIR/PF150ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf151.cmd $MSG_DIR/PF151ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf152.cmd $MSG_DIR/PF152ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf153.cmd $MSG_DIR/PF153ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf154.cmd $MSG_DIR/PF154ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf155.cmd $MSG_DIR/PF155ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf156.cmd $MSG_DIR/PF156ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf157.cmd $MSG_DIR/PF157ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf158.cmd $MSG_DIR/PF158ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf159.cmd $MSG_DIR/PF159ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf160.cmd $MSG_DIR/PF160ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf161.cmd $MSG_DIR/PF161ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf162.cmd $MSG_DIR/PF162ARBS /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf200.cmd $MSG_DIR/PF200TSPR /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf201.cmd $MSG_DIR/PF201TSPR /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf202.cmd $MSG_DIR/PF202TSPR /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf203.cmd $MSG_DIR/PF203TSPR /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf204.cmd $MSG_DIR/PF204TSPR /cms/batch/system-interface/dump_file.txt log_file.txt csv
. hp_load_pf205.cmd $MSG_DIR/PF205TSPR /cms/batch/system-interface/dump_file.txt log_file.txt csv
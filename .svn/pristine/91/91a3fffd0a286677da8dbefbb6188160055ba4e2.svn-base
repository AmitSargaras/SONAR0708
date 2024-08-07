@echo off

call set_mig_env.cmd


db2 drop tablespace cms_mig

db2 drop bufferpool cms_mig_buf

db2 drop tablespace cms_mig_index

db2 drop bufferpool cms_mig_idx_buf


db2 create bufferpool cms_mig_buf size 4096 pagesize 32k extended storage

db2 create tablespace cms_mig pagesize 32768 managed by database using (FILE 'D:\db2\CMS_MIG' 8000) AUTORESIZE YES INCREASESIZE 50 M MAXSIZE NONE bufferpool cms_mig_buf


db2 create bufferpool cms_mig_idx_buf size 2000 pagesize 8k extended storage

db2 create tablespace cms_mig_index pagesize 8192 managed by database using (FILE 'D:\db2\CMS_MIG_INDEX' 20000) AUTORESIZE YES INCREASESIZE 50 M MAXSIZE NONE bufferpool cms_mig_idx_buf


db2 -td@ -f cms_create_mig_error_log.sql -l cms_create_mig_error_log.log

db2 -tf cms_create_mig_AB100_tables.sql -l cms_create_mig_AB100_tables.log

db2 -tf cms_create_mig_AB101_tables.sql -l cms_create_mig_AB101_tables.log


db2 -tf cms_create_mig_AB102_tables.sql -l cms_create_mig_AB102_tables.log

db2 -tf cms_create_mig_AB103_tables.sql -l cms_create_mig_AB103_tables.log

db2 -tf cms_create_mig_AB111_tables.sql -l cms_create_mig_AB111_tables.log

db2 -tf cms_create_mig_AB109_tables.sql -l cms_create_mig_AB109_tables.log

db2 -tf cms_create_mig_AB110_tables.sql -l cms_create_mig_AB110_tables.log

db2 -tf cms_create_mig_CS.sql -l cms_create_mig_CS_tables.log

db2 -tf cms_create_mig_DC.sql -l cms_create_mig_DC_tables.log

db2 -tf cms_create_mig_GT.sql -l cms_create_mig_GT_tables.log

db2 -tf cms_create_mig_IN.sql -l cms_create_mig_IN_tables.log

db2 -tf cms_create_mig_MS.sql -l cms_create_mig_MS_tables.log

db2 -tf cms_create_mig_OT.sql -l cms_create_mig_OT_tables.log


db2 -tf cms_create_mig_PT.sql -l cms_create_mig_PT_tables.log

db2 -tf cms_create_mig_CL.sql -l cms_create_mig_CL_tables.log


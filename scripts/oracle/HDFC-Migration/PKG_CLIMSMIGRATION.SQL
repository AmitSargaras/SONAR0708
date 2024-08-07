CREATE OR REPLACE PACKAGE HDFC_MIG_CLIMS.pkg_climsmigration
AS
   PROCEDURE executedatamigration (v_ismigrated IN CHAR);

   PROCEDURE sp_settingbasicdata;

   PROCEDURE sp_dm_insertlogdetails (
      v_totalrecords      IN   NUMBER,
      v_errordesc         IN   VARCHAR2,
      v_logmstid          IN   NUMBER,
      v_stage_tablename   IN   VARCHAR2,
      v_tablename         IN   VARCHAR2,
      v_columnname        IN   VARCHAR2,
      v_datas             IN   VARCHAR2
   );

   PROCEDURE sp_fetch_userdetails (
      userlogin_id               IN       VARCHAR2,
      vuser_id                   OUT      NUMBER,
      vuser_name                 OUT      VARCHAR2,
      vlogin_id                  OUT      VARCHAR2,
      vteam_type_membership_id   OUT      NUMBER,
      vteam_type_id              OUT      NUMBER,
      vteam_id                   OUT      NUMBER,
      vteam_membership_id        OUT      NUMBER
   );

   --PROCEDURE SP_FETCH_USERDETAILS(USERLOGIN_ID IN VARCHAR2,VUSER_ID OUT NUMBER,VTEAM_TYPE_MEMBERSHIP_ID  OUT NUMBER,VTEAM_TYPE_ID OUT NUMBER,VTEAM_ID OUT NUMBER,VTEAM_MEMBERSHIP_ID OUT NUMBER);
   PROCEDURE sp_dm_valuation_agency (v_ismigrated IN CHAR);

   PROCEDURE sp_dm_currency (v_ismigrated IN CHAR);

   PROCEDURE sp_dm_location (v_ismigrated IN CHAR);
   
   PROCEDURE sp_dm_systembank (v_ismigrated IN CHAR);

   PROCEDURE sp_dm_systembankbranch (v_ismigrated IN CHAR);

   PROCEDURE sp_dm_otherbank (v_ismigrated IN CHAR);

   PROCEDURE sp_dm_otherbankbranch (v_ismigrated IN CHAR);

   PROCEDURE sp_dm_credit_approval (v_ismigrated IN CHAR);

   PROCEDURE sp_dm_relationship_mgr (v_ismigrated IN CHAR);

   PROCEDURE sp_dm_rbi_category (v_ismigrated IN CHAR);

   PROCEDURE sp_dm_facility (v_ismigrated IN CHAR);

   PROCEDURE sp_dm_party_group (v_ismigrated IN CHAR);

   PROCEDURE sp_dm_insurance_coverage (v_ismigrated IN CHAR);

   PROCEDURE sp_dm_collateral (v_ismigrated IN CHAR);

   PROCEDURE sp_dm_security_document (v_ismigrated IN CHAR);

   PROCEDURE sp_dm_facility_document (v_ismigrated IN CHAR);

   PROCEDURE sp_dm_cam_document (v_ismigrated IN CHAR);
END pkg_climsmigration; 
/

CREATE OR REPLACE PACKAGE BODY HDFC_MIG_CLIMS.pkg_climsmigration
IS
   v_app_date              DATE;
   v_app_timestamp         TIMESTAMP;
   v_version               NUMBER (19)         := 0;
   v_createby              VARCHAR2 (50)       := 'SYSTEM';
   v_lastupdateby          VARCHAR2 (50)       := 'SYSTEM';
   v_deprecated            CHAR (1)            := 'N';
   v_status                VARCHAR2 (20)       := 'ACTIVE';
   v_totalrecords          NUMBER (19);
   v_migratedrecords       NUMBER (19);
   v_duplicaterecords      NUMBER (19);
   v_recordstatus          CHAR (1);
   v_errormessage          VARCHAR (4000)      := NULL;
   v_stage_tablename       VARCHAR2 (100)      := '';
   v_tablename             VARCHAR2 (100)      := '';
   v_columnname            VARCHAR2 (100)      := '';
   v_datas                 VARCHAR2 (4000)     := '';
   v_transaction_id        VARCHAR2 (30 CHAR);
   v_transaction_type      VARCHAR2 (20 CHAR);
   v_transaction_subtype   VARCHAR2 (25 CHAR);
   vtrans_from_state       VARCHAR2 (30);
   vtrans_status           VARCHAR2 (30)       := 'ACTIVE';
   vtrans_version          NUMBER (38)         := 1;
   v_transopsdesc          VARCHAR2 (100 CHAR);
   v_transuser_info        VARCHAR2 (100 CHAR);
   --NEED TO MODIFY AS PER MIGRATION USER USED IN APPLICATION
   v_user_id               NUMBER (38)         := 20110719000000303;
   v_user_name             VARCHAR2 (50 CHAR)  := 'SM_MKR';
   v_login_id              VARCHAR2 (20 CHAR)  := 'SM_MKR';
   v_team_type_id          NUMBER (38)         := 104;
   v_team_id               NUMBER (38)         := 20110623000000040;
   v_team_membership_id    NUMBER (38)         := 20110623000000085;
   --NEED TO MODIFY AS PER MIGRATION USER USED IN APPLICATION
   v_logmstid              NUMBER (19);
   v_logdetid              NUMBER (19);
   v_statusflag            VARCHAR2 (50);
   v_dmseqno               NUMBER (19)         := 0;
   v_starttime             DATE;
   v_count                 NUMBER (19);
   v_cityid                NUMBER (19);
   v_stateid               NUMBER (19);
   v_regionid              NUMBER (19);
   v_countryid             NUMBER (19);

   -- ***** START OF EXECUTEDATAMIGRATION PROCEDURE *****
   PROCEDURE executedatamigration (v_ismigrated IN CHAR)
   IS
   BEGIN
      pkg_climsmigration.sp_settingbasicdata;
      pkg_climsmigration.sp_dm_currency (v_ismigrated);
      COMMIT;
      pkg_climsmigration.sp_dm_location (v_ismigrated);
      COMMIT;
      pkg_climsmigration.sp_dm_systembank (v_ismigrated);
      COMMIT;
      pkg_climsmigration.sp_dm_systembankbranch (v_ismigrated);
      COMMIT;
      pkg_climsmigration.sp_dm_otherbank (v_ismigrated);
      COMMIT;
      pkg_climsmigration.sp_dm_otherbankbranch (v_ismigrated);
      COMMIT;
      pkg_climsmigration.sp_dm_valuation_agency (v_ismigrated);
      COMMIT;
      pkg_climsmigration.sp_dm_credit_approval (v_ismigrated);
      COMMIT;
      pkg_climsmigration.sp_dm_relationship_mgr (v_ismigrated);
      COMMIT;
      pkg_climsmigration.sp_dm_rbi_category (v_ismigrated);
      COMMIT;
      pkg_climsmigration.sp_dm_facility (v_ismigrated);
      COMMIT;
      pkg_climsmigration.sp_dm_party_group (v_ismigrated);
      COMMIT;
      pkg_climsmigration.sp_dm_insurance_coverage (v_ismigrated);
      COMMIT;
      pkg_climsmigration.sp_dm_collateral (v_ismigrated);
      COMMIT;
      pkg_climsmigration.sp_dm_security_document (v_ismigrated);
      COMMIT;
      pkg_climsmigration.sp_dm_facility_document (v_ismigrated);
      COMMIT;
      pkg_climsmigration.sp_dm_cam_document (v_ismigrated);
      COMMIT;
   END executedatamigration;

   PROCEDURE sp_settingbasicdata
   IS
   BEGIN
      -- GETTING CURRENT APPLICATION DATE + SERVER TIME.
      SELECT SYSDATE
        INTO v_app_date
        FROM DUAL;

      SELECT SYSTIMESTAMP
        INTO v_app_timestamp
        FROM DUAL;
   END sp_settingbasicdata;

   PROCEDURE sp_fetch_userdetails (
      userlogin_id               IN       VARCHAR2,
      vuser_id                   OUT      NUMBER,
      vuser_name                 OUT      VARCHAR2,
      vlogin_id                  OUT      VARCHAR2,
      vteam_type_membership_id   OUT      NUMBER,
      vteam_type_id              OUT      NUMBER,
      vteam_id                   OUT      NUMBER,
      vteam_membership_id        OUT      NUMBER
   )
   IS
   BEGIN
      SELECT user_id, user_name, login_id, team_type_membership_id
        INTO vuser_id, vuser_name, vlogin_id, vteam_type_membership_id
        FROM cms_user
       WHERE login_id = userlogin_id;

      SELECT team_type_id
        INTO vteam_type_id
        FROM cms_team_type_membership
       WHERE team_type_membership_id = vteam_type_membership_id;

      SELECT team_id
        INTO vteam_id
        FROM cms_team
       WHERE team_type_id = vteam_type_id;

      SELECT team_membership_id
        INTO vteam_membership_id
        FROM cms_team_membership
       WHERE team_id = vteam_id
         AND team_type_membership_id = vteam_type_membership_id;
   ---DBMS_OUTPUT.PUT_LINE(VTEAM_MEMBERSHIP_ID||','||VUSER_ID);
   END sp_fetch_userdetails;

   PROCEDURE sp_dm_insertlogdetails (
      v_totalrecords      IN   NUMBER,
      v_errordesc         IN   VARCHAR2,
      v_logmstid          IN   NUMBER,
      v_stage_tablename   IN   VARCHAR2,
      v_tablename         IN   VARCHAR2,
      v_columnname        IN   VARCHAR2,
      v_datas             IN   VARCHAR2
   )
   IS
   BEGIN
      SELECT logdet_sq.NEXTVAL
        INTO v_logdetid
        FROM DUAL;

      INSERT INTO logdet
                  (ID, logmstid, recordno, errordesc,
                   stage_tablename, tablename, columnname, datas
                  )
           VALUES (v_logdetid, v_logmstid, v_totalrecords, v_errordesc,
                   v_stage_tablename, v_tablename, v_columnname, v_datas
                  );
   END sp_dm_insertlogdetails;

   PROCEDURE sp_dm_valuation_agency (v_ismigrated IN CHAR)
   IS
      CURSOR cr_valuation_agency
      IS
         SELECT        *
                  FROM mig_valuation_agency
                 WHERE ismigrated = 'N'
         FOR UPDATE OF ismigrated;

      rc_valuation_agency        cr_valuation_agency%ROWTYPE;
      stage_valuation_agencyid   NUMBER (19);
      valuation_agencyid         NUMBER (19);
   BEGIN
      v_totalrecords := 0;
      v_migratedrecords := 0;
      v_transaction_type := 'VALUATION_AGENCY';
      vtrans_from_state := 'PENDING_CREATE';

      -- Getting Sequence ID for LogMst ID.
      SELECT logmst_sq.NEXTVAL
        INTO v_logmstid
        FROM DUAL;

      -- Setting data migration sequence no.
      v_dmseqno := v_dmseqno + 1;
      -- Setting StatusFlag as Successfull by default
      v_statusflag := 'SUCCESSFULL';

      -- Setting start time for migration.
      SELECT SYSDATE
        INTO v_starttime
        FROM DUAL;

      SELECT operation
        INTO v_transopsdesc
        FROM (SELECT operation, ROWNUM AS rownum1
                FROM tr_state_matrix
               WHERE stateins = v_transaction_type
                 AND fromstate = vtrans_from_state
                 AND tostate = 'ACTIVE'
                 AND userstate = 'ACTIVE'
                 AND enableind = 1
                 AND frontendop = 1)
       WHERE rownum1 = 1;

      OPEN cr_valuation_agency;

      LOOP
         FETCH cr_valuation_agency
          INTO rc_valuation_agency;

         EXIT WHEN cr_valuation_agency%NOTFOUND;
         v_totalrecords := v_totalrecords + 1;
         v_recordstatus := v_ismigrated;
         v_errormessage := NULL;

         IF    rc_valuation_agency.codevalue IS NULL
            OR TRIM (rc_valuation_agency.codevalue) IS NULL
            OR TRIM (rc_valuation_agency.codevalue) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'CODEVALUE is null';
            v_stage_tablename := 'cms_stage_valuation_agency';
            v_tablename := 'cms_valuation_agency';
            v_columnname := 'VALUATION_AGENCY_CODE';
            v_datas := rc_valuation_agency.codevalue;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_valuation_agency.codevalue) > 9
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'CODEVALUE Length Mismatch';
            v_stage_tablename := 'cms_stage_valuation_agency';
            v_tablename := 'cms_valuation_agency';
            v_columnname := 'VALUATION_AGENCY_CODE';
            v_datas := rc_valuation_agency.codevalue;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_valuation_agency.codedesc IS NULL
            OR TRIM (rc_valuation_agency.codedesc) IS NULL
            OR TRIM (rc_valuation_agency.codedesc) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'codedesc is null';
            v_stage_tablename := 'cms_stage_valuation_agency';
            v_tablename := 'cms_valuation_agency';
            v_columnname := 'valuation_agency_name';
            v_datas := rc_valuation_agency.codedesc;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_valuation_agency.codedesc) > 50
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'CODEDESC Length Mismatch';
            v_stage_tablename := 'cms_stage_valuation_agency';
            v_tablename := 'cms_valuation_agency';
            v_columnname := 'VALUATION_AGENCY_NAME';
            v_datas := rc_valuation_agency.codedesc;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF v_recordstatus = v_ismigrated
         THEN
            SELECT stage_valuation_agency_seq.NEXTVAL
              INTO stage_valuation_agencyid
              FROM DUAL;

            INSERT INTO cms_stage_valuation_agency
                        (ID, version_time, create_by,
                         creation_date, last_update_by, last_update_date,
                         deprecated, status, master_id,
                         valuation_agency_code,
                         valuation_agency_name
                        )
                 VALUES (stage_valuation_agencyid, v_version, v_createby,
                         v_app_timestamp, v_lastupdateby, v_app_timestamp,
                         v_deprecated, v_status, NULL,
                         rc_valuation_agency.codevalue,
                         rc_valuation_agency.codedesc
                        );

            SELECT valuation_agency_seq.NEXTVAL
              INTO valuation_agencyid
              FROM DUAL;

            INSERT INTO cms_valuation_agency
                        (ID, version_time, create_by,
                         creation_date, last_update_by, last_update_date,
                         deprecated, status, master_id,
                         valuation_agency_code,
                         valuation_agency_name
                        )
                 VALUES (valuation_agencyid, v_version, v_createby,
                         v_app_timestamp, v_lastupdateby, v_app_timestamp,
                         v_deprecated, v_status, NULL,
                         rc_valuation_agency.codevalue,
                         rc_valuation_agency.codedesc
                        );

            SELECT    TO_CHAR (SYSDATE, 'YYYYMMDD')
                   || '00000'
                   || (MAX (TO_NUMBER (SUBSTR (transaction_id, 14))) + 1)
              INTO v_transaction_id
              FROM TRANSACTION;

            INSERT INTO TRANSACTION
                        (transaction_id, from_state, user_id,
                         login_id, transaction_type, creation_date,
                         transaction_date, reference_id, status,
                         staging_reference_id, team_id, VERSION,
                         opsdesc,
                         user_info,
                         cur_trx_history_id, team_type_id,
                         team_membership_id
                        )
                 VALUES (v_transaction_id, vtrans_from_state, v_user_id,
                         v_login_id, v_transaction_type, v_app_date,
                         v_app_date, valuation_agencyid, vtrans_status,
                         stage_valuation_agencyid, v_team_id, vtrans_version,
                         v_transopsdesc,
                         v_user_name || ' ( ' || v_login_id || ' )',
                         v_transaction_id, v_team_type_id,
                         v_team_membership_id
                        );

            -- Updating ID and Flag in migration database.
            UPDATE mig_valuation_agency
               SET ismigrated = v_recordstatus,
                   stage_idmig = stage_valuation_agencyid,
                   idmig = valuation_agencyid,
                   trans_idmig = v_transaction_id
             WHERE CURRENT OF cr_valuation_agency;

            v_migratedrecords := v_migratedrecords + 1;
         ELSE
            -- Found error for record
            v_statusflag := 'ERROR';

            -- Updating Flag in migration database.
            UPDATE mig_valuation_agency
               SET ismigrated = v_recordstatus
             WHERE CURRENT OF cr_valuation_agency;
         END IF;
      END LOOP;

      CLOSE cr_valuation_agency;

      -- Logging  Migration Details
      INSERT INTO logmst
                  (ID, dmid, sequenceno,
                   stage_tablename, tablename,
                   totalrecords, migratedrecords, starttime, endtime,
                   status
                  )
           VALUES (v_logmstid, v_logmstid, v_dmseqno,
                   'CMS_STAGE_VALUATION_AGENCY', 'CMS_VALUATION_AGENCY',
                   v_totalrecords, v_migratedrecords, v_starttime, SYSDATE,
                   v_statusflag
                  );
   END sp_dm_valuation_agency;

   PROCEDURE sp_dm_currency (v_ismigrated IN CHAR)
   IS
      CURSOR cr_cms_forex
      IS
         SELECT        *
                  FROM mig_cms_forex
                 WHERE ismigrated = 'N'
         FOR UPDATE OF ismigrated;

      rc_cms_forex         cr_cms_forex%ROWTYPE;
      cms_stage_forexid    NUMBER (19);
      cms_forexid          NUMBER (19);
      v_feed_group_id      NUMBER (19);
      v_cms_version_time   NUMBER (19);
   BEGIN
      v_totalrecords := 0;
      v_migratedrecords := 0;
      v_transaction_type := 'FOREX_FEED_GROUP';
      vtrans_from_state := 'PENDING_UPDATE';

      -- Getting Sequence ID for LogMst ID.
      SELECT logmst_sq.NEXTVAL
        INTO v_logmstid
        FROM DUAL;

      -- Setting data migration sequence no.
      v_dmseqno := v_dmseqno + 1;
      -- Setting StatusFlag as Successfull by default
      v_statusflag := 'SUCCESSFULL';

      -- Setting start time for migration.
      SELECT SYSDATE
        INTO v_starttime
        FROM DUAL;

      SELECT operation
        INTO v_transopsdesc
        FROM (SELECT operation, ROWNUM AS rownum1
                FROM tr_state_matrix
               WHERE stateins = v_transaction_type
                 AND fromstate = vtrans_from_state
                 AND tostate = 'ACTIVE'
                 AND userstate = 'ACTIVE'
                 AND enableind = 1
                 AND frontendop = 1)
       WHERE rownum1 = 1;

      SELECT feed_group_id, cms_version_time
        INTO v_feed_group_id, v_cms_version_time
        FROM cms_feed_group
       WHERE group_type = 'FOREX';

      OPEN cr_cms_forex;

      LOOP
         FETCH cr_cms_forex
          INTO rc_cms_forex;

         EXIT WHEN cr_cms_forex%NOTFOUND;
         v_totalrecords := v_totalrecords + 1;
         v_recordstatus := v_ismigrated;
         v_errormessage := NULL;

         IF    rc_cms_forex.ccymbcode IS NULL
            OR TRIM (rc_cms_forex.ccymbcode) IS NULL
            OR TRIM (rc_cms_forex.ccymbcode) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'ccymbcode is null';
            v_stage_tablename := 'cms_stage_forex';
            v_tablename := 'cms_forex';
            v_columnname := 'buy_currency';
            v_datas := rc_cms_forex.ccymbcode;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_forex.ccymbcode) > 3
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'ccymbcode Length Mismatch';
            v_stage_tablename := 'cms_stage_forex';
            v_tablename := 'cms_forex';
            v_columnname := 'buy_currency';
            v_datas := rc_cms_forex.ccymbcode;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_forex.ccycode IS NULL
            OR TRIM (rc_cms_forex.ccycode) IS NULL
            OR TRIM (rc_cms_forex.ccycode) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'ccycode is null';
            v_stage_tablename := 'cms_stage_forex';
            v_tablename := 'cms_forex';
            v_columnname := 'currency_iso_code';
            v_datas := rc_cms_forex.ccycode;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_forex.ccycode) > 3
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'ccycode Length Mismatch';
            v_stage_tablename := 'cms_stage_forex';
            v_tablename := 'cms_forex';
            v_columnname := 'currency_iso_code';
            v_datas := rc_cms_forex.ccycode;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_forex.ccyrate IS NULL
            OR TRIM (rc_cms_forex.ccyrate) IS NULL
            OR TRIM (rc_cms_forex.ccyrate) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'ccyrate is null';
            v_stage_tablename := 'cms_stage_forex';
            v_tablename := 'cms_forex';
            v_columnname := 'buy_rate';
            v_datas := rc_cms_forex.ccyrate;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_forex.ccyrate) > 20
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'ccyrate Length Mismatch';
            v_stage_tablename := 'cms_stage_forex';
            v_tablename := 'cms_forex';
            v_columnname := 'buy_rate';
            v_datas := rc_cms_forex.ccyrate;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_forex.ccydesc IS NULL
            OR TRIM (rc_cms_forex.ccydesc) IS NULL
            OR TRIM (rc_cms_forex.ccydesc) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'ccydesc is null';
            v_stage_tablename := 'cms_stage_forex';
            v_tablename := 'cms_forex';
            v_columnname := 'currency_description';
            v_datas := rc_cms_forex.ccydesc;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_forex.ccydesc) > 100
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'ccydesc Length Mismatch';
            v_stage_tablename := 'cms_stage_forex';
            v_tablename := 'cms_forex';
            v_columnname := 'currency_description';
            v_datas := rc_cms_forex.ccydesc;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF v_recordstatus = v_ismigrated
         THEN
            SELECT cms_stage_forex_seq.NEXTVAL
              INTO cms_stage_forexid
              FROM DUAL;

            INSERT INTO cms_stage_forex
                        (feed_id, buy_currency,
                         sell_currency, buy_rate,
                         currency_description, currency_iso_code, buy_unit,
                         sell_unit, effective_date, cms_version_time,
                         feed_ref, feed_group_id
                        )
                 VALUES (cms_stage_forexid, rc_cms_forex.ccymbcode,
                         rc_cms_forex.ccymbcode, rc_cms_forex.ccyrate,
                         rc_cms_forex.ccydesc, rc_cms_forex.ccycode, 1,
                         1, v_app_timestamp, v_cms_version_time,
                         0, v_feed_group_id
                        );

            SELECT cms_forex_seq.NEXTVAL
              INTO cms_forexid
              FROM DUAL;

            INSERT INTO cms_forex
                        (feed_id, buy_currency,
                         sell_currency, buy_rate,
                         currency_description, currency_iso_code, buy_unit,
                         sell_unit, effective_date, cms_version_time,
                         feed_ref, feed_group_id
                        )
                 VALUES (cms_stage_forexid, rc_cms_forex.ccymbcode,
                         rc_cms_forex.ccymbcode, rc_cms_forex.ccyrate,
                         rc_cms_forex.ccydesc, rc_cms_forex.ccycode, 1,
                         1, v_app_timestamp, v_cms_version_time,
                         0, v_feed_group_id
                        );

            SELECT    TO_CHAR (SYSDATE, 'YYYYMMDD')
                   || '00000'
                   || (MAX (TO_NUMBER (SUBSTR (transaction_id, 14))) + 1)
              INTO v_transaction_id
              FROM TRANSACTION;

            INSERT INTO TRANSACTION
                        (transaction_id, from_state, user_id,
                         login_id, transaction_type, creation_date,
                         transaction_date, reference_id, status,
                         staging_reference_id, team_id, VERSION,
                         opsdesc,
                         user_info,
                         cur_trx_history_id, team_type_id,
                         team_membership_id
                        )
                 VALUES (v_transaction_id, vtrans_from_state, v_user_id,
                         v_login_id, v_transaction_type, v_app_date,
                         v_app_date, cms_forexid, vtrans_status,
                         cms_stage_forexid, v_team_id, vtrans_version,
                         v_transopsdesc,
                         v_user_name || ' ( ' || v_login_id || ' )',
                         v_transaction_id, v_team_type_id,
                         v_team_membership_id
                        );

            -- Updating ID and Flag in migration database.
            UPDATE mig_cms_forex
               SET ismigrated = v_recordstatus,
                   stage_idmig = cms_stage_forexid,
                   idmig = cms_forexid,
                   trans_idmig = v_transaction_id
             WHERE CURRENT OF cr_cms_forex;

            v_migratedrecords := v_migratedrecords + 1;
         ELSE
            -- Found error for record
            v_statusflag := 'ERROR';

            -- Updating  Flag in migration database.
            UPDATE mig_cms_forex
               SET ismigrated = v_recordstatus
             WHERE CURRENT OF cr_cms_forex;
         END IF;
      END LOOP;

      CLOSE cr_cms_forex;

      -- Logging  Migration Details
      INSERT INTO logmst
                  (ID, dmid, sequenceno, stage_tablename,
                   tablename, totalrecords, migratedrecords,
                   starttime, endtime, status
                  )
           VALUES (v_logmstid, v_logmstid, v_dmseqno, 'CMS_STAGE_FOREX',
                   'CMS_FOREX', v_totalrecords, v_migratedrecords,
                   v_starttime, SYSDATE, v_statusflag
                  );
   END sp_dm_currency;

   PROCEDURE sp_dm_location (v_ismigrated IN CHAR)
   IS
      CURSOR cr_cms_location
      IS
         SELECT        *
                  FROM mig_cms_location
                 WHERE rismigrated = 'N'
                    OR sismigrated = 'N'
                    OR cismigrated = 'N'
         FOR UPDATE OF rismigrated, sismigrated, cismigrated;

      rc_cms_location         cr_cms_location%ROWTYPE;
      v_cms_stage_countryid   NUMBER (19);
      v_cms_countryid         NUMBER (19);
      v_cms_stage_regionid    NUMBER (19);
      v_cms_regionid          NUMBER (19);
      v_cms_stage_stateid     NUMBER (19);
      v_cms_stateid           NUMBER (19);
      v_cms_stage_cityid      NUMBER (19);
      v_cms_cityid            NUMBER (19);
      v_transaction_type1     VARCHAR2 (20 CHAR);
      v_transaction_type2     VARCHAR2 (20 CHAR);
      v_transaction_type3     VARCHAR2 (20 CHAR);
      v_transopsdesc1         VARCHAR2 (100 CHAR);
      v_transopsdesc2         VARCHAR2 (100 CHAR);
      v_transopsdesc3         VARCHAR2 (100 CHAR);
      v_transaction_id1       NUMBER (19);
      v_transaction_id2       NUMBER (19);
      v_transaction_id3       NUMBER (19);
      v_regioncodeid          VARCHAR2 (50);
      v_country_code          VARCHAR2 (50);
   BEGIN
      v_totalrecords := 0;
      v_migratedrecords := 0;
      v_transaction_type := 'COUNTRY';
      vtrans_from_state := 'PENDING_CREATE';
      v_transaction_type1 := 'REGION';
      v_transaction_type2 := 'STATE';
      v_transaction_type3 := 'CITY';

      -- Getting Sequence ID for LogMst ID.
      SELECT logmst_sq.NEXTVAL
        INTO v_logmstid
        FROM DUAL;

      -- Setting data migration sequence no.
      v_dmseqno := v_dmseqno + 1;
      -- Setting StatusFlag as Successfull by default
      v_statusflag := 'SUCCESSFULL';

      -- Setting start time for migration.
      SELECT SYSDATE
        INTO v_starttime
        FROM DUAL;

      SELECT operation
        INTO v_transopsdesc
        FROM (SELECT operation, ROWNUM AS rownum1
                FROM tr_state_matrix
               WHERE stateins = v_transaction_type
                 AND fromstate = vtrans_from_state
                 AND tostate = 'ACTIVE'
                 AND userstate = 'ACTIVE'
                 AND enableind = 1
                 AND frontendop = 1)
       WHERE rownum1 = 1;

      SELECT operation
        INTO v_transopsdesc1
        FROM (SELECT operation, ROWNUM AS rownum1
                FROM tr_state_matrix
               WHERE stateins = v_transaction_type1
                 AND fromstate = vtrans_from_state
                 AND tostate = 'ACTIVE'
                 AND userstate = 'ACTIVE'
                 AND enableind = 1
                 AND frontendop = 1)
       WHERE rownum1 = 1;

      SELECT operation
        INTO v_transopsdesc2
        FROM (SELECT operation, ROWNUM AS rownum1
                FROM tr_state_matrix
               WHERE stateins = v_transaction_type2
                 AND fromstate = vtrans_from_state
                 AND tostate = 'ACTIVE'
                 AND userstate = 'ACTIVE'
                 AND enableind = 1
                 AND frontendop = 1)
       WHERE rownum1 = 1;

      SELECT operation
        INTO v_transopsdesc3
        FROM (SELECT operation, ROWNUM AS rownum1
                FROM tr_state_matrix
               WHERE stateins = v_transaction_type3
                 AND fromstate = vtrans_from_state
                 AND tostate = 'ACTIVE'
                 AND userstate = 'ACTIVE'
                 AND enableind = 1
                 AND frontendop = 1)
       WHERE rownum1 = 1;

      OPEN cr_cms_location;

      LOOP
         FETCH cr_cms_location
          INTO rc_cms_location;

         EXIT WHEN cr_cms_location%NOTFOUND;
         v_totalrecords := v_totalrecords + 1;
         v_recordstatus := v_ismigrated;
         v_errormessage := NULL;

         IF    rc_cms_location.countryname IS NULL
            OR TRIM (rc_cms_location.countryname) IS NULL
            OR TRIM (rc_cms_location.countryname) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'COUNTRYNAME is null';
            v_stage_tablename := 'CMS_STAGE_COUNTRY';
            v_tablename := 'CMS_COUNTRY';
            v_columnname := 'COUNTRY_NAME';
            v_datas := rc_cms_location.countryname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_location.countryname) > 50
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'COUNTRYNAME Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_COUNTRY';
            v_tablename := 'CMS_COUNTRY';
            v_columnname := 'COUNTRY_NAME';
            v_datas := rc_cms_location.countryname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_location.regionname IS NULL
            OR TRIM (rc_cms_location.regionname) IS NULL
            OR TRIM (rc_cms_location.regionname) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'REGIONNAME is null';
            v_stage_tablename := 'CMS_STAGE_REGION';
            v_tablename := 'CMS_REGION';
            v_columnname := 'REGION_NAME';
            v_datas := rc_cms_location.regionname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_location.regionname) > 50
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'REGIONNAME Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_REGION';
            v_tablename := 'CMS_REGION';
            v_columnname := 'REGION_NAME';
            v_datas := rc_cms_location.regionname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_location.statename IS NULL
            OR TRIM (rc_cms_location.statename) IS NULL
            OR TRIM (rc_cms_location.statename) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'STATENAME is null';
            v_stage_tablename := 'CMS_STAGE_STATE';
            v_tablename := 'CMS_STATE';
            v_columnname := 'STATE_NAME';
            v_datas := rc_cms_location.statename;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_location.statename) > 50
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'STATENAME Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_STATE';
            v_tablename := 'CMS_STATE';
            v_columnname := 'STATE_NAME';
            v_datas := rc_cms_location.statename;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_location.cityname IS NULL
            OR TRIM (rc_cms_location.cityname) IS NULL
            OR TRIM (rc_cms_location.cityname) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'CITYNAME is null';
            v_stage_tablename := 'CMS_STAGE_CITY';
            v_tablename := 'CMS_CITY';
            v_columnname := 'CITY_NAME';
            v_datas := rc_cms_location.cityname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_location.cityname) > 50
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'CITYNAME Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_CITY';
            v_tablename := 'CMS_CITY';
            v_columnname := 'CITY_NAME';
            v_datas := rc_cms_location.cityname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_location.cityid IS NULL
            OR TRIM (rc_cms_location.cityid) IS NULL
            OR TRIM (rc_cms_location.cityid) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'CITYID is null';
            v_stage_tablename := 'CMS_STAGE_CITY';
            v_tablename := 'CMS_CITY';
            v_columnname := 'CITY_CODE';
            v_datas := rc_cms_location.cityid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_location.cityid) > 50
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'CITYID Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_CITY';
            v_tablename := 'CMS_CITY';
            v_columnname := 'CITY_CODE';
            v_datas := rc_cms_location.cityid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM cms_country
          WHERE UPPER (TRIM (country_name)) =
                                    UPPER (TRIM (rc_cms_location.countryname));

         IF v_count = 0
         THEN
            IF UPPER (TRIM (rc_cms_location.countryname)) = 'INDIA'
            THEN
               v_country_code := 'IN';
            ELSE
               v_country_code := UPPER (TRIM (rc_cms_location.countryname));
            END IF;

            SELECT cms_stage_country_seq.NEXTVAL
              INTO v_cms_stage_countryid
              FROM DUAL;

            INSERT INTO cms_stage_country
                        (ID, country_code,
                         country_name, status, deprecated
                        )
                 VALUES (v_cms_stage_countryid, v_country_code,
                         rc_cms_location.countryname, v_status, v_deprecated
                        );

            SELECT cms_country_seq.NEXTVAL
              INTO v_cms_countryid
              FROM DUAL;

            INSERT INTO cms_country
                        (ID, country_code,
                         country_name, status, deprecated
                        )
                 VALUES (v_cms_countryid, v_country_code,
                         rc_cms_location.countryname, v_status, v_deprecated
                        );

            SELECT    TO_CHAR (SYSDATE, 'YYYYMMDD')
                   || '00000'
                   || (MAX (TO_NUMBER (SUBSTR (transaction_id, 14))) + 1)
              INTO v_transaction_id
              FROM TRANSACTION;

            INSERT INTO TRANSACTION
                        (transaction_id, from_state, user_id,
                         login_id, transaction_type, creation_date,
                         transaction_date, reference_id, status,
                         staging_reference_id, team_id, VERSION,
                         opsdesc,
                         user_info,
                         cur_trx_history_id, team_type_id,
                         team_membership_id
                        )
                 VALUES (v_transaction_id, vtrans_from_state, v_user_id,
                         v_login_id, v_transaction_type, v_app_date,
                         v_app_date, v_cms_countryid, vtrans_status,
                         v_cms_stage_countryid, v_team_id, vtrans_version,
                         v_transopsdesc,
                         v_user_name || ' ( ' || v_login_id || ' )',
                         v_transaction_id, v_team_type_id,
                         v_team_membership_id
                        );
         ELSE
            SELECT MAX (ID)
              INTO v_cms_countryid
              FROM cms_country
             WHERE UPPER (TRIM (country_name)) =
                                    UPPER (TRIM (rc_cms_location.countryname));
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM cms_region
          WHERE UPPER (TRIM (region_name)) =
                                     UPPER (TRIM (rc_cms_location.regionname))
            AND country_id = v_cms_countryid;

         IF v_count = 0
         THEN
            SELECT regionid
              INTO v_regioncodeid
              FROM mig_cms_regionmaster
             WHERE UPPER (TRIM (regionname)) =
                                     UPPER (TRIM (rc_cms_location.regionname));

            IF    v_regioncodeid IS NULL
               OR TRIM (v_regioncodeid) IS NULL
               OR TRIM (v_regioncodeid) = 'NULL'
            THEN
               v_recordstatus := 'E';
               v_errormessage := NULL;
               v_errormessage := 'region_code not present for REGIONNAME';
               v_stage_tablename := 'CMS_STAGE_REGION';
               v_tablename := 'CMS_REGION';
               v_columnname := 'REGION_NAME';
               v_datas := v_regioncodeid;
               pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                          v_errormessage,
                                                          v_logmstid,
                                                          v_stage_tablename,
                                                          v_tablename,
                                                          v_columnname,
                                                          v_datas
                                                         );
            END IF;

            IF v_recordstatus = v_ismigrated
            THEN
               SELECT cms_stage_region_seq.NEXTVAL
                 INTO v_cms_stage_regionid
                 FROM DUAL;

               INSERT INTO cms_stage_region
                           (ID, region_code,
                            region_name, country_id,
                            status, deprecated
                           )
                    VALUES (v_cms_stage_regionid, v_regioncodeid,
                            rc_cms_location.regionname, v_cms_countryid,
                            v_status, v_deprecated
                           );

               SELECT cms_region_seq.NEXTVAL
                 INTO v_cms_regionid
                 FROM DUAL;

               INSERT INTO cms_region
                           (ID, region_code,
                            region_name, country_id,
                            status, deprecated
                           )
                    VALUES (v_cms_regionid, v_regioncodeid,
                            rc_cms_location.regionname, v_cms_countryid,
                            v_status, v_deprecated
                           );

               SELECT    TO_CHAR (SYSDATE, 'YYYYMMDD')
                      || '00000'
                      || (MAX (TO_NUMBER (SUBSTR (transaction_id, 14))) + 1)
                 INTO v_transaction_id1
                 FROM TRANSACTION;

               INSERT INTO TRANSACTION
                           (transaction_id, from_state, user_id,
                            login_id, transaction_type, creation_date,
                            transaction_date, reference_id, status,
                            staging_reference_id, team_id, VERSION,
                            opsdesc,
                            user_info,
                            cur_trx_history_id, team_type_id,
                            team_membership_id
                           )
                    VALUES (v_transaction_id1, vtrans_from_state, v_user_id,
                            v_login_id, v_transaction_type1, v_app_date,
                            v_app_date, v_cms_regionid, vtrans_status,
                            v_cms_stage_regionid, v_team_id, vtrans_version,
                            v_transopsdesc1,
                            v_user_name || ' ( ' || v_login_id || ' )',
                            v_transaction_id1, v_team_type_id,
                            v_team_membership_id
                           );

               -- Updating ID and Flag in migration database.
               UPDATE mig_cms_location
                  SET rismigrated = v_recordstatus,
                      rstage_idmig = v_cms_stage_regionid,
                      ridmig = v_cms_regionid,
                      rtrans_idmig = v_transaction_id1
                WHERE CURRENT OF cr_cms_location;
            ELSE
               -- Found error for record
               v_statusflag := 'ERROR';
            END IF;
         ELSE
            SELECT MAX (ID)
              INTO v_cms_regionid
              FROM cms_region
             WHERE UPPER (TRIM (region_name)) =
                                     UPPER (TRIM (rc_cms_location.regionname))
               AND country_id = v_cms_countryid;
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM cms_state
          WHERE UPPER (TRIM (state_name)) =
                                      UPPER (TRIM (rc_cms_location.statename))
            AND region_id = v_cms_regionid;

         IF v_count = 0
         THEN
            IF v_recordstatus = v_ismigrated
            THEN
               SELECT cms_stage_state_seq.NEXTVAL
                 INTO v_cms_stage_stateid
                 FROM DUAL;

               INSERT INTO cms_stage_state
                           (ID,
                            state_code,
                            state_name, region_id,
                            status, deprecated
                           )
                    VALUES (v_cms_stage_stateid,
                            UPPER (REPLACE (rc_cms_location.statename, ' ',
                                            '')
                                  ),
                            rc_cms_location.statename, v_cms_regionid,
                            v_status, v_deprecated
                           );

               SELECT cms_state_seq.NEXTVAL
                 INTO v_cms_stateid
                 FROM DUAL;

               INSERT INTO cms_state
                           (ID,
                            state_code,
                            state_name, region_id,
                            status, deprecated
                           )
                    VALUES (v_cms_stateid,
                            UPPER (REPLACE (rc_cms_location.statename, ' ',
                                            '')
                                  ),
                            rc_cms_location.statename, v_cms_regionid,
                            v_status, v_deprecated
                           );

               SELECT    TO_CHAR (SYSDATE, 'YYYYMMDD')
                      || '00000'
                      || (MAX (TO_NUMBER (SUBSTR (transaction_id, 14))) + 1)
                 INTO v_transaction_id2
                 FROM TRANSACTION;

               INSERT INTO TRANSACTION
                           (transaction_id, from_state, user_id,
                            login_id, transaction_type, creation_date,
                            transaction_date, reference_id, status,
                            staging_reference_id, team_id, VERSION,
                            opsdesc,
                            user_info,
                            cur_trx_history_id, team_type_id,
                            team_membership_id
                           )
                    VALUES (v_transaction_id2, vtrans_from_state, v_user_id,
                            v_login_id, v_transaction_type1, v_app_date,
                            v_app_date, v_cms_stateid, vtrans_status,
                            v_cms_stage_stateid, v_team_id, vtrans_version,
                            v_transopsdesc1,
                            v_user_name || ' ( ' || v_login_id || ' )',
                            v_transaction_id2, v_team_type_id,
                            v_team_membership_id
                           );

               UPDATE mig_cms_location
                  SET sismigrated = v_recordstatus,
                      sstage_idmig = v_cms_stage_stateid,
                      sidmig = v_cms_stateid,
                      strans_idmig = v_transaction_id2
                WHERE CURRENT OF cr_cms_location;
            ELSE
               -- Found error for record
               v_statusflag := 'ERROR';
            END IF;
         ELSE
            SELECT MAX (ID)
              INTO v_cms_stateid
              FROM cms_state
             WHERE UPPER (TRIM (state_name)) =
                                      UPPER (TRIM (rc_cms_location.statename))
               AND region_id = v_cms_regionid;
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM cms_city
          WHERE UPPER (TRIM (city_code)) =
                                         UPPER (TRIM (rc_cms_location.cityid))
            AND UPPER (TRIM (city_name)) =
                                       UPPER (TRIM (rc_cms_location.cityname))
            AND state_id = v_cms_stateid;

         IF v_count = 0
         THEN
            IF v_recordstatus = v_ismigrated
            THEN
               SELECT cms_stage_city_seq.NEXTVAL
                 INTO v_cms_stage_cityid
                 FROM DUAL;

               INSERT INTO cms_stage_city
                           (ID, city_code,
                            city_name, state_id,
                            status, deprecated
                           )
                    VALUES (v_cms_stage_cityid, rc_cms_location.cityid,
                            rc_cms_location.cityname, v_cms_stateid,
                            v_status, v_deprecated
                           );

               SELECT cms_city_seq.NEXTVAL
                 INTO v_cms_cityid
                 FROM DUAL;

               INSERT INTO cms_city
                           (ID, city_code,
                            city_name, state_id,
                            status, deprecated
                           )
                    VALUES (v_cms_cityid, rc_cms_location.cityid,
                            rc_cms_location.cityname, v_cms_stateid,
                            v_status, v_deprecated
                           );

               SELECT    TO_CHAR (SYSDATE, 'YYYYMMDD')
                      || '00000'
                      || (MAX (TO_NUMBER (SUBSTR (transaction_id, 14))) + 1)
                 INTO v_transaction_id3
                 FROM TRANSACTION;

               INSERT INTO TRANSACTION
                           (transaction_id, from_state, user_id,
                            login_id, transaction_type, creation_date,
                            transaction_date, reference_id, status,
                            staging_reference_id, team_id, VERSION,
                            opsdesc,
                            user_info,
                            cur_trx_history_id, team_type_id,
                            team_membership_id
                           )
                    VALUES (v_transaction_id3, vtrans_from_state, v_user_id,
                            v_login_id, v_transaction_type1, v_app_date,
                            v_app_date, v_cms_cityid, vtrans_status,
                            v_cms_stage_cityid, v_team_id, vtrans_version,
                            v_transopsdesc1,
                            v_user_name || ' ( ' || v_login_id || ' )',
                            v_transaction_id3, v_team_type_id,
                            v_team_membership_id
                           );

               -- Updating ID and Flag in migration database.
               UPDATE mig_cms_location
                  SET cismigrated = v_recordstatus,
                      cstage_idmig = v_cms_stage_cityid,
                      cidmig = v_cms_cityid,
                      ctrans_idmig = v_transaction_id3
                WHERE CURRENT OF cr_cms_location;

               v_migratedrecords := v_migratedrecords + 1;
            ELSE
               -- Found error for record
               v_statusflag := 'ERROR';
            END IF;
         END IF;
      END LOOP;

      CLOSE cr_cms_location;

      -- Logging  Migration Details
      INSERT INTO logmst
                  (ID, dmid, sequenceno, stage_tablename,
                   tablename, totalrecords, migratedrecords,
                   starttime, endtime, status
                  )
           VALUES (v_logmstid, v_logmstid, v_dmseqno, 'LOCATION_STAGE',
                   'LOCATION', v_totalrecords, v_migratedrecords,
                   v_starttime, SYSDATE, v_statusflag
                  );
   END sp_dm_location;

   PROCEDURE sp_dm_systembank (v_ismigrated IN CHAR)
   IS
      CURSOR cr_cms_systembank
      IS
         SELECT        *
                  FROM mig_cms_system_bank
                 WHERE ismigrated = 'N'
         FOR UPDATE OF ismigrated;

      rc_cms_systembank       cr_cms_systembank%ROWTYPE;
      v_stage_system_bankid   NUMBER (19);
      v_system_bankid         NUMBER (19);
   BEGIN
      v_totalrecords := 0;
      v_migratedrecords := 0;
      v_transaction_type := 'SYSTEM_BANK';
      vtrans_from_state := 'DRAFT';

      -- Getting Sequence ID for LogMst ID.
      SELECT logmst_sq.NEXTVAL
        INTO v_logmstid
        FROM DUAL;

      -- Setting data migration sequence no.
      v_dmseqno := v_dmseqno + 1;
      -- Setting StatusFlag as Successfull by default
      v_statusflag := 'SUCCESSFULL';

      -- Setting start time for migration.
      SELECT SYSDATE
        INTO v_starttime
        FROM DUAL;

      SELECT operation
        INTO v_transopsdesc
        FROM (SELECT operation, ROWNUM AS rownum1
                FROM tr_state_matrix
               WHERE stateins = v_transaction_type
                 AND fromstate = vtrans_from_state
                 AND tostate = 'ACTIVE'
                 AND userstate = 'ACTIVE'
                 AND enableind = 1
                 AND frontendop = 1)
       WHERE rownum1 = 1;

      OPEN cr_cms_systembank;

      LOOP
         FETCH cr_cms_systembank
          INTO rc_cms_systembank;

         EXIT WHEN cr_cms_systembank%NOTFOUND;
         v_totalrecords := v_totalrecords + 1;
         v_recordstatus := v_ismigrated;
         v_errormessage := NULL;

         IF    rc_cms_systembank.bankid IS NULL
            OR TRIM (rc_cms_systembank.bankid) IS NULL
            OR TRIM (rc_cms_systembank.bankid) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'BankID is null';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK';
            v_tablename := 'CMS_SYSTEM_BANK';
            v_columnname := 'SYSTEM_BANK_CODE';
            v_datas := rc_cms_systembank.bankid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_systembank.bankid) > 100
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'BankID Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK';
            v_tablename := 'CMS_SYSTEM_BANK';
            v_columnname := 'SYSTEM_BANK_CODE';
            v_datas := rc_cms_systembank.bankid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_systembank.bankname IS NULL
            OR TRIM (rc_cms_systembank.bankname) IS NULL
            OR TRIM (rc_cms_systembank.bankname) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'BANKNAME is null';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK';
            v_tablename := 'CMS_SYSTEM_BANK';
            v_columnname := 'SYSTEM_BANK_NAME';
            v_datas := rc_cms_systembank.bankname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_systembank.bankname) > 300
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'BANKNAME Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK';
            v_tablename := 'CMS_SYSTEM_BANK';
            v_columnname := 'SYSTEM_BANK_NAME';
            v_datas := rc_cms_systembank.bankname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM cms_country
          WHERE UPPER (TRIM (country_name)) =
                                      UPPER (TRIM (rc_cms_systembank.country));

         IF v_count > 0
         THEN
            SELECT ID
              INTO v_countryid
              FROM cms_country
             WHERE UPPER (TRIM (country_name)) =
                                      UPPER (TRIM (rc_cms_systembank.country));
         ELSE
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Invalid COUNTRY';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK';
            v_tablename := 'CMS_SYSTEM_BANK';
            v_columnname := 'COUNTRY';
            v_datas := rc_cms_systembank.country;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM cms_region
          WHERE UPPER (TRIM (region_name)) =
                                       UPPER (TRIM (rc_cms_systembank.region))
            AND country_id = v_countryid;

         IF v_count > 0
         THEN
            SELECT ID
              INTO v_regionid
              FROM cms_region
             WHERE UPPER (TRIM (region_name)) =
                                       UPPER (TRIM (rc_cms_systembank.region))
               AND country_id = v_countryid;
         ELSE
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Invalid REGION';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK';
            v_tablename := 'CMS_SYSTEM_BANK';
            v_columnname := 'REGION';
            v_datas := rc_cms_systembank.region;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM cms_state
          WHERE UPPER (TRIM (state_name)) =
                                        UPPER (TRIM (rc_cms_systembank.state))
            AND region_id = v_regionid;

         IF v_count > 0
         THEN
            SELECT ID
              INTO v_stateid
              FROM cms_state
             WHERE UPPER (TRIM (state_name)) =
                                        UPPER (TRIM (rc_cms_systembank.state))
               AND region_id = v_regionid;
         ELSE
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Invalid STATE';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK';
            v_tablename := 'CMS_SYSTEM_BANK';
            v_columnname := 'STATE';
            v_datas := rc_cms_systembank.state;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM cms_city
          WHERE UPPER (TRIM (city_name)) =
                                         UPPER (TRIM (rc_cms_systembank.city))
            AND state_id = v_stateid;

         IF v_count > 0
         THEN
            SELECT ID
              INTO v_cityid
              FROM cms_city
             WHERE UPPER (TRIM (city_name)) =
                                         UPPER (TRIM (rc_cms_systembank.city))
               AND state_id = v_stateid;
         ELSE
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Invalid CITY';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK';
            v_tablename := 'CMS_SYSTEM_BANK';
            v_columnname := 'CITY_TOWN';
            v_datas := rc_cms_systembank.city;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF v_recordstatus = v_ismigrated
         THEN
            SELECT COUNT (1)
              INTO v_count
              FROM cms_system_bank
             WHERE ID = 1;

            IF v_count > 0
            THEN
               v_stage_system_bankid := 1;
               v_system_bankid := 1;

               UPDATE cms_stage_system_bank
                  SET system_bank_code = rc_cms_systembank.bankid,
                      system_bank_name = rc_cms_systembank.bankname,
                      address = rc_cms_systembank.address,
                      contact_number = rc_cms_systembank.contactnumber,
                      contact_mail = rc_cms_systembank.contactemailid,
                      fax_number = rc_cms_systembank.faxno,
                      city_town = v_cityid,
                      state = v_stateid,
                      region = v_regionid,
                      country = v_countryid
                WHERE ID = 1;

               UPDATE cms_system_bank
                  SET system_bank_code = rc_cms_systembank.bankid,
                      system_bank_name = rc_cms_systembank.bankname,
                      address = rc_cms_systembank.address,
                      contact_number = rc_cms_systembank.contactnumber,
                      contact_mail = rc_cms_systembank.contactemailid,
                      fax_number = rc_cms_systembank.faxno,
                      city_town = v_cityid,
                      state = v_stateid,
                      region = v_regionid,
                      country = v_countryid
                WHERE ID = 1;
            --    v_migratedrecords := v_migratedrecords + 1;
            ELSE
               SELECT cms_stage_system_bank_seq.NEXTVAL
                 INTO v_stage_system_bankid
                 FROM DUAL;

               INSERT INTO cms_stage_system_bank
                           (ID, version_time, create_by,
                            creation_date, last_update_by, last_update_date,
                            deprecated, status, system_bank_code,
                            system_bank_name,
                            contact_number,
                            address, master_id, city_town,
                            state, region, country,
                            contact_mail,
                            fax_number
                           )
                    VALUES (v_stage_system_bankid, 18, 'CPU_ADM',
                            v_app_timestamp, 'CPU_A_C', v_app_timestamp,
                            'N', v_status, rc_cms_systembank.bankid,
                            rc_cms_systembank.bankname,
                            rc_cms_systembank.contactnumber,
                            rc_cms_systembank.address, 1, v_cityid,
                            v_stateid, v_regionid, v_countryid,
                            rc_cms_systembank.contactemailid,
                            rc_cms_systembank.faxno
                           );

               SELECT cms_system_bank_seq.NEXTVAL
                 INTO v_system_bankid
                 FROM DUAL;

               INSERT INTO cms_system_bank
                           (ID, version_time, create_by, creation_date,
                            last_update_by, last_update_date, deprecated,
                            status, system_bank_code,
                            system_bank_name,
                            contact_number,
                            address, master_id, city_town,
                            state, region, country,
                            contact_mail,
                            fax_number
                           )
                    VALUES (v_system_bankid, 18, 'CPU_ADM', v_app_timestamp,
                            'CPU_A_C', v_app_timestamp, 'N',
                            v_status, rc_cms_systembank.bankid,
                            rc_cms_systembank.bankname,
                            rc_cms_systembank.contactnumber,
                            rc_cms_systembank.address, 1, v_cityid,
                            v_stateid, v_regionid, v_countryid,
                            rc_cms_systembank.contactemailid,
                            rc_cms_systembank.faxno
                           );

               SELECT    TO_CHAR (SYSDATE, 'YYYYMMDD')
                      || '00000'
                      || (MAX (TO_NUMBER (SUBSTR (transaction_id, 14))) + 1)
                 INTO v_transaction_id
                 FROM TRANSACTION;

               INSERT INTO TRANSACTION
                           (transaction_id, from_state, user_id,
                            login_id, transaction_type, creation_date,
                            transaction_date, reference_id, status,
                            staging_reference_id, team_id, VERSION,
                            opsdesc,
                            user_info,
                            cur_trx_history_id, team_type_id,
                            team_membership_id, to_group_type_id,
                            to_group_id, to_user_id, customer_name,
                            customer_id, trx_origin_country,
                            trx_origin_organisation, limit_profile_id,
                            trx_segment
                           )
                    VALUES (v_transaction_id, vtrans_from_state, v_user_id,
                            v_login_id, v_transaction_type, v_app_date,
                            v_app_date, v_system_bankid, vtrans_status,
                            v_stage_system_bankid, v_team_id, vtrans_version,
                            v_transopsdesc,
                            v_user_name || ' ( ' || v_login_id || ' )',
                            v_transaction_id, v_team_type_id,
                            v_team_membership_id, -999999999,
                            -999999999, -999999999, 'SA_MAKER',
                            -999999999, '--',
                            '--', '-999999999',
                            '--'
                           );
--TO_TIMESTAMP('07-JUL-2011 8:07:05.000000000 PM','DD-MON-YYYY fmHH12fm:MI:SS.FF AM')
            END IF;

            UPDATE mig_cms_system_bank
               SET ismigrated = v_recordstatus,
                   stage_idmig = v_stage_system_bankid,
                   idmig = v_system_bankid
             WHERE CURRENT OF cr_cms_systembank;

            v_migratedrecords := v_migratedrecords + 1;
         ELSE
            -- Found error for record
            v_statusflag := 'ERROR';

            -- Updating Flag in migration database.
            UPDATE mig_cms_system_bank
               SET ismigrated = v_recordstatus
             WHERE CURRENT OF cr_cms_systembank;
         END IF;

         v_cityid := NULL;
         v_stateid := NULL;
         v_regionid := NULL;
         v_countryid := NULL;
      END LOOP;

      CLOSE cr_cms_systembank;

      -- Logging  Migration Details
      INSERT INTO logmst
                  (ID, dmid, sequenceno,
                   stage_tablename, tablename,
                   totalrecords, migratedrecords, starttime, endtime,
                   status
                  )
           VALUES (v_logmstid, v_logmstid, v_dmseqno,
                   'CMS_STAGE_SYSTEM_BANK', 'CMS_SYSTEM_BANK',
                   v_totalrecords, v_migratedrecords, v_starttime, SYSDATE,
                   v_statusflag
                  );
   END sp_dm_systembank;

   PROCEDURE sp_dm_systembankbranch (v_ismigrated IN CHAR)
   IS
      CURSOR cr_cms_systembankbranch
      IS
         SELECT        *
                  FROM mig_cms_system_bank_branch
                 WHERE ismigrated = 'N'
         FOR UPDATE OF ismigrated;

      rc_cms_systembankbranch          cr_cms_systembankbranch%ROWTYPE;

      CURSOR cr_cms_sysbankbranchlinkhub
      IS
         SELECT        *
                  FROM mig_cms_system_bank_branch
         FOR UPDATE OF ismigrated;

      rc_cms_sysbankbranchlinkhub      cr_cms_sysbankbranchlinkhub%ROWTYPE;
      v_cms_stage_systembankbranchid   NUMBER (19);
      v_cms_systembankbranchid         NUMBER (19);
      v_cms_system_bankid              NUMBER (19);
      v_is_vault                       VARCHAR2 (50);
      v_cms_sysbank_branchlinkhubid    NUMBER (19);
   -- v_cityid                         NUMBER (19);
   -- v_stateid                        NUMBER (19);
   -- v_regionid                       NUMBER (19);
   -- v_countryid                      NUMBER (19);
   BEGIN
      v_totalrecords := 0;
      v_migratedrecords := 0;
      v_transaction_type := 'SYSTEM_BANK_BRANCH';
      vtrans_from_state := 'PENDING_CREATE';

      -- Getting Sequence ID for LogMst ID.
      SELECT logmst_sq.NEXTVAL
        INTO v_logmstid
        FROM DUAL;

      -- Setting data migration sequence no.
      v_dmseqno := v_dmseqno + 1;
      -- Setting StatusFlag as Successfull by default
      v_statusflag := 'SUCCESSFULL';

      -- Setting start time for migration.
      SELECT SYSDATE
        INTO v_starttime
        FROM DUAL;

      SELECT operation
        INTO v_transopsdesc
        FROM (SELECT operation, ROWNUM AS rownum1
                FROM tr_state_matrix
               WHERE stateins = v_transaction_type
                 AND fromstate = vtrans_from_state
                 AND tostate = 'ACTIVE'
                 AND userstate = 'ACTIVE'
                 AND enableind = 1
                 AND frontendop = 1)
       WHERE rownum1 = 1;

      OPEN cr_cms_systembankbranch;

      LOOP
         FETCH cr_cms_systembankbranch
          INTO rc_cms_systembankbranch;

         EXIT WHEN cr_cms_systembankbranch%NOTFOUND;
         v_totalrecords := v_totalrecords + 1;
         v_recordstatus := v_ismigrated;
         v_errormessage := NULL;

         SELECT COUNT (1)
           INTO v_duplicaterecords
           FROM cms_system_bank_branch
          WHERE UPPER (system_bank_branch_code) =
                                      UPPER (rc_cms_systembankbranch.branchcd)
             OR UPPER (system_bank_branch_name) =
                                    UPPER (rc_cms_systembankbranch.branchname);

         IF v_duplicaterecords > 0
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Record Already Exists';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK_BRANCH';
            v_tablename := 'CMS_SYSTEM_BANK_BRANCH';
            v_columnname :=
                         'SYSTEM_BANK_BRANCH_CODE OR SYSTEM_BANK_BRANCH_NAME';
            v_datas :=
                  rc_cms_systembankbranch.branchcd
               || ','
               || rc_cms_systembankbranch.branchname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_systembankbranch.bankname IS NULL
            OR TRIM (rc_cms_systembankbranch.bankname) IS NULL
            OR TRIM (rc_cms_systembankbranch.bankname) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'BANKNAME is null';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK_BRANCH';
            v_tablename := 'CMS_SYSTEM_BANK_BRANCH';
            v_columnname := 'SYSTEM_BANK_CODE';
            v_datas := rc_cms_systembankbranch.bankname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_systembankbranch.branchcd IS NULL
            OR TRIM (rc_cms_systembankbranch.branchcd) IS NULL
            OR TRIM (rc_cms_systembankbranch.branchcd) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'BRANCHCD is null';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK_BRANCH';
            v_tablename := 'CMS_SYSTEM_BANK_BRANCH';
            v_columnname := 'SYSTEM_BANK_BRANCH_CODE';
            v_datas := rc_cms_systembankbranch.branchcd;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_systembankbranch.branchcd) > 4
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'BRANCHCD Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK_BRANCH';
            v_tablename := 'CMS_SYSTEM_BANK_BRANCH';
            v_columnname := 'SYSTEM_BANK_BRANCH_CODE';
            v_datas := rc_cms_systembankbranch.branchcd;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_systembankbranch.branchname IS NULL
            OR TRIM (rc_cms_systembankbranch.branchname) IS NULL
            OR TRIM (rc_cms_systembankbranch.branchname) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'BRANCHNAME is null';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK_BRANCH';
            v_tablename := 'CMS_SYSTEM_BANK_BRANCH';
            v_columnname := 'SYSTEM_BANK_BRANCH_NAME';
            v_datas := rc_cms_systembankbranch.branchname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_systembankbranch.branchname) > 50
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'BRANCHNAME Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK_BRANCH';
            v_tablename := 'CMS_SYSTEM_BANK_BRANCH';
            v_columnname := 'SYSTEM_BANK_BRANCH_NAME';
            v_datas := rc_cms_systembankbranch.branchname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_systembankbranch.telno1) > 15
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'telno1 Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK_BRANCH';
            v_tablename := 'CMS_SYSTEM_BANK_BRANCH';
            v_columnname := 'CONTACT_NUMBER';
            v_datas := rc_cms_systembankbranch.telno1;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_systembankbranch.branchaddress) > 200
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'BRANCHADDRESS Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK_BRANCH';
            v_tablename := 'CMS_SYSTEM_BANK_BRANCH';
            v_columnname := 'ADDRESS';
            v_datas := rc_cms_systembankbranch.branchaddress;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_systembankbranch.rbibankcode) > 9
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'RBIBANKCODE Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK_BRANCH';
            v_tablename := 'CMS_SYSTEM_BANK_BRANCH';
            v_columnname := 'RBI_CODE';
            v_datas := rc_cms_systembankbranch.rbibankcode;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_systembankbranch.faxno) > 15
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'FAXNO Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK_BRANCH';
            v_tablename := 'CMS_SYSTEM_BANK_BRANCH';
            v_columnname := 'FAX_NUMBER';
            v_datas := rc_cms_systembankbranch.faxno;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_systembankbranch.mainbranch) > 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'MAINBRANCH Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK_BRANCH';
            v_tablename := 'CMS_SYSTEM_BANK_BRANCH';
            v_columnname := 'IS_HUB';
            v_datas := rc_cms_systembankbranch.mainbranch;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_systembankbranch.custodian1) > 50
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'CUSTODIAN1 Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK_BRANCH';
            v_tablename := 'CMS_SYSTEM_BANK_BRANCH';
            v_columnname := 'CUSTODIAN1';
            v_datas := rc_cms_systembankbranch.custodian1;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_systembankbranch.custodian2) > 50
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'CUSTODIAN2 Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK_BRANCH';
            v_tablename := 'CMS_SYSTEM_BANK_BRANCH';
            v_columnname := 'CUSTODIAN2';
            v_datas := rc_cms_systembankbranch.custodian2;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_systembankbranch.isvault) > 50
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'ISVAULT Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK_BRANCH';
            v_tablename := 'CMS_SYSTEM_BANK_BRANCH';
            v_columnname := 'IS_VAULT';
            v_datas := rc_cms_systembankbranch.isvault;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_systembankbranch.banksemailid) > 50
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'BANKSEMAILID Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK_BRANCH';
            v_tablename := 'CMS_SYSTEM_BANK_BRANCH';
            v_columnname := 'CONTACT_MAIL';
            v_datas := rc_cms_systembankbranch.banksemailid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF     rc_cms_systembankbranch.custodian1 IS NOT NULL
            AND TRIM (rc_cms_systembankbranch.custodian1) IS NOT NULL
            AND TRIM (rc_cms_systembankbranch.custodian1) <> 'NULL'
         THEN
            ---ntc
            IF UPPER (TRIM (rc_cms_systembankbranch.isvault)) =
                                                           UPPER (TRIM ('Y'))
            THEN
               v_is_vault := 'on';
            ELSE
               v_recordstatus := 'E';
               v_errormessage := NULL;
               v_errormessage :=
                  'Invalid value of ISVAULT as per CUSTODIAN1 and CUSTODIAN2';
               v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK_BRANCH';
               v_tablename := 'CMS_SYSTEM_BANK_BRANCH';
               v_columnname := 'IS_VAULT';
               v_datas := rc_cms_systembankbranch.isvault;
               pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                          v_errormessage,
                                                          v_logmstid,
                                                          v_stage_tablename,
                                                          v_tablename,
                                                          v_columnname,
                                                          v_datas
                                                         );
            END IF;
         ELSE
            v_is_vault := NULL;
         END IF;

         IF     rc_cms_systembankbranch.custodian2 IS NOT NULL
            AND TRIM (rc_cms_systembankbranch.custodian2) IS NOT NULL
            AND TRIM (rc_cms_systembankbranch.custodian2) <> 'NULL'
         THEN
            ---ntc
            IF UPPER (TRIM (rc_cms_systembankbranch.isvault)) =
                                                           UPPER (TRIM ('Y'))
            THEN
               v_is_vault := 'on';
            ELSE
               v_recordstatus := 'E';
               v_errormessage := NULL;
               v_errormessage :=
                  'Invalid value of ISVAULT as per CUSTODIAN1 and CUSTODIAN2';
               v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK_BRANCH';
               v_tablename := 'CMS_SYSTEM_BANK_BRANCH';
               v_columnname := 'IS_VAULT';
               v_datas := rc_cms_systembankbranch.isvault;
               pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                          v_errormessage,
                                                          v_logmstid,
                                                          v_stage_tablename,
                                                          v_tablename,
                                                          v_columnname,
                                                          v_datas
                                                         );
            END IF;
         ELSE
            v_is_vault := NULL;
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM cms_country
          WHERE UPPER (TRIM (country_name)) =
                                UPPER (TRIM (rc_cms_systembankbranch.country));

         IF v_count > 0
         THEN
            SELECT ID
              INTO v_countryid
              FROM cms_country
             WHERE UPPER (TRIM (country_name)) =
                                UPPER (TRIM (rc_cms_systembankbranch.country));
         ELSE
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Invalid COUNTRY';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK_BRANCH';
            v_tablename := 'CMS_SYSTEM_BANK_BRANCH';
            v_columnname := 'COUNTRY_NAME';
            v_datas := rc_cms_systembankbranch.country;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM cms_region
          WHERE UPPER (TRIM (region_name)) =
                             UPPER (TRIM (rc_cms_systembankbranch.regionname))
            AND country_id = v_countryid;

         IF v_count > 0
         THEN
            SELECT ID
              INTO v_regionid
              FROM cms_region
             WHERE UPPER (TRIM (region_name)) =
                             UPPER (TRIM (rc_cms_systembankbranch.regionname))
               AND country_id = v_countryid;
         ELSE
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Invalid REGIONNAME';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK_BRANCH';
            v_tablename := 'CMS_SYSTEM_BANK_BRANCH';
            v_columnname := 'REGION';
            v_datas := rc_cms_systembankbranch.regionname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM cms_state
          WHERE UPPER (TRIM (state_name)) =
                              UPPER (TRIM (rc_cms_systembankbranch.statename))
            AND region_id = v_regionid;

         IF v_count > 0
         THEN
            SELECT ID
              INTO v_stateid
              FROM cms_state
             WHERE UPPER (TRIM (state_name)) =
                              UPPER (TRIM (rc_cms_systembankbranch.statename))
               AND region_id = v_regionid;
         ELSE
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Invalid STATENAME';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK_BRANCH';
            v_tablename := 'CMS_SYSTEM_BANK_BRANCH';
            v_columnname := 'STATE';
            v_datas := rc_cms_systembankbranch.statename;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM cms_city
          WHERE UPPER (TRIM (city_code)) =
                                 UPPER (TRIM (rc_cms_systembankbranch.cityid))
            AND state_id = v_stateid;

         IF v_count > 0
         THEN
            SELECT ID
              INTO v_cityid
              FROM cms_city
             WHERE UPPER (TRIM (city_code)) =
                                 UPPER (TRIM (rc_cms_systembankbranch.cityid))
               AND state_id = v_stateid;
         ELSE
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Invalid CITYID';
            v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK_BRANCH';
            v_tablename := 'CMS_SYSTEM_BANK_BRANCH';
            v_columnname := 'CITY_TOWN';
            v_datas := rc_cms_systembankbranch.cityid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF v_recordstatus = v_ismigrated
         THEN
            IF NVL (INSTR (rc_cms_systembankbranch.telno1, ','), 0) > 0
            THEN
               IF NVL (LENGTH (rc_cms_systembankbranch.telno1), 0) >
                         NVL (INSTR (rc_cms_systembankbranch.telno1, ','), 0)
               THEN
                  v_errormessage := NULL;
                  v_errormessage :=
                     'TELNO1 column consists of more than 1 tel no. Only First tel.no. has been migrated.';
                  v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK_BRANCH';
                  v_tablename := 'CMS_SYSTEM_BANK_BRANCH';
                  v_columnname := 'CONTACT_NUMBER';
                  v_datas := rc_cms_systembankbranch.telno1;
                  pkg_climsmigration.sp_dm_insertlogdetails
                                                          (v_totalrecords,
                                                           v_errormessage,
                                                           v_logmstid,
                                                           v_stage_tablename,
                                                           v_tablename,
                                                           v_columnname,
                                                           v_datas
                                                          );
               END IF;
            END IF;

            SELECT MIN (ID)
              INTO v_cms_system_bankid
              FROM cms_system_bank
             WHERE UPPER (TRIM (system_bank_name)) =
                               UPPER (TRIM (rc_cms_systembankbranch.bankname));

            SELECT stage_system_bank_branch_seq.NEXTVAL
              INTO v_cms_stage_systembankbranchid
              FROM DUAL;

            INSERT INTO cms_stage_system_bank_branch
                        (ID, version_time,
                         create_by, creation_date, last_update_by,
                         last_update_date, deprecated, status,
                         system_bank_branch_code,
                         system_bank_branch_name,
                         system_bank_code,
                         contact_number,
                         address, master_id,
                         rbi_code,
                         fax_number,
                         is_hub,
                         custodian1,
                         custodian2, city_town,
                         region, state, country, is_vault,
                         contact_mail
                        )
                 VALUES (v_cms_stage_systembankbranchid, v_version,
                         v_createby, v_app_timestamp, v_lastupdateby,
                         v_app_timestamp, v_deprecated, v_status,
                         rc_cms_systembankbranch.branchcd,
                         rc_cms_systembankbranch.branchname,
                         v_cms_system_bankid,
                         SUBSTR (rc_cms_systembankbranch.telno1,
                                 1,
                                   INSTR (rc_cms_systembankbranch.telno1, ',')
                                 - 1
                                ),
                         rc_cms_systembankbranch.branchaddress, 0,
                         rc_cms_systembankbranch.rbibankcode,
                         rc_cms_systembankbranch.faxno,
                         rc_cms_systembankbranch.mainbranch,
                         rc_cms_systembankbranch.custodian1,
                         rc_cms_systembankbranch.custodian2, v_cityid,
                         v_regionid, v_stateid, v_countryid, v_is_vault,
                         rc_cms_systembankbranch.banksemailid
                        );

            SELECT cms_system_bank_branch_seq.NEXTVAL
              INTO v_cms_systembankbranchid
              FROM DUAL;

            INSERT INTO cms_system_bank_branch
                        (ID, version_time, create_by,
                         creation_date, last_update_by, last_update_date,
                         deprecated, status,
                         system_bank_branch_code,
                         system_bank_branch_name,
                         system_bank_code,
                         contact_number,
                         address, master_id,
                         rbi_code,
                         fax_number,
                         is_hub,
                         custodian1,
                         custodian2, city_town,
                         region, state, country, is_vault,
                         contact_mail
                        )
                 VALUES (v_cms_systembankbranchid, v_version, v_createby,
                         v_app_timestamp, v_lastupdateby, v_app_timestamp,
                         v_deprecated, v_status,
                         rc_cms_systembankbranch.branchcd,
                         rc_cms_systembankbranch.branchname,
                         v_cms_system_bankid,
                         SUBSTR (rc_cms_systembankbranch.telno1,
                                 1,
                                   INSTR (rc_cms_systembankbranch.telno1, ',')
                                 - 1
                                ),
                         rc_cms_systembankbranch.branchaddress, 0,
                         rc_cms_systembankbranch.rbibankcode,
                         rc_cms_systembankbranch.faxno,
                         rc_cms_systembankbranch.mainbranch,
                         rc_cms_systembankbranch.custodian1,
                         rc_cms_systembankbranch.custodian2, v_cityid,
                         v_regionid, v_stateid, v_countryid, v_is_vault,
                         rc_cms_systembankbranch.banksemailid
                        );

            SELECT    TO_CHAR (SYSDATE, 'YYYYMMDD')
                   || '00000'
                   || (MAX (TO_NUMBER (SUBSTR (transaction_id, 14))) + 1)
              INTO v_transaction_id
              FROM TRANSACTION;

            INSERT INTO TRANSACTION
                        (transaction_id, from_state, user_id,
                         login_id, transaction_type, creation_date,
                         transaction_date, reference_id, status,
                         staging_reference_id, team_id,
                         VERSION, opsdesc,
                         user_info,
                         cur_trx_history_id, team_type_id,
                         team_membership_id
                        )
                 VALUES (v_transaction_id, vtrans_from_state, v_user_id,
                         v_login_id, v_transaction_type, v_app_date,
                         v_app_date, v_cms_systembankbranchid, vtrans_status,
                         v_cms_stage_systembankbranchid, v_team_id,
                         vtrans_version, v_transopsdesc,
                         v_user_name || ' ( ' || v_login_id || ' )',
                         v_transaction_id, v_team_type_id,
                         v_team_membership_id
                        );

            -- Updating ID and Flag in migration database.
            UPDATE mig_cms_system_bank_branch
               SET ismigrated = v_recordstatus,
                   stage_idmig = v_cms_stage_systembankbranchid,
                   idmig = v_cms_systembankbranchid,
                   trans_idmig = v_transaction_id
             WHERE CURRENT OF cr_cms_systembankbranch;

            v_migratedrecords := v_migratedrecords + 1;
         ELSE
            -- Found error for record
            v_statusflag := 'ERROR';

            -- Updating Flag in migration database.
            UPDATE mig_cms_system_bank_branch
               SET ismigrated = v_recordstatus
             WHERE CURRENT OF cr_cms_systembankbranch;
         END IF;
      END LOOP;

      CLOSE cr_cms_systembankbranch;

      OPEN cr_cms_sysbankbranchlinkhub;

      LOOP
         FETCH cr_cms_sysbankbranchlinkhub
          INTO rc_cms_sysbankbranchlinkhub;

         EXIT WHEN cr_cms_sysbankbranchlinkhub%NOTFOUND;

         IF UPPER (TRIM (rc_cms_sysbankbranchlinkhub.mainbranch)) = 'N'
         THEN
            SELECT COUNT (1)
              INTO v_count
              FROM cms_system_bank_branch
             WHERE UPPER (system_bank_branch_name) =
                               UPPER (rc_cms_sysbankbranchlinkhub.linkedtohub);

            IF v_count > 0
            THEN
               SELECT ID
                 INTO v_cms_sysbank_branchlinkhubid
                 FROM cms_system_bank_branch
                WHERE UPPER (system_bank_branch_name) =
                               UPPER (rc_cms_sysbankbranchlinkhub.linkedtohub);

               UPDATE cms_stage_system_bank_branch
                  SET linked_hub = v_cms_sysbank_branchlinkhubid
                WHERE UPPER (system_bank_branch_code) =
                                  UPPER (rc_cms_sysbankbranchlinkhub.branchcd)
                  AND UPPER (system_bank_branch_name) =
                                UPPER (rc_cms_sysbankbranchlinkhub.branchname);

               UPDATE cms_system_bank_branch
                  SET linked_hub = v_cms_sysbank_branchlinkhubid
                WHERE UPPER (system_bank_branch_code) =
                                  UPPER (rc_cms_sysbankbranchlinkhub.branchcd)
                  AND UPPER (system_bank_branch_name) =
                                UPPER (rc_cms_sysbankbranchlinkhub.branchname);
            ELSE
               v_recordstatus := 'E';
               v_errormessage := NULL;
               v_errormessage :=
                  'LINKEDTOHUB Branch name not present in System Bank Master';
               v_stage_tablename := 'CMS_STAGE_SYSTEM_BANK_BRANCH';
               v_tablename := 'CMS_SYSTEM_BANK_BRANCH';
               v_columnname := 'LINKED_HUB';
               v_datas := rc_cms_sysbankbranchlinkhub.linkedtohub;
               pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                          v_errormessage,
                                                          v_logmstid,
                                                          v_stage_tablename,
                                                          v_tablename,
                                                          v_columnname,
                                                          v_datas
                                                         );
               v_statusflag := 'ERROR';
            END IF;
         END IF;
      END LOOP;

      CLOSE cr_cms_sysbankbranchlinkhub;

      -- Logging  Migration Details
      INSERT INTO logmst
                  (ID, dmid, sequenceno,
                   stage_tablename, tablename,
                   totalrecords, migratedrecords, starttime, endtime,
                   status
                  )
           VALUES (v_logmstid, v_logmstid, v_dmseqno,
                   'CMS_STAGE_SYSTEM_BANK_BRANCH', 'CMS_SYSTEM_BANK_BRANCH',
                   v_totalrecords, v_migratedrecords, v_starttime, SYSDATE,
                   v_statusflag
                  );
   END sp_dm_systembankbranch;

   PROCEDURE sp_dm_otherbank (v_ismigrated IN CHAR)
   IS
      CURSOR cr_cms_otherbank
      IS
         SELECT        *
                  FROM mig_cms_other_bank
                 WHERE ismigrated = 'N'
         FOR UPDATE OF ismigrated;

      rc_cms_otherbank          cr_cms_otherbank%ROWTYPE;
      v_cms_stage_otherbankid   NUMBER (19);
      v_cms_otherbankid         NUMBER (19);
   BEGIN
      v_totalrecords := 0;
      v_migratedrecords := 0;
      v_transaction_type := 'OTHER_BANK';
      vtrans_from_state := 'PENDING_CREATE';

      -- Getting Sequence ID for LogMst ID.
      SELECT logmst_sq.NEXTVAL
        INTO v_logmstid
        FROM DUAL;

      -- Setting data migration sequence no.
      v_dmseqno := v_dmseqno + 1;
      -- Setting StatusFlag as Successfull by default
      v_statusflag := 'SUCCESSFULL';

      -- Setting start time for migration.
      SELECT SYSDATE
        INTO v_starttime
        FROM DUAL;

      SELECT operation
        INTO v_transopsdesc
        FROM (SELECT operation, ROWNUM AS rownum1
                FROM tr_state_matrix
               WHERE stateins = v_transaction_type
                 AND fromstate = vtrans_from_state
                 AND tostate = 'ACTIVE'
                 AND userstate = 'ACTIVE'
                 AND enableind = 1
                 AND frontendop = 1)
       WHERE rownum1 = 1;

      OPEN cr_cms_otherbank;

      LOOP
         FETCH cr_cms_otherbank
          INTO rc_cms_otherbank;

         EXIT WHEN cr_cms_otherbank%NOTFOUND;
         v_totalrecords := v_totalrecords + 1;
         v_recordstatus := v_ismigrated;
         v_errormessage := NULL;

         IF    rc_cms_otherbank.bankid IS NULL
            OR TRIM (rc_cms_otherbank.bankid) IS NULL
            OR TRIM (rc_cms_otherbank.bankid) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'BankID is null';
            v_stage_tablename := 'CMS_STAGE_OTHER_BANK';
            v_tablename := 'CMS_OTHER_BANK';
            v_columnname := 'BANK_CODE';
            v_datas := rc_cms_otherbank.bankid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_otherbank.bankid) > 10
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'BankID Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_OTHER_BANK';
            v_tablename := 'CMS_OTHER_BANK';
            v_columnname := 'BANK_CODE';
            v_datas := rc_cms_otherbank.bankid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_otherbank.bankname IS NULL
            OR TRIM (rc_cms_otherbank.bankname) IS NULL
            OR TRIM (rc_cms_otherbank.bankname) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'BankName is null';
            v_stage_tablename := 'CMS_STAGE_OTHER_BANK';
            v_tablename := 'CMS_OTHER_BANK';
            v_columnname := 'BANK_NAME';
            v_datas := rc_cms_otherbank.bankname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_otherbank.bankname) > 100
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'BankName Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_OTHER_BANK';
            v_tablename := 'CMS_OTHER_BANK';
            v_columnname := 'BANK_NAME';
            v_datas := rc_cms_otherbank.bankname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         SELECT COUNT (*)
           INTO v_duplicaterecords
           FROM cms_other_bank
          WHERE UPPER (bank_name) = UPPER (rc_cms_otherbank.bankname);

         IF v_duplicaterecords > 0
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Record Already Exists';
            v_stage_tablename := 'CMS_STAGE_OTHER_BANK';
            v_tablename := 'CMS_OTHER_BANK';
            v_columnname := 'BANK_NAME';
            v_datas := rc_cms_otherbank.bankname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF v_recordstatus = v_ismigrated
         THEN
            SELECT cms_stage_other_bank_seq.NEXTVAL
              INTO v_cms_stage_otherbankid
              FROM DUAL;

            INSERT INTO cms_stage_other_bank
                        (ID, bank_code,
                         bank_name, version_time, create_by,
                         creation_date, last_update_by, last_update_date,
                         deprecated, status
                        )
                 VALUES (v_cms_stage_otherbankid, rc_cms_otherbank.bankid,
                         rc_cms_otherbank.bankname, v_version, v_createby,
                         v_app_timestamp, v_lastupdateby, v_app_timestamp,
                         v_deprecated, v_status
                        );

            SELECT cms_other_bank_seq.NEXTVAL
              INTO v_cms_otherbankid
              FROM DUAL;

            INSERT INTO cms_other_bank
                        (ID, bank_code,
                         bank_name, version_time, create_by,
                         creation_date, last_update_by, last_update_date,
                         deprecated, status
                        )
                 VALUES (v_cms_otherbankid, rc_cms_otherbank.bankid,
                         rc_cms_otherbank.bankname, v_version, v_createby,
                         v_app_timestamp, v_lastupdateby, v_app_timestamp,
                         v_deprecated, v_status
                        );

            SELECT    TO_CHAR (SYSDATE, 'YYYYMMDD')
                   || '00000'
                   || (MAX (TO_NUMBER (SUBSTR (transaction_id, 14))) + 1)
              INTO v_transaction_id
              FROM TRANSACTION;

            INSERT INTO TRANSACTION
                        (transaction_id, from_state, user_id,
                         login_id, transaction_type, creation_date,
                         transaction_date, reference_id, status,
                         staging_reference_id, team_id, VERSION,
                         opsdesc,
                         user_info,
                         cur_trx_history_id, team_type_id,
                         team_membership_id
                        )
                 VALUES (v_transaction_id, vtrans_from_state, v_user_id,
                         v_login_id, v_transaction_type, v_app_date,
                         v_app_date, v_cms_otherbankid, vtrans_status,
                         v_cms_stage_otherbankid, v_team_id, vtrans_version,
                         v_transopsdesc,
                         v_user_name || ' ( ' || v_login_id || ' )',
                         v_transaction_id, v_team_type_id,
                         v_team_membership_id
                        );

            -- Updating ID and Flag in migration database.
            UPDATE mig_cms_other_bank
               SET ismigrated = v_recordstatus,
                   stage_idmig = v_cms_stage_otherbankid,
                   idmig = v_cms_otherbankid,
                   trans_idmig = v_transaction_id
             WHERE CURRENT OF cr_cms_otherbank;

            v_migratedrecords := v_migratedrecords + 1;
         ELSE
            -- Found error for record
            v_statusflag := 'ERROR';

            -- Updating Flag in migration database.
            UPDATE mig_cms_other_bank
               SET ismigrated = v_recordstatus
             WHERE CURRENT OF cr_cms_otherbank;
         END IF;
      END LOOP;

      CLOSE cr_cms_otherbank;

      -- Logging  Migration Details
      INSERT INTO logmst
                  (ID, dmid, sequenceno, stage_tablename,
                   tablename, totalrecords, migratedrecords,
                   starttime, endtime, status
                  )
           VALUES (v_logmstid, v_logmstid, v_dmseqno, 'CMS_STAGE_OTHER_BANK',
                   'CMS_OTHER_BANK', v_totalrecords, v_migratedrecords,
                   v_starttime, SYSDATE, v_statusflag
                  );
   END sp_dm_otherbank;

   PROCEDURE sp_dm_otherbankbranch (v_ismigrated IN CHAR)
   IS
      CURSOR cr_cms_otherbankbranch
      IS
         SELECT        *
                  FROM mig_cms_other_bank_branch
                 WHERE ismigrated = 'N'
         FOR UPDATE OF ismigrated;

      rc_cms_otherbankbranch          cr_cms_otherbankbranch%ROWTYPE;
      v_cms_stage_otherbankbranchid   NUMBER (19);
      v_cms_otherbankbranchid         NUMBER (19);
      v_other_bank_code               VARCHAR2 (30 CHAR);
   BEGIN
      v_totalrecords := 0;
      v_migratedrecords := 0;
      v_transaction_type := 'OTHER_BANK_BRANCH';
      vtrans_from_state := 'PENDING_CREATE';

      -- Getting Sequence ID for LogMst ID.
      SELECT logmst_sq.NEXTVAL
        INTO v_logmstid
        FROM DUAL;

      -- Setting data migration sequence no.
      v_dmseqno := v_dmseqno + 1;
      -- Setting StatusFlag as Successfull by default
      v_statusflag := 'SUCCESSFULL';

      -- Setting start time for migration.
      SELECT SYSDATE
        INTO v_starttime
        FROM DUAL;

      SELECT operation
        INTO v_transopsdesc
        FROM (SELECT operation, ROWNUM AS rownum1
                FROM tr_state_matrix
               WHERE stateins = v_transaction_type
                 AND fromstate = vtrans_from_state
                 AND tostate = 'ACTIVE'
                 AND userstate = 'ACTIVE'
                 AND enableind = 1
                 AND frontendop = 1)
       WHERE rownum1 = 1;

      OPEN cr_cms_otherbankbranch;

      LOOP
         FETCH cr_cms_otherbankbranch
          INTO rc_cms_otherbankbranch;

         EXIT WHEN cr_cms_otherbankbranch%NOTFOUND;
         v_totalrecords := v_totalrecords + 1;
         v_recordstatus := v_ismigrated;
         v_errormessage := NULL;

         IF    rc_cms_otherbankbranch.branchname IS NULL
            OR TRIM (rc_cms_otherbankbranch.branchname) IS NULL
            OR TRIM (rc_cms_otherbankbranch.branchname) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'BRANCHNAME is null';
            v_stage_tablename := 'CMS_STAGE_OTHER_BANK_BRANCH';
            v_tablename := 'CMS_OTHER_BANK_BRANCH';
            v_columnname := 'BRANCH_NAME';
            v_datas := rc_cms_otherbankbranch.branchname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_otherbankbranch.branchname) > 50
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'BRANCHNAME Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_OTHER_BANK_BRANCH';
            v_tablename := 'CMS_OTHER_BANK_BRANCH';
            v_columnname := 'BRANCH_NAME';
            v_datas := rc_cms_otherbankbranch.branchname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_otherbankbranch.branchaddress) > 200
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'BRANCHADDRESS Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_OTHER_BANK_BRANCH';
            v_tablename := 'CMS_OTHER_BANK_BRANCH';
            v_columnname := 'ADDRESS';
            v_datas := rc_cms_otherbankbranch.branchaddress;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_otherbankbranch.telno1) > 15
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'TELNO1 Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_OTHER_BANK_BRANCH';
            v_tablename := 'CMS_OTHER_BANK_BRANCH';
            v_columnname := 'CONTACT_NUMBER';
            v_datas := rc_cms_otherbankbranch.telno1;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_otherbankbranch.faxno) > 15
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'FAXNO Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_OTHER_BANK_BRANCH';
            v_tablename := 'CMS_OTHER_BANK_BRANCH';
            v_columnname := 'FAX_NO';
            v_datas := rc_cms_otherbankbranch.faxno;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_otherbankbranch.rbibankcode) > 9
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'RBIBANKCODE Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_OTHER_BANK_BRANCH';
            v_tablename := 'CMS_OTHER_BANK_BRANCH';
            v_columnname := 'RBI_CODE';
            v_datas := rc_cms_otherbankbranch.rbibankcode;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

/*
         SELECT COUNT (1)
           INTO v_count
           FROM cms_city
          WHERE UPPER (city_name) = UPPER (rc_cms_otherbankbranch.city);

         IF v_count = 1
         THEN
            SELECT ID, state_id
              INTO v_cityid, v_stateid
              FROM cms_city
             WHERE UPPER (city_name) = UPPER (rc_cms_otherbankbranch.city);

            IF    v_stateid IS NULL
               OR TRIM (v_stateid) IS NULL
               OR TRIM (v_stateid) = 'NULL'
            THEN
               v_recordstatus := 'E';
               v_errormessage := NULL;
               v_errormessage :=
                     'State not present for the City:'
                  || rc_cms_otherbankbranch.city;
               v_stage_tablename := 'CMS_STAGE_OTHER_BANK_BRANCH';
               v_tablename := 'CMS_OTHER_BANK_BRANCH';
               v_columnname := 'STATE';
               v_datas := v_stateid;
               pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                          v_errormessage,
                                                          v_logmstid,
                                                          v_stage_tablename,
                                                          v_tablename,
                                                          v_columnname,
                                                          v_datas
                                                         );
            END IF;

            IF v_recordstatus = v_ismigrated
            THEN
               SELECT region_id
                 INTO v_regionid
                 FROM cms_state
                WHERE ID = v_stateid;

               IF    v_regionid IS NULL
                  OR TRIM (v_regionid) IS NULL
                  OR TRIM (v_regionid) = 'NULL'
               THEN
                  v_recordstatus := 'E';
                  v_errormessage := NULL;
                  v_errormessage :=
                        'Region not present for the City:'
                     || rc_cms_otherbankbranch.city;
                  v_stage_tablename := 'CMS_STAGE_OTHER_BANK_BRANCH';
                  v_tablename := 'CMS_OTHER_BANK_BRANCH';
                  v_columnname := 'REGION';
                  v_datas := v_regionid;
                  pkg_climsmigration.sp_dm_insertlogdetails
                                                           (v_totalrecords,
                                                            v_errormessage,
                                                            v_logmstid,
                                                            v_stage_tablename,
                                                            v_tablename,
                                                            v_columnname,
                                                            v_datas
                                                           );
               END IF;
            END IF;

            IF v_recordstatus = v_ismigrated
            THEN
               SELECT country_id
                 INTO v_countryid
                 FROM cms_region
                WHERE ID = v_regionid;

               IF    v_countryid IS NULL
                  OR TRIM (v_countryid) IS NULL
                  OR TRIM (v_countryid) = 'NULL'
               THEN
                  v_recordstatus := 'E';
                  v_errormessage := NULL;
                  v_errormessage :=
                        'Country not present for the City:'
                     || rc_cms_otherbankbranch.city;
                  v_stage_tablename := 'CMS_STAGE_OTHER_BANK_BRANCH';
                  v_tablename := 'CMS_OTHER_BANK_BRANCH';
                  v_columnname := 'COUNTRY';
                  v_datas := v_countryid;
                  pkg_climsmigration.sp_dm_insertlogdetails
                                                           (v_totalrecords,
                                                            v_errormessage,
                                                            v_logmstid,
                                                            v_stage_tablename,
                                                            v_tablename,
                                                            v_columnname,
                                                            v_datas
                                                           );
               END IF;
            END IF;


         ELSIF v_count > 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'City name duplicated in the city master';
            v_stage_tablename := 'CMS_STAGE_OTHER_BANK_BRANCH';
            v_tablename := 'CMS_OTHER_BANK_BRANCH';
            v_columnname := 'CITY_TOWN';
            v_datas := rc_cms_otherbankbranch.city;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         ELSIF v_count < 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Invalid CITYID';
            v_stage_tablename := 'CMS_STAGE_OTHER_BANK_BRANCH';
            v_tablename := 'CMS_OTHER_BANK_BRANCH';
            v_columnname := 'CITY_TOWN';
            v_datas := rc_cms_otherbankbranch.city;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

       */
         SELECT COUNT (1)
           INTO v_count
           FROM cms_country
          WHERE UPPER (TRIM (country_name)) =
                                 UPPER (TRIM (rc_cms_otherbankbranch.country));

         IF v_count > 0
         THEN
            SELECT ID
              INTO v_countryid
              FROM cms_country
             WHERE UPPER (TRIM (country_name)) =
                                 UPPER (TRIM (rc_cms_otherbankbranch.country));
         ELSE
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Invalid COUNTRY';
            v_stage_tablename := 'CMS_STAGE_OTHER_BANK_BRANCH';
            v_tablename := 'CMS_OTHER_BANK_BRANCH';
            v_columnname := 'COUNTRY_NAME';
            v_datas := rc_cms_otherbankbranch.country;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM cms_region
          WHERE UPPER (TRIM (region_name)) =
                              UPPER (TRIM (rc_cms_otherbankbranch.regionname))
            AND country_id = v_countryid;

         IF v_count > 0
         THEN
            SELECT ID
              INTO v_regionid
              FROM cms_region
             WHERE UPPER (TRIM (region_name)) =
                              UPPER (TRIM (rc_cms_otherbankbranch.regionname))
               AND country_id = v_countryid;
         ELSE
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Invalid REGIONNAME';
            v_stage_tablename := 'CMS_STAGE_OTHER_BANK_BRANCH';
            v_tablename := 'CMS_OTHER_BANK_BRANCH';
            v_columnname := 'REGION';
            v_datas := rc_cms_otherbankbranch.regionname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM cms_state
          WHERE UPPER (TRIM (state_name)) =
                               UPPER (TRIM (rc_cms_otherbankbranch.statename))
            AND region_id = v_regionid;

         IF v_count > 0
         THEN
            SELECT ID
              INTO v_stateid
              FROM cms_state
             WHERE UPPER (TRIM (state_name)) =
                               UPPER (TRIM (rc_cms_otherbankbranch.statename))
               AND region_id = v_regionid;
         ELSE
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Invalid STATENAME';
            v_stage_tablename := 'CMS_STAGE_OTHER_BANK_BRANCH';
            v_tablename := 'CMS_OTHER_BANK_BRANCH';
            v_columnname := 'STATE';
            v_datas := rc_cms_otherbankbranch.statename;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM cms_city
          WHERE UPPER (TRIM (city_code)) =
                                    UPPER (TRIM (rc_cms_otherbankbranch.city))
            AND state_id = v_stateid;

         IF v_count > 0
         THEN
            SELECT ID
              INTO v_cityid
              FROM cms_city
             WHERE UPPER (TRIM (city_code)) =
                                    UPPER (TRIM (rc_cms_otherbankbranch.city))
               AND state_id = v_stateid;
         ELSE
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Invalid CITYID';
            v_stage_tablename := 'CMS_STAGE_OTHER_BANK_BRANCH';
            v_tablename := 'CMS_OTHER_BANK_BRANCH';
            v_columnname := 'CITY_TOWN';
            v_datas := rc_cms_otherbankbranch.city;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM cms_other_bank
          WHERE UPPER (bank_name) = UPPER (rc_cms_otherbankbranch.bankname);

         IF v_count > 0
         THEN
            SELECT ID
              INTO v_other_bank_code
              FROM cms_other_bank
             WHERE UPPER (bank_name) = UPPER (rc_cms_otherbankbranch.bankname);
         ELSE
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'BANKNAME is not in master';
            v_stage_tablename := 'CMS_STAGE_OTHER_BANK_BRANCH';
            v_tablename := 'CMS_OTHER_BANK_BRANCH';
            v_columnname := 'OTHER_BANK_CODE';
            v_datas := rc_cms_otherbankbranch.bankname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF v_recordstatus = v_ismigrated
         THEN
            IF NVL (INSTR (rc_cms_otherbankbranch.telno1, ','), 0) > 0
            THEN
               IF NVL (LENGTH (rc_cms_otherbankbranch.telno1), 0) >
                          NVL (INSTR (rc_cms_otherbankbranch.telno1, ','), 0)
               THEN
                  v_errormessage := NULL;
                  v_errormessage :=
                     'Telephone column consists of more than 1 tel no. Only First tel.no. has been migrated.';
                  v_stage_tablename := 'CMS_STAGE_OTHER_BANK_BRANCH';
                  v_tablename := 'CMS_OTHER_BANK_BRANCH';
                  v_columnname := 'CONTACT_NUMBER';
                  v_datas := rc_cms_otherbankbranch.telno1;
                  pkg_climsmigration.sp_dm_insertlogdetails
                                                          (v_totalrecords,
                                                           v_errormessage,
                                                           v_logmstid,
                                                           v_stage_tablename,
                                                           v_tablename,
                                                           v_columnname,
                                                           v_datas
                                                          );
               END IF;
            END IF;

            SELECT stage_other_bank_branch_seq.NEXTVAL
              INTO v_cms_stage_otherbankbranchid
              FROM DUAL;

            INSERT INTO cms_stage_other_bank_branch
                        (ID,
                         branch_code, other_bank_code,
                         branch_name,
                         address, city_town,
                         state, country, region,
                         contact_number,
                         version_time, create_by, creation_date,
                         last_update_by, last_update_date, deprecated,
                         status, fax_no,
                         rbi_code
                        )
                 VALUES (v_cms_stage_otherbankbranchid,
                         v_cms_stage_otherbankbranchid, v_other_bank_code,
                         rc_cms_otherbankbranch.branchname,
                         rc_cms_otherbankbranch.branchaddress, v_cityid,
                         v_stateid, v_countryid, v_regionid,
                         SUBSTR (rc_cms_otherbankbranch.telno1,
                                 1,
                                 INSTR (rc_cms_otherbankbranch.telno1, ',')
                                 - 1
                                ),
                         v_version, v_createby, v_app_timestamp,
                         v_lastupdateby, v_app_timestamp, v_deprecated,
                         v_status, rc_cms_otherbankbranch.faxno,
                         rc_cms_otherbankbranch.rbibankcode
                        );

            SELECT other_bank_branch_seq.NEXTVAL
              INTO v_cms_otherbankbranchid
              FROM DUAL;

            INSERT INTO cms_other_bank_branch
                        (ID, branch_code,
                         other_bank_code,
                         branch_name,
                         address, city_town,
                         state, country, region,
                         contact_number,
                         version_time, create_by, creation_date,
                         last_update_by, last_update_date, deprecated,
                         status, fax_no,
                         rbi_code
                        )
                 VALUES (v_cms_otherbankbranchid, v_cms_otherbankbranchid,
                         v_other_bank_code,
                         rc_cms_otherbankbranch.branchname,
                         rc_cms_otherbankbranch.branchaddress, v_cityid,
                         v_stateid, v_countryid, v_regionid,
                         SUBSTR (rc_cms_otherbankbranch.telno1,
                                 1,
                                 INSTR (rc_cms_otherbankbranch.telno1, ',')
                                 - 1
                                ),
                         v_version, v_createby, v_app_timestamp,
                         v_lastupdateby, v_app_timestamp, v_deprecated,
                         v_status, rc_cms_otherbankbranch.faxno,
                         rc_cms_otherbankbranch.rbibankcode
                        );

            SELECT    TO_CHAR (SYSDATE, 'YYYYMMDD')
                   || '00000'
                   || (MAX (TO_NUMBER (SUBSTR (transaction_id, 14))) + 1)
              INTO v_transaction_id
              FROM TRANSACTION;

            INSERT INTO TRANSACTION
                        (transaction_id, from_state, user_id,
                         login_id, transaction_type, creation_date,
                         transaction_date, reference_id, status,
                         staging_reference_id, team_id,
                         VERSION, opsdesc,
                         user_info,
                         cur_trx_history_id, team_type_id,
                         team_membership_id
                        )
                 VALUES (v_transaction_id, vtrans_from_state, v_user_id,
                         v_login_id, v_transaction_type, v_app_date,
                         v_app_date, v_cms_otherbankbranchid, vtrans_status,
                         v_cms_stage_otherbankbranchid, v_team_id,
                         vtrans_version, v_transopsdesc,
                         v_user_name || ' ( ' || v_login_id || ' )',
                         v_transaction_id, v_team_type_id,
                         v_team_membership_id
                        );

            -- Updating ID and Flag in migration database.
            UPDATE mig_cms_other_bank_branch
               SET ismigrated = v_recordstatus,
                   stage_idmig = v_cms_stage_otherbankbranchid,
                   idmig = v_cms_otherbankbranchid,
                   trans_idmig = v_transaction_id
             WHERE CURRENT OF cr_cms_otherbankbranch;

            v_migratedrecords := v_migratedrecords + 1;
         ELSE
            -- Found error for record
            v_statusflag := 'ERROR';

            -- Updating Flag in migration database.
            UPDATE mig_cms_other_bank_branch
               SET ismigrated = v_recordstatus
             WHERE CURRENT OF cr_cms_otherbankbranch;
         END IF;
      END LOOP;

      CLOSE cr_cms_otherbankbranch;

      -- Logging  Migration Details
      INSERT INTO logmst
                  (ID, dmid, sequenceno,
                   stage_tablename, tablename,
                   totalrecords, migratedrecords, starttime, endtime,
                   status
                  )
           VALUES (v_logmstid, v_logmstid, v_dmseqno,
                   'CMS_STAGE_OTHER_BANK_BRANCH', 'CMS_OTHER_BANK_BRANCH',
                   v_totalrecords, v_migratedrecords, v_starttime, SYSDATE,
                   v_statusflag
                  );
   END sp_dm_otherbankbranch;

   PROCEDURE sp_dm_credit_approval (v_ismigrated IN CHAR)
   IS
      CURSOR cr_cms_credit_approval
      IS
         SELECT        *
                  FROM mig_credit_approval
                 WHERE ismigrated = 'N'
         FOR UPDATE OF ismigrated;

      rc_cms_credit_approval          cr_cms_credit_approval%ROWTYPE;
      v_cms_stage_credit_approvalid   NUMBER (19);
      v_cms_credit_approvalid         NUMBER (19);
      v_segment                       VARCHAR2 (60);
   BEGIN
      v_totalrecords := 0;
      v_migratedrecords := 0;
      v_transaction_type := 'CREDIT_APPROVAL';
      vtrans_from_state := 'PENDING_CREATE';

      -- Getting Sequence ID for LogMst ID.
      SELECT logmst_sq.NEXTVAL
        INTO v_logmstid
        FROM DUAL;

      -- Setting data migration sequence no.
      v_dmseqno := v_dmseqno + 1;
      -- Setting StatusFlag as Successfull by default
      v_statusflag := 'SUCCESSFULL';

      -- Setting start time for migration.
      SELECT SYSDATE
        INTO v_starttime
        FROM DUAL;

      SELECT operation
        INTO v_transopsdesc
        FROM (SELECT operation, ROWNUM AS rownum1
                FROM tr_state_matrix
               WHERE stateins = v_transaction_type
                 AND fromstate = vtrans_from_state
                 AND tostate = 'ACTIVE'
                 AND userstate = 'ACTIVE'
                 AND enableind = 1
                 AND frontendop = 1)
       WHERE rownum1 = 1;

      OPEN cr_cms_credit_approval;

      LOOP
         FETCH cr_cms_credit_approval
          INTO rc_cms_credit_approval;

         EXIT WHEN cr_cms_credit_approval%NOTFOUND;
         v_totalrecords := v_totalrecords + 1;
         v_recordstatus := v_ismigrated;
         v_errormessage := NULL;

         IF    rc_cms_credit_approval.approverid IS NULL
            OR TRIM (rc_cms_credit_approval.approverid) IS NULL
            OR TRIM (rc_cms_credit_approval.approverid) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'APPROVERID is null';
            v_stage_tablename := 'CMS_STAGE_CREDIT_APPROVAL';
            v_tablename := 'CMS_CREDIT_APPROVAL';
            v_columnname := 'APPROVAL_CODE';
            v_datas := rc_cms_credit_approval.approverid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_credit_approval.approverid) > 10
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'APPROVERID  Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_CREDIT_APPROVAL';
            v_tablename := 'CMS_CREDIT_APPROVAL';
            v_columnname := 'APPROVAL_CODE';
            v_datas := rc_cms_credit_approval.approverid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_credit_approval.approvername IS NULL
            OR TRIM (rc_cms_credit_approval.approvername) IS NULL
            OR TRIM (rc_cms_credit_approval.approvername) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'APPROVERNAME is null';
            v_stage_tablename := 'CMS_STAGE_CREDIT_APPROVAL';
            v_tablename := 'CMS_CREDIT_APPROVAL';
            v_columnname := 'APPROVAL_NAME';
            v_datas := rc_cms_credit_approval.approvername;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_credit_approval.approvername) > 100
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'APPROVERNAME is null';
            v_stage_tablename := 'CMS_STAGE_CREDIT_APPROVAL';
            v_tablename := 'CMS_CREDIT_APPROVAL';
            v_columnname := 'APPROVAL_NAME';
            v_datas := rc_cms_credit_approval.approvername;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_credit_approval.maxagrlimit) > 20
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'MAXAGRLIMIT is null';
            v_stage_tablename := 'CMS_STAGE_CREDIT_APPROVAL';
            v_tablename := 'CMS_CREDIT_APPROVAL';
            v_columnname := 'MAXIMUM_LIMIT';
            v_datas := rc_cms_credit_approval.maxagrlimit;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_credit_approval.discpower) > 20
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'DISCPOWER is null';
            v_stage_tablename := 'CMS_STAGE_CREDIT_APPROVAL';
            v_tablename := 'CMS_CREDIT_APPROVAL';
            v_columnname := 'MINIMUM_LIMIT';
            v_datas := rc_cms_credit_approval.discpower;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_credit_approval.ccmailid) > 50
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'CCMAILID is null';
            v_stage_tablename := 'CMS_STAGE_CREDIT_APPROVAL';
            v_tablename := 'CMS_CREDIT_APPROVAL';
            v_columnname := 'EMAIL';
            v_datas := rc_cms_credit_approval.ccmailid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_credit_approval.senior) > 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'SENIOR is null';
            v_stage_tablename := 'CMS_STAGE_CREDIT_APPROVAL';
            v_tablename := 'CMS_CREDIT_APPROVAL';
            v_columnname := 'SENIOR';
            v_datas := rc_cms_credit_approval.senior;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_credit_approval.risk) > 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'RISK is null';
            v_stage_tablename := 'CMS_STAGE_CREDIT_APPROVAL';
            v_tablename := 'CMS_CREDIT_APPROVAL';
            v_columnname := 'RISK';
            v_datas := rc_cms_credit_approval.risk;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

                  /*
                  SELECT * FROM COMMON_CODE_CATEGORY_ENTRY
         WHERE CATEGORY_CODE LIKE 'HDFC_SEGMENT' AND ENTRY_CODE='CASH_MANAGEMENT';
         */
                  -- need to map as per client details
         IF rc_cms_credit_approval.segmentid = 'CASH_MANAGEMENT'
         THEN
            v_segment := 'CASH_MANAGEMENT';
         ELSIF rc_cms_credit_approval.segmentid = 'CORPORATE'
         THEN
            v_segment := 'CORPORATE';
         ELSIF rc_cms_credit_approval.segmentid = 'RETAIL'
         THEN
            v_segment := 'RETAIL';
         ELSIF rc_cms_credit_approval.segmentid = 'TREASURY'
         THEN
            v_segment := 'TREASURY';
         ELSE
            v_segment := ' ';
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM common_code_category_entry
          WHERE category_code LIKE 'HDFC_SEGMENT'
            AND UPPER (entry_code) = UPPER (v_segment);

         IF v_count < 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage :=
               'SEGMENTID is not in Master List(table "COMMON_CODE_CATEGORY_ENTRY").';
            v_stage_tablename := 'CMS_STAGE_CREDIT_APPROVAL';
            v_tablename := 'CMS_CREDIT_APPROVAL';
            v_columnname := 'SEGMENT';
            v_datas := rc_cms_credit_approval.segmentid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         ELSIF v_count > 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage :=
               'Duplicate SEGMENTID are  in Master List(table "COMMON_CODE_CATEGORY_ENTRY").';
            v_stage_tablename := 'CMS_STAGE_CREDIT_APPROVAL';
            v_tablename := 'CMS_CREDIT_APPROVAL';
            v_columnname := 'SEGMENT';
            v_datas := rc_cms_credit_approval.segmentid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF v_recordstatus = v_ismigrated
         THEN
            SELECT cms_stage_credit_approval_seq.NEXTVAL
              INTO v_cms_stage_credit_approvalid
              FROM DUAL;

            INSERT INTO cms_stage_credit_approval
                        (ID,
                         approval_code,
                         approval_name,
                         maximum_limit,
                         minimum_limit, SEGMENT,
                         email,
                         senior,
                         risk, version_time, create_by,
                         creation_date, last_update_by, last_update_date,
                         deprecated, status
                        )
                 VALUES (v_cms_stage_credit_approvalid,
                         rc_cms_credit_approval.approverid,
                         rc_cms_credit_approval.approvername,
                         rc_cms_credit_approval.maxagrlimit,
                         rc_cms_credit_approval.discpower, v_segment,
                         rc_cms_credit_approval.ccmailid,
                         rc_cms_credit_approval.senior,
                         rc_cms_credit_approval.risk, v_version, v_createby,
                         v_app_timestamp, v_lastupdateby, v_app_timestamp,
                         v_deprecated, v_status
                        );

            SELECT credit_approval_seq.NEXTVAL
              INTO v_cms_credit_approvalid
              FROM DUAL;

            INSERT INTO cms_credit_approval
                        (ID,
                         approval_code,
                         approval_name,
                         maximum_limit,
                         minimum_limit, SEGMENT,
                         email,
                         senior,
                         risk, version_time, create_by,
                         creation_date, last_update_by, last_update_date,
                         deprecated, status
                        )
                 VALUES (v_cms_credit_approvalid,
                         rc_cms_credit_approval.approverid,
                         rc_cms_credit_approval.approvername,
                         rc_cms_credit_approval.maxagrlimit,
                         rc_cms_credit_approval.discpower, v_segment,
                         rc_cms_credit_approval.ccmailid,
                         rc_cms_credit_approval.senior,
                         rc_cms_credit_approval.risk, v_version, v_createby,
                         v_app_timestamp, v_lastupdateby, v_app_timestamp,
                         v_deprecated, v_status
                        );

            SELECT    TO_CHAR (SYSDATE, 'YYYYMMDD')
                   || '00000'
                   || (MAX (TO_NUMBER (SUBSTR (transaction_id, 14))) + 1)
              INTO v_transaction_id
              FROM TRANSACTION;

            INSERT INTO TRANSACTION
                        (transaction_id, from_state, user_id,
                         login_id, transaction_type, creation_date,
                         transaction_date, reference_id, status,
                         staging_reference_id, team_id,
                         VERSION, opsdesc,
                         user_info,
                         cur_trx_history_id, team_type_id,
                         team_membership_id
                        )
                 VALUES (v_transaction_id, vtrans_from_state, v_user_id,
                         v_login_id, v_transaction_type, v_app_date,
                         v_app_date, v_cms_credit_approvalid, vtrans_status,
                         v_cms_stage_credit_approvalid, v_team_id,
                         vtrans_version, v_transopsdesc,
                         v_user_name || ' ( ' || v_login_id || ' )',
                         v_transaction_id, v_team_type_id,
                         v_team_membership_id
                        );

            -- Updating ID and Flag in migration database.
            UPDATE mig_credit_approval
               SET ismigrated = v_recordstatus,
                   stage_idmig = v_cms_stage_credit_approvalid,
                   idmig = v_cms_credit_approvalid,
                   trans_idmig = v_transaction_id
             WHERE CURRENT OF cr_cms_credit_approval;

            v_migratedrecords := v_migratedrecords + 1;
         ELSE
            -- Found error for record
            v_statusflag := 'ERROR';

            -- Updating Flag in migration database.
            UPDATE mig_credit_approval
               SET ismigrated = v_recordstatus
             WHERE CURRENT OF cr_cms_credit_approval;
         END IF;
      END LOOP;

      CLOSE cr_cms_credit_approval;

      -- Logging  Migration Details
      INSERT INTO logmst
                  (ID, dmid, sequenceno,
                   stage_tablename, tablename,
                   totalrecords, migratedrecords, starttime, endtime,
                   status
                  )
           VALUES (v_logmstid, v_logmstid, v_dmseqno,
                   'CMS_STAGE_CREDIT_APPROVAL', 'CMS_CREDIT_APPROVAL',
                   v_totalrecords, v_migratedrecords, v_starttime, SYSDATE,
                   v_statusflag
                  );
   END sp_dm_credit_approval;

   PROCEDURE sp_dm_relationship_mgr (v_ismigrated IN CHAR)
   IS
      CURSOR cr_cms_relationship_mgr
      IS
         SELECT        *
                  FROM mig_cms_relationship_mgr
                 WHERE ismigrated = 'N'
         FOR UPDATE OF ismigrated;

      rc_cms_relationship_mgr          cr_cms_relationship_mgr%ROWTYPE;
      v_cms_stage_relationship_mgrid   NUMBER (19);
      v_cms_relationship_mgrid         NUMBER (19);
      v_regionid                       NUMBER (19);
   BEGIN
      v_totalrecords := 0;
      v_migratedrecords := 0;
      v_transaction_type := 'RELATIONSHIP_MGR';
      vtrans_from_state := 'PENDING_CREATE';

      -- Getting Sequence ID for LogMst ID.
      SELECT logmst_sq.NEXTVAL
        INTO v_logmstid
        FROM DUAL;

      -- Setting data migration sequence no.
      v_dmseqno := v_dmseqno + 1;
      -- Setting StatusFlag as Successfull by default
      v_statusflag := 'SUCCESSFULL';

      -- Setting start time for migration.
      SELECT SYSDATE
        INTO v_starttime
        FROM DUAL;

      SELECT operation
        INTO v_transopsdesc
        FROM (SELECT operation, ROWNUM AS rownum1
                FROM tr_state_matrix
               WHERE stateins = v_transaction_type
                 AND fromstate = vtrans_from_state
                 AND tostate = 'ACTIVE'
                 AND userstate = 'ACTIVE'
                 AND enableind = 1
                 AND frontendop = 1)
       WHERE rownum1 = 1;

      OPEN cr_cms_relationship_mgr;

      LOOP
         FETCH cr_cms_relationship_mgr
          INTO rc_cms_relationship_mgr;

         EXIT WHEN cr_cms_relationship_mgr%NOTFOUND;
         v_totalrecords := v_totalrecords + 1;
         v_recordstatus := v_ismigrated;
         v_errormessage := NULL;

         IF    rc_cms_relationship_mgr.rmid IS NULL
            OR TRIM (rc_cms_relationship_mgr.rmid) IS NULL
            OR TRIM (rc_cms_relationship_mgr.rmid) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'RMID is null';
            v_stage_tablename := 'CMS_STAGE_RELATIONSHIP_MGR';
            v_tablename := 'CMS_RELATIONSHIP_MGR';
            v_columnname := 'RM_MGR_CODE';
            v_datas := rc_cms_relationship_mgr.rmid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_relationship_mgr.rmid) > 20
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'RMID  Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_RELATIONSHIP_MGR';
            v_tablename := 'CMS_RELATIONSHIP_MGR';
            v_columnname := 'RM_MGR_CODE';
            v_datas := rc_cms_relationship_mgr.rmid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_relationship_mgr.rmname IS NULL
            OR TRIM (rc_cms_relationship_mgr.rmname) IS NULL
            OR TRIM (rc_cms_relationship_mgr.rmname) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'RMNAME is null';
            v_stage_tablename := 'CMS_STAGE_RELATIONSHIP_MGR';
            v_tablename := 'CMS_RELATIONSHIP_MGR';
            v_columnname := 'RM_MGR_NAME';
            v_datas := rc_cms_relationship_mgr.rmname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_relationship_mgr.rmname) > 100
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'RMNAME  Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_RELATIONSHIP_MGR';
            v_tablename := 'CMS_RELATIONSHIP_MGR';
            v_columnname := 'RM_MGR_NAME';
            v_datas := rc_cms_relationship_mgr.rmname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_relationship_mgr.ccmailid IS NULL
            OR TRIM (rc_cms_relationship_mgr.ccmailid) IS NULL
            OR TRIM (rc_cms_relationship_mgr.ccmailid) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'CCMAILID is null';
            v_stage_tablename := 'CMS_STAGE_RELATIONSHIP_MGR';
            v_tablename := 'CMS_RELATIONSHIP_MGR';
            v_columnname := 'RM_MGR_MAIL';
            v_datas := rc_cms_relationship_mgr.ccmailid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_relationship_mgr.ccmailid) > 50
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'CCMAILID  Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_RELATIONSHIP_MGR';
            v_tablename := 'CMS_RELATIONSHIP_MGR';
            v_columnname := 'RM_MGR_MAIL';
            v_datas := rc_cms_relationship_mgr.ccmailid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_relationship_mgr.unithead) > 25
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'UNITHEAD Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_RELATIONSHIP_MGR';
            v_tablename := 'CMS_RELATIONSHIP_MGR';
            v_columnname := 'REPORTING_HEAD';
            v_datas := rc_cms_relationship_mgr.unithead;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM cms_region
          WHERE UPPER (region_name) = UPPER (rc_cms_relationship_mgr.region);

         IF v_count = 1
         THEN
            SELECT ID
              INTO v_regionid
              FROM cms_region
             WHERE UPPER (region_name) =
                                        UPPER (rc_cms_relationship_mgr.region);
         ELSIF v_count > 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'REGION duplicated in the city master';
            v_stage_tablename := 'CMS_STAGE_RELATIONSHIP_MGR';
            v_tablename := 'CMS_RELATIONSHIP_MGR';
            v_columnname := 'REGION';
            v_datas := rc_cms_relationship_mgr.region;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         ELSIF v_count < 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Invalid REGION';
            v_stage_tablename := 'CMS_STAGE_RELATIONSHIP_MGR';
            v_tablename := 'CMS_RELATIONSHIP_MGR';
            v_columnname := 'REGION';
            v_datas := rc_cms_relationship_mgr.region;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF v_recordstatus = v_ismigrated
         THEN
            SELECT cms_stage_relationship_mgr_seq.NEXTVAL
              INTO v_cms_stage_relationship_mgrid
              FROM DUAL;

            INSERT INTO cms_stage_relationship_mgr
                        (ID,
                         rm_mgr_code,
                         rm_mgr_name,
                         rm_mgr_mail,
                         reporting_head, region,
                         version_time, create_by, creation_date,
                         last_update_by, last_update_date, deprecated,
                         status
                        )
                 VALUES (v_cms_stage_relationship_mgrid,
                         rc_cms_relationship_mgr.rmid,
                         rc_cms_relationship_mgr.rmname,
                         rc_cms_relationship_mgr.ccmailid,
                         rc_cms_relationship_mgr.unithead, v_regionid,
                         v_version, v_createby, v_app_timestamp,
                         v_lastupdateby, v_app_timestamp, v_deprecated,
                         v_status
                        );

            SELECT relationship_mgr_seq.NEXTVAL
              INTO v_cms_relationship_mgrid
              FROM DUAL;

            INSERT INTO cms_relationship_mgr
                        (ID,
                         rm_mgr_code,
                         rm_mgr_name,
                         rm_mgr_mail,
                         reporting_head, region,
                         version_time, create_by, creation_date,
                         last_update_by, last_update_date, deprecated,
                         status
                        )
                 VALUES (v_cms_relationship_mgrid,
                         rc_cms_relationship_mgr.rmid,
                         rc_cms_relationship_mgr.rmname,
                         rc_cms_relationship_mgr.ccmailid,
                         rc_cms_relationship_mgr.unithead, v_regionid,
                         v_version, v_createby, v_app_timestamp,
                         v_lastupdateby, v_app_timestamp, v_deprecated,
                         v_status
                        );

            SELECT    TO_CHAR (SYSDATE, 'YYYYMMDD')
                   || '00000'
                   || (MAX (TO_NUMBER (SUBSTR (transaction_id, 14))) + 1)
              INTO v_transaction_id
              FROM TRANSACTION;

            INSERT INTO TRANSACTION
                        (transaction_id, from_state, user_id,
                         login_id, transaction_type, creation_date,
                         transaction_date, reference_id, status,
                         staging_reference_id, team_id,
                         VERSION, opsdesc,
                         user_info,
                         cur_trx_history_id, team_type_id,
                         team_membership_id
                        )
                 VALUES (v_transaction_id, vtrans_from_state, v_user_id,
                         v_login_id, v_transaction_type, v_app_date,
                         v_app_date, v_cms_relationship_mgrid, vtrans_status,
                         v_cms_stage_relationship_mgrid, v_team_id,
                         vtrans_version, v_transopsdesc,
                         v_user_name || ' ( ' || v_login_id || ' )',
                         v_transaction_id, v_team_type_id,
                         v_team_membership_id
                        );

            -- Updating ID and Flag in migration database.
            UPDATE mig_cms_relationship_mgr
               SET ismigrated = v_recordstatus,
                   stage_idmig = v_cms_stage_relationship_mgrid,
                   idmig = v_cms_relationship_mgrid,
                   trans_idmig = v_transaction_id
             WHERE CURRENT OF cr_cms_relationship_mgr;

            v_migratedrecords := v_migratedrecords + 1;
         ELSE
            -- Found error for record
            v_statusflag := 'ERROR';

            -- Updating Flag in migration database.
            UPDATE mig_cms_relationship_mgr
               SET ismigrated = v_recordstatus
             WHERE CURRENT OF cr_cms_relationship_mgr;
         END IF;
      END LOOP;

      CLOSE cr_cms_relationship_mgr;

      -- Logging  Migration Details
      INSERT INTO logmst
                  (ID, dmid, sequenceno,
                   stage_tablename, tablename,
                   totalrecords, migratedrecords, starttime, endtime,
                   status
                  )
           VALUES (v_logmstid, v_logmstid, v_dmseqno,
                   'CMS_STAGE_RELATIONSHIP_MGR', 'CMS_RELATIONSHIP_MGR',
                   v_totalrecords, v_migratedrecords, v_starttime, SYSDATE,
                   v_statusflag
                  );
   END sp_dm_relationship_mgr;

   PROCEDURE sp_dm_rbi_category (v_ismigrated IN CHAR)
   IS
      CURSOR cr_cms_rbi_category
      IS
         SELECT        *
                  FROM mig_cms_rbi_category
                 WHERE ismigrated = 'N'
         FOR UPDATE OF ismigrated;

      rc_cms_rbi_category          cr_cms_rbi_category%ROWTYPE;
      v_cms_stage_rbi_categoryid   NUMBER (19);
      v_cms_rbi_categoryid         NUMBER (19);
   BEGIN
      v_totalrecords := 0;
      v_migratedrecords := 0;
      v_transaction_type := 'RBI_CATEGORY';
      vtrans_from_state := 'PENDING_CREATE';

      -- Getting Sequence ID for LogMst ID.
      SELECT logmst_sq.NEXTVAL
        INTO v_logmstid
        FROM DUAL;

      -- Setting data migration sequence no.
      v_dmseqno := v_dmseqno + 1;
      -- Setting StatusFlag as Successfull by default
      v_statusflag := 'SUCCESSFULL';

      -- Setting start time for migration.
      SELECT SYSDATE
        INTO v_starttime
        FROM DUAL;

      SELECT operation
        INTO v_transopsdesc
        FROM (SELECT operation, ROWNUM AS rownum1
                FROM tr_state_matrix
               WHERE stateins = v_transaction_type
                 AND fromstate = vtrans_from_state
                 AND tostate = 'ACTIVE'
                 AND userstate = 'ACTIVE'
                 AND enableind = 1
                 AND frontendop = 1)
       WHERE rownum1 = 1;

      OPEN cr_cms_rbi_category;

      LOOP
         FETCH cr_cms_rbi_category
          INTO rc_cms_rbi_category;

         EXIT WHEN cr_cms_rbi_category%NOTFOUND;
         v_totalrecords := v_totalrecords + 1;
         v_recordstatus := v_ismigrated;
         v_errormessage := NULL;

         IF    rc_cms_rbi_category.rbiindid IS NULL
            OR TRIM (rc_cms_rbi_category.rbiindid) IS NULL
            OR TRIM (rc_cms_rbi_category.rbiindid) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'RBIINDID is null';
            v_stage_tablename := 'CMS_STAGE_RBI_CATEGORY';
            v_tablename := 'CMS_RBI_CATEGORY';
            v_columnname := 'RBI_CATEGORY_ID';
            v_datas := rc_cms_rbi_category.rbiindid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_rbi_category.indtypeid IS NULL
            OR TRIM (rc_cms_rbi_category.indtypeid) IS NULL
            OR TRIM (rc_cms_rbi_category.indtypeid) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'INDTYPEID is null';
            v_stage_tablename := 'CMS_STAGE_RBI_CATEGORY';
            v_tablename := 'CMS_RBI_CATEGORY';
            v_columnname := 'INDUSTRY_NAME_ID';
            v_datas := rc_cms_rbi_category.indtypeid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         --only
/*
         SELECT COUNT (1)
           INTO v_count
           FROM common_code_category_entry
          WHERE category_code = 'HDFC_RBI_CODE'
            AND UPPER (entry_code) = UPPER (rc_cms_rbi_category.rbiindid);

         IF v_count > 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'RBIINDID duplicated in the city master';
            v_stage_tablename := 'CMS_STAGE_RBI_CATEGORY';
            v_tablename := 'CMS_RBI_CATEGORY';
            v_columnname := 'RBI_CATEGORY_ID';
            v_datas := rc_cms_rbi_category.rbiindid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         ELSIF v_count < 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Invalid RBIINDID';
            v_stage_tablename := 'CMS_STAGE_RBI_CATEGORY';
            v_tablename := 'CMS_RBI_CATEGORY';
            v_columnname := 'RBI_CATEGORY_ID';
            v_datas := rc_cms_rbi_category.rbiindid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM common_code_category_entry
          WHERE category_code = 'HDFC_INDUSTRY'
            AND UPPER (entry_code) = UPPER (rc_cms_rbi_category.indtypeid);

         IF v_count > 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'INDTYPEID duplicated in the city master';
            v_stage_tablename := 'CMS_STAGE_RBI_CATEGORY';
            v_tablename := 'CMS_RBI_CATEGORY';
            v_columnname := 'INDUSTRY_NAME_ID';
            v_datas := rc_cms_rbi_category.indtypeid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         ELSIF v_count < 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Invalid INDTYPEID';
            v_stage_tablename := 'CMS_STAGE_RBI_CATEGORY';
            v_tablename := 'CMS_RBI_CATEGORY';
            v_columnname := 'INDUSTRY_NAME_ID';
            v_datas := rc_cms_rbi_category.indtypeid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;
*/
--only
         IF v_recordstatus = v_ismigrated
         THEN
            INSERT INTO cms_stage_rbi_category
                        (stage_rbi_category_id,
                         industry_name_id, version_time,
                         create_by, creation_date, last_update_by,
                         last_update_date, deprecated, status
                        )
                 VALUES (rc_cms_rbi_category.rbiindid,
                         rc_cms_rbi_category.indtypeid, v_version,
                         v_createby, v_app_timestamp, v_lastupdateby,
                         v_app_timestamp, v_deprecated, v_status
                        );

            INSERT INTO cms_rbi_category
                        (rbi_category_id,
                         industry_name_id, version_time,
                         create_by, creation_date, last_update_by,
                         last_update_date, deprecated, status
                        )
                 VALUES (rc_cms_rbi_category.rbiindid,
                         rc_cms_rbi_category.indtypeid, v_version,
                         v_createby, v_app_timestamp, v_lastupdateby,
                         v_app_timestamp, v_deprecated, v_status
                        );

            SELECT    TO_CHAR (SYSDATE, 'YYYYMMDD')
                   || '00000'
                   || (MAX (TO_NUMBER (SUBSTR (transaction_id, 14))) + 1)
              INTO v_transaction_id
              FROM TRANSACTION;

            INSERT INTO TRANSACTION
                        (transaction_id, from_state, user_id,
                         login_id, transaction_type, creation_date,
                         transaction_date, reference_id,
                         status, staging_reference_id,
                         team_id, VERSION, opsdesc,
                         user_info,
                         cur_trx_history_id, team_type_id,
                         team_membership_id
                        )
                 VALUES (v_transaction_id, vtrans_from_state, v_user_id,
                         v_login_id, v_transaction_type, v_app_date,
                         v_app_date, rc_cms_rbi_category.rbiindid,
                         vtrans_status, rc_cms_rbi_category.rbiindid,
                         v_team_id, vtrans_version, v_transopsdesc,
                         v_user_name || ' ( ' || v_login_id || ' )',
                         v_transaction_id, v_team_type_id,
                         v_team_membership_id
                        );

            -- Updating ID and Flag in migration database.
            UPDATE mig_cms_rbi_category
               SET ismigrated = v_recordstatus,
                   stage_idmig = v_cms_stage_rbi_categoryid,
                   idmig = v_cms_rbi_categoryid,
                   trans_idmig = v_transaction_id
             WHERE CURRENT OF cr_cms_rbi_category;

            v_migratedrecords := v_migratedrecords + 1;
         ELSE
            -- Found error for record
            v_statusflag := 'ERROR';

            -- Updating Flag in migration database.
            UPDATE mig_cms_rbi_category
               SET ismigrated = v_recordstatus
             WHERE CURRENT OF cr_cms_rbi_category;
         END IF;
      END LOOP;

      CLOSE cr_cms_rbi_category;

      -- Logging  Migration Details
      INSERT INTO logmst
                  (ID, dmid, sequenceno,
                   stage_tablename, tablename,
                   totalrecords, migratedrecords, starttime, endtime,
                   status
                  )
           VALUES (v_logmstid, v_logmstid, v_dmseqno,
                   'CMS_STAGE_RBI_CATEGORY', 'CMS_RBI_CATEGORY',
                   v_totalrecords, v_migratedrecords, v_starttime, SYSDATE,
                   v_statusflag
                  );
   END sp_dm_rbi_category;

   PROCEDURE sp_dm_facility (v_ismigrated IN CHAR)
   IS
      CURSOR cr_cms_facility
      IS
         SELECT        *
                  FROM mig_cms_facility_master
                 WHERE ismigrated = 'N'
         FOR UPDATE OF ismigrated;

      rc_cms_facility          cr_cms_facility%ROWTYPE;
      v_cms_stage_facilityid   NUMBER (19);
      v_cms_facilityid         NUMBER (19);
      v_new_facility_type      VARCHAR2 (60);
      v_purpose                VARCHAR2 (60);
   BEGIN
      v_totalrecords := 0;
      v_migratedrecords := 0;
      v_transaction_type := 'FACILITY_NEW_MASTER';
      vtrans_from_state := 'PENDING_CREATE';

      -- Getting Sequence ID for LogMst ID.
      SELECT logmst_sq.NEXTVAL
        INTO v_logmstid
        FROM DUAL;

      -- Setting data migration sequence no.
      v_dmseqno := v_dmseqno + 1;
      -- Setting StatusFlag as Successfull by default
      v_statusflag := 'SUCCESSFULL';

      -- Setting start time for migration.
      SELECT SYSDATE
        INTO v_starttime
        FROM DUAL;

      SELECT operation
        INTO v_transopsdesc
        FROM (SELECT operation, ROWNUM AS rownum1
                FROM tr_state_matrix
               WHERE stateins = v_transaction_type
                 AND fromstate = vtrans_from_state
                 AND tostate = 'ACTIVE'
                 AND userstate = 'ACTIVE'
                 AND enableind = 1
                 AND frontendop = 1)
       WHERE rownum1 = 1;

      OPEN cr_cms_facility;

      LOOP
         FETCH cr_cms_facility
          INTO rc_cms_facility;

         EXIT WHEN cr_cms_facility%NOTFOUND;
         v_totalrecords := v_totalrecords + 1;
         v_recordstatus := v_ismigrated;
         v_errormessage := NULL;

         IF    rc_cms_facility.facilityid IS NULL
            OR TRIM (rc_cms_facility.facilityid) IS NULL
            OR TRIM (rc_cms_facility.facilityid) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'FACILITYID is null';
            v_stage_tablename := 'CMS_STAGE_FACILITY_NEW_MASTER';
            v_tablename := 'CMS_FACILITY_NEW_MASTER';
            v_columnname := 'NEW_FACILITY_CODE';
            v_datas := rc_cms_facility.facilityid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_facility.facilityid) > 10
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'FACILITYID Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_FACILITY_NEW_MASTER';
            v_tablename := 'CMS_FACILITY_NEW_MASTER';
            v_columnname := 'NEW_FACILITY_CODE';
            v_datas := rc_cms_facility.facilityid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_facility.facilityname IS NULL
            OR TRIM (rc_cms_facility.facilityname) IS NULL
            OR TRIM (rc_cms_facility.facilityname) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'FACILITYNAME is null';
            v_stage_tablename := 'CMS_STAGE_FACILITY_NEW_MASTER';
            v_tablename := 'CMS_FACILITY_NEW_MASTER';
            v_columnname := 'NEW_FACILITY_NAME';
            v_datas := rc_cms_facility.facilityname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_facility.facilityname) > 100
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'FACILITYNAME Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_FACILITY_NEW_MASTER';
            v_tablename := 'CMS_FACILITY_NEW_MASTER';
            v_columnname := 'NEW_FACILITY_NAME';
            v_datas := rc_cms_facility.facilityname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_facility.facilitytype IS NULL
            OR TRIM (rc_cms_facility.facilitytype) IS NULL
            OR TRIM (rc_cms_facility.facilitytype) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'FACILITYTYPE is null';
            v_stage_tablename := 'CMS_STAGE_FACILITY_NEW_MASTER';
            v_tablename := 'CMS_FACILITY_NEW_MASTER';
            v_columnname := 'NEW_FACILITY_TYPE';
            v_datas := rc_cms_facility.facilitytype;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_facility.facilitycategory IS NULL
            OR TRIM (rc_cms_facility.facilitycategory) IS NULL
            OR TRIM (rc_cms_facility.facilitycategory) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'FACILITYCATEGORY is null';
            v_stage_tablename := 'CMS_STAGE_FACILITY_NEW_MASTER';
            v_tablename := 'CMS_FACILITY_NEW_MASTER';
            v_columnname := 'NEW_FACILITY_CATEGORY';
            v_datas := rc_cms_facility.facilitycategory;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_facility.systemid IS NULL
            OR TRIM (rc_cms_facility.systemid) IS NULL
            OR TRIM (rc_cms_facility.systemid) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'SYSTEMID is null';
            v_stage_tablename := 'CMS_STAGE_FACILITY_NEW_MASTER';
            v_tablename := 'CMS_FACILITY_NEW_MASTER';
            v_columnname := 'NEW_FACILITY_SYSTEM';
            v_datas := rc_cms_facility.systemid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_facility.creditlineno IS NULL
            OR TRIM (rc_cms_facility.creditlineno) IS NULL
            OR TRIM (rc_cms_facility.creditlineno) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'CREDITLINENO is null';
            v_stage_tablename := 'CMS_STAGE_FACILITY_NEW_MASTER';
            v_tablename := 'CMS_FACILITY_NEW_MASTER';
            v_columnname := 'LINE_NUMBER';
            v_datas := rc_cms_facility.creditlineno;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_facility.creditlineno) > 50
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'CREDITLINENO  Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_FACILITY_NEW_MASTER';
            v_tablename := 'CMS_FACILITY_NEW_MASTER';
            v_columnname := 'LINE_NUMBER';
            v_datas := rc_cms_facility.creditlineno;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_facility.weightage) > 5
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'WEIGHTAGE  Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_FACILITY_NEW_MASTER';
            v_tablename := 'CMS_FACILITY_NEW_MASTER';
            v_columnname := 'WEIGHTAGE';
            v_datas := rc_cms_facility.weightage;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM common_code_category_entry
          WHERE category_code = 'FACILITY_CATEGORY'
            AND UPPER (entry_code) = UPPER (rc_cms_facility.facilitycategory);

         IF v_count > 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage :=
                             'FACILITYCATEGORY duplicated in the city master';
            v_stage_tablename := 'CMS_STAGE_FACILITY_NEW_MASTER';
            v_tablename := 'CMS_FACILITY_NEW_MASTER';
            v_columnname := 'NEW_FACILITY_CATEGORY';
            v_datas := rc_cms_facility.facilitycategory;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         ELSIF v_count < 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Invalid FACILITYCATEGORY';
            v_stage_tablename := 'CMS_STAGE_FACILITY_NEW_MASTER';
            v_tablename := 'CMS_FACILITY_NEW_MASTER';
            v_columnname := 'NEW_FACILITY_CATEGORY';
            v_datas := rc_cms_facility.facilitycategory;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM common_code_category_entry
          WHERE category_code = 'SYSTEM'
            AND UPPER (entry_code) = UPPER (rc_cms_facility.systemid);

         IF v_count > 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'SYSTEMID duplicated in the city master';
            v_stage_tablename := 'CMS_STAGE_FACILITY_NEW_MASTER';
            v_tablename := 'CMS_FACILITY_NEW_MASTER';
            v_columnname := 'NEW_FACILITY_SYSTEM';
            v_datas := rc_cms_facility.systemid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         ELSIF v_count < 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Invalid SYSTEMID';
            v_stage_tablename := 'CMS_STAGE_FACILITY_NEW_MASTER';
            v_tablename := 'CMS_FACILITY_NEW_MASTER';
            v_columnname := 'NEW_FACILITY_SYSTEM';
            v_datas := rc_cms_facility.systemid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF UPPER (rc_cms_facility.facilitytype) = 'F'
         THEN
            v_new_facility_type := 'FUNDED';
         ELSIF UPPER (rc_cms_facility.facilitytype) = 'N'
         THEN
            v_new_facility_type := 'NON_FUNDED';
         ELSIF UPPER (rc_cms_facility.facilitytype) = 'M'
         THEN
            v_new_facility_type := 'MEMO_EXPOSURE';
         ELSE
            v_new_facility_type := ' ';
         END IF;

         --need to check as per client stagging file provided
         IF UPPER (rc_cms_facility.givenfor) = 'B'
         THEN
            v_purpose := 'BLANK';
         ELSIF UPPER (rc_cms_facility.givenfor) = 'O'
         THEN
            v_purpose := 'OTHERS';
         ELSIF UPPER (rc_cms_facility.givenfor) = 'W'
         THEN
            v_purpose := 'WORKING_CAPITAL';
         ELSE
            v_purpose := ' ';
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM common_code_category_entry
          WHERE category_code LIKE 'FACILITY_TYPE'
            AND UPPER (entry_code) = UPPER (v_new_facility_type);

         IF v_count > 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage :=
               'Duplicate FACILITYTYPE are  in Master List(table "COMMON_CODE_CATEGORY_ENTRY").';
            v_stage_tablename := 'CMS_STAGE_FACILITY_NEW_MASTER';
            v_tablename := 'CMS_FACILITY_NEW_MASTER';
            v_columnname := 'NEW_FACILITY_TYPE';
            v_datas := rc_cms_facility.facilitytype;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         ELSIF v_count < 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage :=
               'FACILITYTYPE is not in Master List(table "COMMON_CODE_CATEGORY_ENTRY").';
            v_stage_tablename := 'CMS_STAGE_FACILITY_NEW_MASTER';
            v_tablename := 'CMS_FACILITY_NEW_MASTER';
            v_columnname := 'NEW_FACILITY_TYPE';
            v_datas := rc_cms_facility.facilitytype;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM common_code_category_entry
          WHERE category_code LIKE 'PURPOSE'
            AND UPPER (entry_code) = UPPER (v_purpose);

         IF v_count > 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage :=
               'Duplicate GIVENFOR are  in Master List(table "COMMON_CODE_CATEGORY_ENTRY").';
            v_stage_tablename := 'CMS_STAGE_FACILITY_NEW_MASTER';
            v_tablename := 'CMS_FACILITY_NEW_MASTER';
            v_columnname := 'PURPOSE';
            v_datas := rc_cms_facility.givenfor;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         ELSIF v_count < 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage :=
               'GIVENFOR is not in Master List(table "COMMON_CODE_CATEGORY_ENTRY").';
            v_stage_tablename := 'CMS_STAGE_FACILITY_NEW_MASTER';
            v_tablename := 'CMS_FACILITY_NEW_MASTER';
            v_columnname := 'PURPOSE';
            v_datas := rc_cms_facility.givenfor;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM cms_facility_new_master
          WHERE UPPER (new_facility_name) =
                                          UPPER (rc_cms_facility.facilityname);

         IF v_count > 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'FACILITYNAME Duplicate in Facility Master';
            v_stage_tablename := 'CMS_STAGE_FACILITY_NEW_MASTER';
            v_tablename := 'CMS_FACILITY_NEW_MASTER';
            v_columnname := 'NEW_FACILITY_NAME';
            v_datas := rc_cms_facility.facilityname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF v_recordstatus = v_ismigrated
         THEN
            SELECT stage_facility_new_master_seq.NEXTVAL
              INTO v_cms_stage_facilityid
              FROM DUAL;

            INSERT INTO cms_stage_facility_new_master
                        (ID, version_time, create_by,
                         creation_date, last_update_by, last_update_date,
                         deprecated, status, new_facility_code,
                         new_facility_name, new_facility_type,
                         new_facility_category,
                         new_facility_system,
                         line_number, purpose,
                         weightage
                        )
                 VALUES (v_cms_stage_facilityid, v_version, v_createby,
                         v_app_timestamp, v_lastupdateby, v_app_timestamp,
                         v_deprecated, v_status, rc_cms_facility.facilityid,
                         rc_cms_facility.facilityname, v_new_facility_type,
                         rc_cms_facility.facilitycategory,
                         rc_cms_facility.systemid,
                         rc_cms_facility.creditlineno, v_purpose,
                         rc_cms_facility.weightage
                        );

            SELECT cms_facility_new_master_seq.NEXTVAL
              INTO v_cms_facilityid
              FROM DUAL;

            INSERT INTO cms_facility_new_master
                        (ID, version_time, create_by,
                         creation_date, last_update_by, last_update_date,
                         deprecated, status, new_facility_code,
                         new_facility_name, new_facility_type,
                         new_facility_category,
                         new_facility_system,
                         line_number, purpose,
                         weightage
                        )
                 VALUES (v_cms_facilityid, v_version, v_createby,
                         v_app_timestamp, v_lastupdateby, v_app_timestamp,
                         v_deprecated, v_status, rc_cms_facility.facilityid,
                         rc_cms_facility.facilityname, v_new_facility_type,
                         rc_cms_facility.facilitycategory,
                         rc_cms_facility.systemid,
                         rc_cms_facility.creditlineno, v_purpose,
                         rc_cms_facility.weightage
                        );

            SELECT    TO_CHAR (SYSDATE, 'YYYYMMDD')
                   || '00000'
                   || (MAX (TO_NUMBER (SUBSTR (transaction_id, 14))) + 1)
              INTO v_transaction_id
              FROM TRANSACTION;

            INSERT INTO TRANSACTION
                        (transaction_id, from_state, user_id,
                         login_id, transaction_type, creation_date,
                         transaction_date, reference_id, status,
                         staging_reference_id, team_id, VERSION,
                         opsdesc,
                         user_info,
                         cur_trx_history_id, team_type_id,
                         team_membership_id
                        )
                 VALUES (v_transaction_id, vtrans_from_state, v_user_id,
                         v_login_id, v_transaction_type, v_app_date,
                         v_app_date, v_cms_facilityid, vtrans_status,
                         v_cms_stage_facilityid, v_team_id, vtrans_version,
                         v_transopsdesc,
                         v_user_name || ' ( ' || v_login_id || ' )',
                         v_transaction_id, v_team_type_id,
                         v_team_membership_id
                        );

            -- Updating ID and Flag in migration database.
            UPDATE mig_cms_facility_master
               SET ismigrated = v_recordstatus,
                   stage_idmig = v_cms_stage_facilityid,
                   idmig = v_cms_facilityid,
                   trans_idmig = v_transaction_id
             WHERE CURRENT OF cr_cms_facility;

            v_migratedrecords := v_migratedrecords + 1;
         ELSE
            -- Found error for record
            v_statusflag := 'ERROR';

            -- Updating Flag in migration database.
            UPDATE mig_cms_facility_master
               SET ismigrated = v_recordstatus
             WHERE CURRENT OF cr_cms_facility;
         END IF;
      END LOOP;

      CLOSE cr_cms_facility;

      -- Logging  Migration Details
      INSERT INTO logmst
                  (ID, dmid, sequenceno,
                   stage_tablename,
                   tablename, totalrecords,
                   migratedrecords, starttime, endtime, status
                  )
           VALUES (v_logmstid, v_logmstid, v_dmseqno,
                   'CMS_STAGE_FACILITY_NEW_MASTER',
                   'CMS_FACILITY_NEW_MASTER', v_totalrecords,
                   v_migratedrecords, v_starttime, SYSDATE, v_statusflag
                  );
   END sp_dm_facility;

   PROCEDURE sp_dm_party_group (v_ismigrated IN CHAR)
   IS
      CURSOR cr_cms_party_group
      IS
         SELECT        *
                  FROM mig_cms_party_group
                 WHERE ismigrated = 'N'
         FOR UPDATE OF ismigrated;

      rc_cms_party_group          cr_cms_party_group%ROWTYPE;
      v_cms_stage_party_groupid   NUMBER (19);
      v_cms_party_groupid         NUMBER (19);
      v_new_party_group_type      VARCHAR2 (60);
      v_purpose                   VARCHAR2 (60);
   BEGIN
      v_totalrecords := 0;
      v_migratedrecords := 0;
      v_transaction_type := 'PARTY_GROUP';
      vtrans_from_state := 'PENDING_CREATE';

      -- Getting Sequence ID for LogMst ID.
      SELECT logmst_sq.NEXTVAL
        INTO v_logmstid
        FROM DUAL;

      -- Setting data migration sequence no.
      v_dmseqno := v_dmseqno + 1;
      -- Setting StatusFlag as Successfull by default
      v_statusflag := 'SUCCESSFULL';

      -- Setting start time for migration.
      SELECT SYSDATE
        INTO v_starttime
        FROM DUAL;

      SELECT operation
        INTO v_transopsdesc
        FROM (SELECT operation, ROWNUM AS rownum1
                FROM tr_state_matrix
               WHERE stateins = v_transaction_type
                 AND fromstate = vtrans_from_state
                 AND tostate = 'ACTIVE'
                 AND userstate = 'ACTIVE'
                 AND enableind = 1
                 AND frontendop = 1)
       WHERE rownum1 = 1;

      OPEN cr_cms_party_group;

      LOOP
         FETCH cr_cms_party_group
          INTO rc_cms_party_group;

         EXIT WHEN cr_cms_party_group%NOTFOUND;
         v_totalrecords := v_totalrecords + 1;
         v_recordstatus := v_ismigrated;
         v_errormessage := NULL;

         IF    rc_cms_party_group.ptygroupid IS NULL
            OR TRIM (rc_cms_party_group.ptygroupid) IS NULL
            OR TRIM (rc_cms_party_group.ptygroupid) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'PTYGROUPID is null';
            v_stage_tablename := 'CMS_STAGE_PARTY_GROUP';
            v_tablename := 'CMS_PARTY_GROUP';
            v_columnname := 'PARTY_GROUP_CODE';
            v_datas := rc_cms_party_group.ptygroupid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_party_group.ptygroupid) > 10
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'PTYGROUPID is null';
            v_stage_tablename := 'CMS_STAGE_PARTY_GROUP';
            v_tablename := 'CMS_PARTY_GROUP';
            v_columnname := 'PARTY_GROUP_CODE';
            v_datas := rc_cms_party_group.ptygroupid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_party_group.ptygroupdesc IS NULL
            OR TRIM (rc_cms_party_group.ptygroupdesc) IS NULL
            OR TRIM (rc_cms_party_group.ptygroupdesc) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'PTYGROUPDESC is null';
            v_stage_tablename := 'CMS_STAGE_PARTY_GROUP';
            v_tablename := 'CMS_PARTY_GROUP';
            v_columnname := 'PARTY_GROUP_NAME';
            v_datas := rc_cms_party_group.ptygroupdesc;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_party_group.ptygroupdesc) > 100
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'PTYGROUPDESC is null';
            v_stage_tablename := 'CMS_STAGE_PARTY_GROUP';
            v_tablename := 'CMS_PARTY_GROUP';
            v_columnname := 'PARTY_GROUP_NAME';
            v_datas := rc_cms_party_group.ptygroupdesc;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF v_recordstatus = v_ismigrated
         THEN
            SELECT cms_stage_party_group_seq.NEXTVAL
              INTO v_cms_stage_party_groupid
              FROM DUAL;

            INSERT INTO cms_stage_party_group
                        (ID, version_time, create_by,
                         creation_date, last_update_by, last_update_date,
                         deprecated, status,
                         party_group_code,
                         party_group_name
                        )
                 VALUES (v_cms_stage_party_groupid, v_version, v_createby,
                         v_app_timestamp, v_lastupdateby, v_app_timestamp,
                         v_deprecated, v_status,
                         rc_cms_party_group.ptygroupid,
                         rc_cms_party_group.ptygroupdesc
                        );

            SELECT party_group_seq.NEXTVAL
              INTO v_cms_party_groupid
              FROM DUAL;

            INSERT INTO cms_party_group
                        (ID, version_time, create_by,
                         creation_date, last_update_by, last_update_date,
                         deprecated, status,
                         party_group_code,
                         party_group_name
                        )
                 VALUES (v_cms_party_groupid, v_version, v_createby,
                         v_app_timestamp, v_lastupdateby, v_app_timestamp,
                         v_deprecated, v_status,
                         rc_cms_party_group.ptygroupid,
                         rc_cms_party_group.ptygroupdesc
                        );

            SELECT    TO_CHAR (SYSDATE, 'YYYYMMDD')
                   || '00000'
                   || (MAX (TO_NUMBER (SUBSTR (transaction_id, 14))) + 1)
              INTO v_transaction_id
              FROM TRANSACTION;

            INSERT INTO TRANSACTION
                        (transaction_id, from_state, user_id,
                         login_id, transaction_type, creation_date,
                         transaction_date, reference_id, status,
                         staging_reference_id, team_id,
                         VERSION, opsdesc,
                         user_info,
                         cur_trx_history_id, team_type_id,
                         team_membership_id
                        )
                 VALUES (v_transaction_id, vtrans_from_state, v_user_id,
                         v_login_id, v_transaction_type, v_app_date,
                         v_app_date, v_cms_party_groupid, vtrans_status,
                         v_cms_stage_party_groupid, v_team_id,
                         vtrans_version, v_transopsdesc,
                         v_user_name || ' ( ' || v_login_id || ' )',
                         v_transaction_id, v_team_type_id,
                         v_team_membership_id
                        );

            -- Updating ID and Flag in migration database.
            UPDATE mig_cms_party_group
               SET ismigrated = v_recordstatus,
                   stage_idmig = v_cms_stage_party_groupid,
                   idmig = v_cms_party_groupid,
                   trans_idmig = v_transaction_id
             WHERE CURRENT OF cr_cms_party_group;

            v_migratedrecords := v_migratedrecords + 1;
         ELSE
            -- Found error for record
            v_statusflag := 'ERROR';

            -- Updating Flag in migration database.
            UPDATE mig_cms_party_group
               SET ismigrated = v_recordstatus
             WHERE CURRENT OF cr_cms_party_group;
         END IF;
      END LOOP;

      CLOSE cr_cms_party_group;

      -- Logging  Migration Details
      INSERT INTO logmst
                  (ID, dmid, sequenceno,
                   stage_tablename, tablename,
                   totalrecords, migratedrecords, starttime, endtime,
                   status
                  )
           VALUES (v_logmstid, v_logmstid, v_dmseqno,
                   'CMS_STAGE_PARTY_GROUP', 'CMS_PARTY_GROUP',
                   v_totalrecords, v_migratedrecords, v_starttime, SYSDATE,
                   v_statusflag
                  );
   END sp_dm_party_group;

   PROCEDURE sp_dm_insurance_coverage (v_ismigrated IN CHAR)
   IS
      CURSOR cr_cms_insurance_coverage
      IS
         SELECT        *
                  FROM mig_cms_insurance_coverage
                 WHERE ismigrated = 'N'
         FOR UPDATE OF ismigrated;

      rc_cms_insurance_coverage      cr_cms_insurance_coverage%ROWTYPE;
      v_stage_insurance_coverageid   NUMBER (19);
      v_cms_insurance_coverageid     NUMBER (19);
   BEGIN
      v_totalrecords := 0;
      v_migratedrecords := 0;
      v_transaction_type := 'INSURANCE_COVERAGE';
      vtrans_from_state := 'PENDING_CREATE';

      -- Getting Sequence ID for LogMst ID.
      SELECT logmst_sq.NEXTVAL
        INTO v_logmstid
        FROM DUAL;

      -- Setting data migration sequence no.
      v_dmseqno := v_dmseqno + 1;
      -- Setting StatusFlag as Successfull by default
      v_statusflag := 'SUCCESSFULL';

      -- Setting start time for migration.
      SELECT SYSDATE
        INTO v_starttime
        FROM DUAL;

      SELECT operation
        INTO v_transopsdesc
        FROM (SELECT operation, ROWNUM AS rownum1
                FROM tr_state_matrix
               WHERE stateins = v_transaction_type
                 AND fromstate = vtrans_from_state
                 AND tostate = 'ACTIVE'
                 AND userstate = 'ACTIVE'
                 AND enableind = 1
                 AND frontendop = 1)
       WHERE rownum1 = 1;

      OPEN cr_cms_insurance_coverage;

      LOOP
         FETCH cr_cms_insurance_coverage
          INTO rc_cms_insurance_coverage;

         EXIT WHEN cr_cms_insurance_coverage%NOTFOUND;
         v_totalrecords := v_totalrecords + 1;
         v_recordstatus := v_ismigrated;
         v_errormessage := NULL;

         IF    rc_cms_insurance_coverage.inscompid IS NULL
            OR TRIM (rc_cms_insurance_coverage.inscompid) IS NULL
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'INSCOMPID is null';
            v_stage_tablename := 'CMS_STAGE_INSURANCE_COVERAGE';
            v_tablename := 'CMS_INSURANCE_COVERAGE';
            v_columnname := 'INSURANCE_COVERAGE_CODE';
            v_datas := rc_cms_insurance_coverage.inscompid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_insurance_coverage.inscompid) > 10
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'INSCOMPID Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_INSURANCE_COVERAGE';
            v_tablename := 'CMS_INSURANCE_COVERAGE';
            v_columnname := 'INSURANCE_COVERAGE_CODE';
            v_datas := rc_cms_insurance_coverage.inscompid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_insurance_coverage.inscompname IS NULL
            OR TRIM (rc_cms_insurance_coverage.inscompname) IS NULL
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'INSCOMPNAME is null';
            v_stage_tablename := 'CMS_STAGE_INSURANCE_COVERAGE';
            v_tablename := 'CMS_INSURANCE_COVERAGE';
            v_columnname := 'COMPANY_NAME';
            v_datas := rc_cms_insurance_coverage.inscompname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_insurance_coverage.inscompname) > 100
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'INSCOMPNAME Length Mismatch';
            v_stage_tablename := 'CMS_STAGE_INSURANCE_COVERAGE';
            v_tablename := 'CMS_INSURANCE_COVERAGE';
            v_columnname := 'COMPANY_NAME';
            v_datas := rc_cms_insurance_coverage.inscompname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF v_recordstatus = v_ismigrated
         THEN
            SELECT stage_insurance_coverage_seq.NEXTVAL
              INTO v_stage_insurance_coverageid
              FROM DUAL;

            INSERT INTO cms_stage_insurance_coverage
                        (ID,
                         insurance_coverage_code,
                         company_name, version_time,
                         create_by, creation_date, last_update_by,
                         last_update_date, deprecated, status
                        )
                 VALUES (v_stage_insurance_coverageid,
                         rc_cms_insurance_coverage.inscompid,
                         rc_cms_insurance_coverage.inscompname, v_version,
                         v_createby, v_app_timestamp, v_lastupdateby,
                         v_app_timestamp, v_deprecated, v_status
                        );

            SELECT insurance_coverage_seq.NEXTVAL
              INTO v_cms_insurance_coverageid
              FROM DUAL;

            INSERT INTO cms_insurance_coverage
                        (ID,
                         insurance_coverage_code,
                         company_name, version_time,
                         create_by, creation_date, last_update_by,
                         last_update_date, deprecated, status
                        )
                 VALUES (v_cms_insurance_coverageid,
                         rc_cms_insurance_coverage.inscompid,
                         rc_cms_insurance_coverage.inscompname, v_version,
                         v_createby, v_app_timestamp, v_lastupdateby,
                         v_app_timestamp, v_deprecated, v_status
                        );

            SELECT    TO_CHAR (SYSDATE, 'YYYYMMDD')
                   || '00000'
                   || (MAX (TO_NUMBER (SUBSTR (transaction_id, 14))) + 1)
              INTO v_transaction_id
              FROM TRANSACTION;

            INSERT INTO TRANSACTION
                        (transaction_id, from_state, user_id,
                         login_id, transaction_type, creation_date,
                         transaction_date, reference_id,
                         status, staging_reference_id,
                         team_id, VERSION, opsdesc,
                         user_info,
                         cur_trx_history_id, team_type_id,
                         team_membership_id
                        )
                 VALUES (v_transaction_id, vtrans_from_state, v_user_id,
                         v_login_id, v_transaction_type, v_app_date,
                         v_app_date, v_cms_insurance_coverageid,
                         vtrans_status, v_stage_insurance_coverageid,
                         v_team_id, vtrans_version, v_transopsdesc,
                         v_user_name || ' ( ' || v_login_id || ' )',
                         v_transaction_id, v_team_type_id,
                         v_team_membership_id
                        );

            -- Updating ID and Flag in migration database.
            UPDATE mig_cms_insurance_coverage
               SET ismigrated = v_recordstatus,
                   stage_idmig = v_stage_insurance_coverageid,
                   idmig = v_cms_insurance_coverageid,
                   trans_idmig = v_transaction_id
             WHERE CURRENT OF cr_cms_insurance_coverage;

            v_migratedrecords := v_migratedrecords + 1;
         ELSE
            -- Found error for record
            v_statusflag := 'ERROR';

            -- Updating Flag in migration database.
            UPDATE mig_cms_insurance_coverage
               SET ismigrated = v_recordstatus
             WHERE CURRENT OF cr_cms_insurance_coverage;
         END IF;
      END LOOP;

      CLOSE cr_cms_insurance_coverage;

      -- Logging  Migration Details
      INSERT INTO logmst
                  (ID, dmid, sequenceno,
                   stage_tablename, tablename,
                   totalrecords, migratedrecords, starttime, endtime,
                   status
                  )
           VALUES (v_logmstid, v_logmstid, v_dmseqno,
                   'CMS_STAGE_INSURANCE_COVERAGE', 'CMS_INSURANCE_COVERAGE',
                   v_totalrecords, v_migratedrecords, v_starttime, SYSDATE,
                   v_statusflag
                  );
   END sp_dm_insurance_coverage;

   PROCEDURE sp_dm_collateral (v_ismigrated IN CHAR)
   IS
      CURSOR cr_cms_collateral
      IS
         SELECT        *
                  FROM mig_cms_collateral
                 WHERE ismigrated = 'N'
         FOR UPDATE OF ismigrated;

      rc_cms_collateral          cr_cms_collateral%ROWTYPE;
      v_cms_stage_collateralid   NUMBER (19);
      v_cms_collateralid         NUMBER (19);
      v_secnature                VARCHAR2 (30);
      v_security_sub_typeid      VARCHAR2 (30);
   BEGIN
      v_totalrecords := 0;
      v_migratedrecords := 0;
      v_transaction_type := 'COLLATERAL_MASTER';
      vtrans_from_state := 'PENDING_CREATE';

      -- Getting Sequence ID for LogMst ID.
      SELECT logmst_sq.NEXTVAL
        INTO v_logmstid
        FROM DUAL;

      -- Setting data migration sequence no.
      v_dmseqno := v_dmseqno + 1;
      -- Setting StatusFlag as Successfull by default
      v_statusflag := 'SUCCESSFULL';

      -- Setting start time for migration.
      SELECT SYSDATE
        INTO v_starttime
        FROM DUAL;

      SELECT operation
        INTO v_transopsdesc
        FROM (SELECT operation, ROWNUM AS rownum1
                FROM tr_state_matrix
               WHERE stateins = v_transaction_type
                 AND fromstate = vtrans_from_state
                 AND tostate = 'ACTIVE'
                 AND userstate = 'ACTIVE'
                 AND enableind = 1
                 AND frontendop = 1)
       WHERE rownum1 = 1;

      OPEN cr_cms_collateral;

      LOOP
         FETCH cr_cms_collateral
          INTO rc_cms_collateral;

         EXIT WHEN cr_cms_collateral%NOTFOUND;
         v_totalrecords := v_totalrecords + 1;
         v_recordstatus := v_ismigrated;
         v_errormessage := NULL;

         SELECT COUNT (1)
           INTO v_count
           FROM cms_security
          WHERE UPPER (TRIM (type_name)) =
                                    UPPER (TRIM (rc_cms_collateral.secnature));

         IF v_count = 1
         THEN
            SELECT security_sub_type_id
              INTO v_secnature
              FROM cms_security
             WHERE UPPER (TRIM (type_name)) =
                                    UPPER (TRIM (rc_cms_collateral.secnature));
         ELSIF v_count > 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Duplicate SECNATURE in cms_security';
            v_stage_tablename := 'CMS_STG_COLLATERAL_NEW_MASTER';
            v_tablename := 'CMS_COLLATERAL_NEW_MASTER';
            v_columnname := 'NEW_COLLATERAL_MAIN_TYPE';
            v_datas := rc_cms_collateral.secnature;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         ELSIF v_count < 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Invalid SECNATURE';
            v_stage_tablename := 'CMS_STG_COLLATERAL_NEW_MASTER';
            v_tablename := 'CMS_COLLATERAL_NEW_MASTER';
            v_columnname := 'NEW_COLLATERAL_MAIN_TYPE';
            v_datas := rc_cms_collateral.secnature;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM cms_security_sub_type
          WHERE UPPER (TRIM (subtype_name)) =
                              UPPER (TRIM (rc_cms_collateral.securitysubtype));

         IF v_count = 1
         THEN
            SELECT security_sub_type_id
              INTO v_security_sub_typeid
              FROM cms_security_sub_type
             WHERE UPPER (TRIM (subtype_name)) =
                              UPPER (TRIM (rc_cms_collateral.securitysubtype));
         ELSIF v_count > 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage :=
                         'Duplicate SECURITYSUBTYPE in cms_security_sub_type';
            v_stage_tablename := 'CMS_STG_COLLATERAL_NEW_MASTER';
            v_tablename := 'CMS_COLLATERAL_NEW_MASTER';
            v_columnname := 'NEW_COLLATERAL_SUB_TYPE';
            v_datas := rc_cms_collateral.securitysubtype;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         ELSIF v_count < 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Invalid SECURITYSUBTYPE';
            v_stage_tablename := 'CMS_STG_COLLATERAL_NEW_MASTER';
            v_tablename := 'CMS_COLLATERAL_NEW_MASTER';
            v_columnname := 'NEW_COLLATERAL_SUB_TYPE';
            v_datas := rc_cms_collateral.securitysubtype;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_collateral.sectypeid IS NULL
            OR TRIM (rc_cms_collateral.sectypeid) IS NULL
            OR TRIM (rc_cms_collateral.sectypeid) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'SECTYPEID is null';
            v_stage_tablename := 'CMS_STG_COLLATERAL_NEW_MASTER';
            v_tablename := 'CMS_COLLATERAL_NEW_MASTER';
            v_columnname := 'NEW_COLLATERAL_CODE';
            v_datas := rc_cms_collateral.sectypeid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_collateral.sectypeid) > 30
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'SECTYPEID Length Mismatch';
            v_stage_tablename := 'CMS_STG_COLLATERAL_NEW_MASTER';
            v_tablename := 'CMS_COLLATERAL_NEW_MASTER';
            v_columnname := 'NEW_COLLATERAL_CODE';
            v_datas := rc_cms_collateral.sectypeid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         /*   IF    rc_cms_collateral.secnature IS NULL
               OR TRIM (rc_cms_collateral.secnature) IS NULL
               OR TRIM (rc_cms_collateral.secnature) = 'NULL'
            THEN
               v_recordstatus := 'E';
               v_errormessage := NULL;
               v_errormessage := 'SECNATURE is null';
               v_stage_tablename := 'CMS_STG_COLLATERAL_NEW_MASTER';
               v_tablename := 'CMS_COLLATERAL_NEW_MASTER';
               v_columnname := 'NEW_COLLATERAL_MAIN_TYPE';
               v_datas := rc_cms_collateral.secnature;
               pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                          v_errormessage,
                                                          v_logmstid,
                                                          v_stage_tablename,
                                                          v_tablename,
                                                          v_columnname,
                                                          v_datas
                                                         );
            END IF;

            IF LENGTH (rc_cms_collateral.secnature) > 60
            THEN
               v_recordstatus := 'E';
               v_errormessage := NULL;
               v_errormessage := 'SECNATURE Length Mismatch';
               v_stage_tablename := 'CMS_STG_COLLATERAL_NEW_MASTER';
               v_tablename := 'CMS_COLLATERAL_NEW_MASTER';
               v_columnname := 'NEW_COLLATERAL_MAIN_TYPE';
               v_datas := rc_cms_collateral.secnature;
               pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                          v_errormessage,
                                                          v_logmstid,
                                                          v_stage_tablename,
                                                          v_tablename,
                                                          v_columnname,
                                                          v_datas
                                                         );
            END IF;

           IF    rc_cms_collateral.secsubnature IS NULL
               OR TRIM (rc_cms_collateral.secsubnature) IS NULL
               OR TRIM (rc_cms_collateral.secsubnature) = 'NULL'
            THEN
               v_recordstatus := 'E';
               v_errormessage := NULL;
               v_errormessage := 'SECSUBNATURE is null';
               v_stage_tablename := 'CMS_STG_COLLATERAL_NEW_MASTER';
               v_tablename := 'CMS_COLLATERAL_NEW_MASTER';
               v_columnname := 'NEW_COLLATERAL_SUB_TYPE';
               v_datas := rc_cms_collateral.secsubnature;
               pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                          v_errormessage,
                                                          v_logmstid,
                                                          v_stage_tablename,
                                                          v_tablename,
                                                          v_columnname,
                                                          v_datas
                                                         );
            END IF;

            IF LENGTH (rc_cms_collateral.secsubnature) > 60
            THEN
               v_recordstatus := 'E';
               v_errormessage := NULL;
               v_errormessage := 'SECSUBNATURE Length Mismatch';
               v_stage_tablename := 'CMS_STG_COLLATERAL_NEW_MASTER';
               v_tablename := 'CMS_COLLATERAL_NEW_MASTER';
               v_columnname := 'NEW_COLLATERAL_SUB_TYPE';
               v_datas := rc_cms_collateral.secsubnature;
               pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                          v_errormessage,
                                                          v_logmstid,
                                                          v_stage_tablename,
                                                          v_tablename,
                                                          v_columnname,
                                                          v_datas
                                                         );
            END IF;
            */
         IF    rc_cms_collateral.sectypedesc IS NULL
            OR TRIM (rc_cms_collateral.sectypedesc) IS NULL
            OR TRIM (rc_cms_collateral.sectypedesc) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'SECTYPEDESC is null';
            v_stage_tablename := 'CMS_STG_COLLATERAL_NEW_MASTER';
            v_tablename := 'CMS_COLLATERAL_NEW_MASTER';
            v_columnname := 'NEW_COLLATERAL_DESCRIPTION';
            v_datas := rc_cms_collateral.sectypedesc;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_collateral.sectypedesc) > 20
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'SECTYPEDESC Length Mismatch';
            v_stage_tablename := 'CMS_STG_COLLATERAL_NEW_MASTER';
            v_tablename := 'CMS_COLLATERAL_NEW_MASTER';
            v_columnname := 'NEW_COLLATERAL_DESCRIPTION';
            v_datas := rc_cms_collateral.sectypedesc;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_collateral.insurancerequired) > 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'INSURANCEREQUIRED Length Mismatch';
            v_stage_tablename := 'CMS_STG_COLLATERAL_NEW_MASTER';
            v_tablename := 'CMS_COLLATERAL_NEW_MASTER';
            v_columnname := 'INSURANCE';
            v_datas := rc_cms_collateral.insurancerequired;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_collateral.revelutionaryfrequency) > 10
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'REVELUTIONARYFREQUENCY Length Mismatch';
            v_stage_tablename := 'CMS_STG_COLLATERAL_NEW_MASTER';
            v_tablename := 'CMS_COLLATERAL_NEW_MASTER';
            v_columnname := 'REVALUATION_FREQUENCY_COUNT';
            v_datas := rc_cms_collateral.revelutionaryfrequency;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF v_recordstatus = v_ismigrated
         THEN
            SELECT stg_collateral_new_master_seq.NEXTVAL
              INTO v_cms_stage_collateralid
              FROM DUAL;

            INSERT INTO cms_stg_collateral_new_master
                        (ID, version_time, create_by,
                         creation_date, last_update_by, last_update_date,
                         deprecated, status, new_collateral_code,
                         new_collateral_main_type, new_collateral_sub_type,
                         new_collateral_description,
                         insurance,
                         revaluation_frequency_count
                        )
                 VALUES (v_cms_stage_collateralid, v_version, v_createby,
                         v_app_timestamp, v_lastupdateby, v_app_timestamp,
                         v_deprecated, v_status, rc_cms_collateral.sectypeid,
                         v_secnature, v_security_sub_typeid,
                         rc_cms_collateral.sectypedesc,
                         DECODE (UPPER (rc_cms_collateral.insurancerequired),
                                 'Y', 'no'
                                ),
                         rc_cms_collateral.revelutionaryfrequency
                        );

            SELECT collateral_new_master_seq.NEXTVAL
              INTO v_cms_collateralid
              FROM DUAL;

            INSERT INTO cms_collateral_new_master
                        (ID, version_time, create_by,
                         creation_date, last_update_by, last_update_date,
                         deprecated, status, new_collateral_code,
                         new_collateral_main_type, new_collateral_sub_type,
                         new_collateral_description,
                         insurance,
                         revaluation_frequency_count
                        )
                 VALUES (v_cms_collateralid, v_version, v_createby,
                         v_app_timestamp, v_lastupdateby, v_app_timestamp,
                         v_deprecated, v_status, rc_cms_collateral.sectypeid,
                         v_secnature, v_security_sub_typeid,
                         rc_cms_collateral.sectypedesc,
                         DECODE (UPPER (rc_cms_collateral.insurancerequired),
                                 'Y', 'no'
                                ),
                         rc_cms_collateral.revelutionaryfrequency
                        );

            SELECT    TO_CHAR (SYSDATE, 'YYYYMMDD')
                   || '00000'
                   || (MAX (TO_NUMBER (SUBSTR (transaction_id, 14))) + 1)
              INTO v_transaction_id
              FROM TRANSACTION;

            INSERT INTO TRANSACTION
                        (transaction_id, from_state, user_id,
                         login_id, transaction_type, creation_date,
                         transaction_date, reference_id, status,
                         staging_reference_id, team_id, VERSION,
                         opsdesc,
                         user_info,
                         cur_trx_history_id, team_type_id,
                         team_membership_id
                        )
                 VALUES (v_transaction_id, vtrans_from_state, v_user_id,
                         v_login_id, v_transaction_type, v_app_date,
                         v_app_date, v_cms_collateralid, vtrans_status,
                         v_cms_stage_collateralid, v_team_id, vtrans_version,
                         v_transopsdesc,
                         v_user_name || ' ( ' || v_login_id || ' )',
                         v_transaction_id, v_team_type_id,
                         v_team_membership_id
                        );

            -- Updating ID and Flag in migration database.
            UPDATE mig_cms_collateral
               SET ismigrated = v_recordstatus,
                   stage_idmig = v_cms_stage_collateralid,
                   idmig = v_cms_collateralid,
                   trans_idmig = v_transaction_id
             WHERE CURRENT OF cr_cms_collateral;

            v_migratedrecords := v_migratedrecords + 1;
         ELSE
            -- Found error for record
            v_statusflag := 'ERROR';

            -- Updating Flag in migration database.
            UPDATE mig_cms_collateral
               SET ismigrated = v_recordstatus
             WHERE CURRENT OF cr_cms_collateral;
         END IF;
      END LOOP;

      CLOSE cr_cms_collateral;

      -- Logging  Migration Details
      INSERT INTO logmst
                  (ID, dmid, sequenceno,
                   stage_tablename,
                   tablename, totalrecords,
                   migratedrecords, starttime, endtime, status
                  )
           VALUES (v_logmstid, v_logmstid, v_dmseqno,
                   'CMS_STG_COLLATERAL_NEW_MASTER',
                   'CMS_COLLATERAL_NEW_MASTER', v_totalrecords,
                   v_migratedrecords, v_starttime, SYSDATE, v_statusflag
                  );
   END sp_dm_collateral;

   PROCEDURE sp_dm_security_document (v_ismigrated IN CHAR)
   IS
      CURSOR cr_cms_sec_doc_master
      IS
         SELECT        *
                  FROM mig_security_document_master
                 WHERE ismigrated = 'N'
         FOR UPDATE OF ismigrated;

      rc_cms_sec_doc_master           cr_cms_sec_doc_master%ROWTYPE;

      CURSOR cr_cms_sec_doc_item (c_docname VARCHAR2, c_masterid NUMBER)
      IS
         SELECT        *
                  FROM mig_security_doc_master_item
                 WHERE ismigrated = 'N' AND docname = c_docname
         FOR UPDATE OF ismigrated;

      rc_cms_sec_doc_item             cr_cms_sec_doc_item%ROWTYPE;
      v_stage_document_globallistid   NUMBER (19);
      v_cms_document_globallistid     NUMBER (19);
      v_stage_document_masterlistid   NUMBER (19);
      v_cms_document_masterlistid     NUMBER (19);
      v_document_itemid               NUMBER (19);
      v_stage_document_itemid         NUMBER (19);
      v_mttransaction_id              NUMBER (19);
      v_mtransaction_id               VARCHAR2 (30 CHAR);
      v_mtransaction_type             VARCHAR2 (20 CHAR);
      v_mtransaction_subtype          VARCHAR2 (25 CHAR);
      vmtrans_from_state              VARCHAR2 (30);
      v_mtransopsdesc                 VARCHAR2 (100 CHAR);
      mv_recordstatus                 CHAR (1);
      mv_totalrecords                 NUMBER (19);
      mv_migratedrecords              NUMBER (19);
      mv_errormessage                 VARCHAR (4000)                  := NULL;
      mv_statusflag                   VARCHAR2 (50);
      v_secnature                     VARCHAR2 (30);
      v_security_sub_typeid           VARCHAR2 (30);
   BEGIN
      v_totalrecords := 0;
      v_migratedrecords := 0;
      mv_totalrecords := 0;
      mv_migratedrecords := 0;
      v_transaction_type := 'DOCITEM';
      v_transaction_subtype := 'COL_GLOBAL_TEMPLATE';
      vtrans_from_state := 'PENDING_CREATE';
      v_mtransaction_type := 'TEMPLATE';
      v_mtransaction_subtype := 'COL_MASTER_TEMPLATE';
      vmtrans_from_state := 'PENDING_CREATE';

      -- Getting Sequence ID for LogMst ID.
      SELECT logmst_sq.NEXTVAL
        INTO v_logmstid
        FROM DUAL;

      -- Setting data migration sequence no.
      v_dmseqno := v_dmseqno + 1;
      -- Setting StatusFlag as Successfull by default
      v_statusflag := 'SUCCESSFULL';
      mv_statusflag := 'SUCCESSFULL';

      SELECT COUNT (1)
        INTO v_totalrecords
        FROM mig_security_doc_master_item
       WHERE ismigrated = 'N';

      -- Setting start time for migration.
      SELECT SYSDATE
        INTO v_starttime
        FROM DUAL;

      SELECT operation
        INTO v_transopsdesc
        FROM (SELECT operation, ROWNUM AS rownum1
                FROM tr_state_matrix
               WHERE stateins = v_transaction_type
                 AND fromstate = vtrans_from_state
                 AND tostate = 'ACTIVE'
                 AND userstate = 'ACTIVE'
                 AND enableind = 1
                 AND frontendop = 1)
       WHERE rownum1 = 1;

      SELECT operation
        INTO v_mtransopsdesc
        FROM (SELECT operation, ROWNUM AS rownum1
                FROM tr_state_matrix
               WHERE stateins = v_mtransaction_type
                 AND fromstate = vmtrans_from_state
                 AND tostate = 'ACTIVE'
                 AND userstate = 'ACTIVE'
                 AND enableind = 1
                 AND frontendop = 1)
       WHERE rownum1 = 1;

      OPEN cr_cms_sec_doc_master;

      LOOP
         FETCH cr_cms_sec_doc_master
          INTO rc_cms_sec_doc_master;

         EXIT WHEN cr_cms_sec_doc_master%NOTFOUND;
         mv_totalrecords := v_totalrecords + 1;
         mv_recordstatus := v_ismigrated;
         mv_errormessage := NULL;

         IF    rc_cms_sec_doc_master.docname IS NULL
            OR TRIM (rc_cms_sec_doc_master.docname) IS NULL
         THEN
            mv_recordstatus := 'E';
            mv_errormessage := NULL;
            mv_errormessage := 'DOCNAME is null';
            v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
            v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
            v_columnname := 'DOCUMENT_DESCRIPTION';
            v_datas := rc_cms_sec_doc_master.docname;
            pkg_climsmigration.sp_dm_insertlogdetails (mv_totalrecords,
                                                       mv_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_sec_doc_master.docname) > 200
         THEN
            mv_recordstatus := 'E';
            mv_errormessage := NULL;
            mv_errormessage := 'DOCNAME Length Mismatch';
            v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
            v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
            v_columnname := 'DOCUMENT_DESCRIPTION';
            v_datas := rc_cms_sec_doc_master.docname;
            pkg_climsmigration.sp_dm_insertlogdetails (mv_totalrecords,
                                                       mv_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM cms_security
          WHERE UPPER (TRIM (subtype_name)) =
                                UPPER (TRIM (rc_cms_sec_doc_master.secnature));

         IF v_count > 0
         THEN
            SELECT security_sub_type_id
              INTO v_secnature
              FROM cms_security
             WHERE UPPER (TRIM (subtype_name)) =
                                UPPER (TRIM (rc_cms_sec_doc_master.secnature));
         ELSE
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Invalid SECNATURE';
            v_stage_tablename := 'STAGE_DOCUMENT_MASTERLIST';
            v_tablename := 'CMS_DOCUMENT_MASTERLIST';
            v_columnname := 'SECURITY_TYPE_ID';
            v_datas := rc_cms_sec_doc_master.secnature;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         SELECT COUNT (1)
           INTO v_count
           FROM cms_security_sub_type
          WHERE UPPER (TRIM (security_sub_type_id)) =
                          UPPER (TRIM (rc_cms_sec_doc_master.securitysubtype));

         IF v_count > 0
         THEN
            SELECT security_sub_type_id
              INTO v_security_sub_typeid
              FROM cms_security_sub_type
             WHERE UPPER (TRIM (security_sub_type_id)) =
                          UPPER (TRIM (rc_cms_sec_doc_master.securitysubtype));
         ELSE
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'Invalid SECURITYSUBTYPE';
            v_stage_tablename := 'STAGE_DOCUMENT_MASTERLIST';
            v_tablename := 'CMS_DOCUMENT_MASTERLIST';
            v_columnname := 'SECURITY_SUB_TYPE_ID';
            v_datas := rc_cms_sec_doc_master.securitysubtype;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

               /*   IF    rc_cms_sec_doc_master.secnature IS NULL
                     OR TRIM (rc_cms_sec_doc_master.secnature) IS NULL
                  THEN
                     mv_recordstatus := 'E';
                     mv_errormessage := NULL;
                     mv_errormessage := 'SECNATURE is null';
                     v_stage_tablename := 'STAGE_DOCUMENT_MASTERLIST';
                     v_tablename := 'CMS_DOCUMENT_MASTERLIST';
                     v_columnname := 'SECURITY_TYPE_ID';
                     v_datas := rc_cms_sec_doc_master.secnature;
                     pkg_climsmigration.sp_dm_insertlogdetails (mv_totalrecords,
                                                                mv_errormessage,
                                                                v_logmstid,
                                                                v_stage_tablename,
                                                                v_tablename,
                                                                v_columnname,
                                                                v_datas
                                                               );
                  END IF;

                  IF LENGTH (rc_cms_sec_doc_master.secnature) > 1
                  THEN
                     mv_recordstatus := 'E';
                     mv_errormessage := NULL;
                     mv_errormessage := 'SECNATURE Length Mismatch';
                     v_stage_tablename := 'STAGE_DOCUMENT_MASTERLIST';
                     v_tablename := 'CMS_DOCUMENT_MASTERLIST';
                     v_columnname := 'SECURITY_TYPE_ID';
                     v_datas := rc_cms_sec_doc_master.secnature;
                     pkg_climsmigration.sp_dm_insertlogdetails (mv_totalrecords,
                                                                mv_errormessage,
                                                                v_logmstid,
                                                                v_stage_tablename,
                                                                v_tablename,
                                                                v_columnname,
                                                                v_datas
                                                               );
                  END IF;

                  IF    rc_cms_sec_doc_master.sectypedesc IS NULL
                     OR TRIM (rc_cms_sec_doc_master.sectypedesc) IS NULL
                  THEN
                     mv_recordstatus := 'E';
                     mv_errormessage := NULL;
                     mv_errormessage := 'SECTYPEDESC is null';
                     v_stage_tablename := 'STAGE_DOCUMENT_MASTERLIST';
                     v_tablename := 'CMS_DOCUMENT_MASTERLIST';
                     v_columnname := 'SECURITY_SUB_TYPE_ID';
                     v_datas := rc_cms_sec_doc_master.sectypedesc;
                     pkg_climsmigration.sp_dm_insertlogdetails (mv_totalrecords,
                                                                mv_errormessage,
                                                                v_logmstid,
                                                                v_stage_tablename,
                                                                v_tablename,
                                                                v_columnname,
                                                                v_datas
                                                               );
                  END IF;

                  IF LENGTH (rc_cms_sec_doc_master.sectypedesc) > 30
                  THEN
                     mv_recordstatus := 'E';
                     mv_errormessage := NULL;
                     mv_errormessage := 'SECTYPEDESC Length Mismatch';
                     v_stage_tablename := 'STAGE_DOCUMENT_MASTERLIST';
                     v_tablename := 'CMS_DOCUMENT_MASTERLIST';
                     v_columnname := 'SECURITY_SUB_TYPE_ID';
                     v_datas := rc_cms_sec_doc_master.sectypedesc;
                     pkg_climsmigration.sp_dm_insertlogdetails (mv_totalrecords,
                                                                mv_errormessage,
                                                                v_logmstid,
                                                                v_stage_tablename,
                                                                v_tablename,
                                                                v_columnname,
                                                                v_datas
                                                               );
                  END IF;
         */
         IF mv_recordstatus = v_ismigrated
         THEN
            -- v_mttransaction_id := NULL;
            SELECT stage_document_masterlist_seq.NEXTVAL
              INTO v_stage_document_masterlistid
              FROM DUAL;

            INSERT INTO stage_document_masterlist
                        (masterlist_id, country_iso_code, CATEGORY,
                         security_sub_type_id, security_type_id, version_time
                        )
                 VALUES (v_stage_document_masterlistid, 'IN', 'S',
                         v_security_sub_typeid, v_secnature, v_version
                        );

            SELECT cms_document_masterlist_seq.NEXTVAL
              INTO v_cms_document_masterlistid
              FROM DUAL;

            INSERT INTO cms_document_masterlist
                        (masterlist_id, country_iso_code, CATEGORY,
                         security_sub_type_id, security_type_id, version_time
                        )
                 VALUES (v_cms_document_masterlistid, 'IN', 'S',
                         v_security_sub_typeid, v_secnature, v_version
                        );

            SELECT    TO_CHAR (SYSDATE, 'YYYYMMDD')
                   || '00000'
                   || (MAX (TO_NUMBER (SUBSTR (transaction_id, 14))) + 1)
              INTO v_mtransaction_id
              FROM TRANSACTION;

            INSERT INTO TRANSACTION
                        (transaction_id, from_state, user_id,
                         login_id, transaction_type, creation_date,
                         transaction_date, reference_id,
                         status, staging_reference_id,
                         team_id, VERSION, opsdesc,
                         user_info,
                         cur_trx_history_id, team_type_id,
                         transaction_subtype, team_membership_id
                        )
                 VALUES (v_mtransaction_id, vmtrans_from_state, v_user_id,
                         v_login_id, v_mtransaction_type, v_app_date,
                         v_app_date, v_cms_document_masterlistid,
                         vtrans_status, v_stage_document_globallistid,
                         v_team_id, vtrans_version, v_mtransopsdesc,
                         v_user_name || ' ( ' || v_login_id || ' )',
                         v_mtransaction_id, v_team_type_id,
                         v_mtransaction_subtype, v_team_membership_id
                        );

            -- v_mttransaction_id := v_cms_document_masterlistid;
            OPEN cr_cms_sec_doc_item (rc_cms_sec_doc_master.docname,
                                      v_cms_document_masterlistid
                                     );

            LOOP
               FETCH cr_cms_sec_doc_item
                INTO rc_cms_sec_doc_item;

               EXIT WHEN cr_cms_sec_doc_item%NOTFOUND;
               -- v_totalrecords := v_totalrecords + 1;
               v_recordstatus := v_ismigrated;
               v_errormessage := NULL;

               IF    rc_cms_sec_doc_item.docid IS NULL
                  OR TRIM (rc_cms_sec_doc_item.docid) IS NULL
               THEN
                  v_recordstatus := 'E';
                  v_errormessage := NULL;
                  v_errormessage := 'DOCID is null';
                  v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
                  v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
                  v_columnname := 'DOCUMENT_CODE';
                  v_datas := rc_cms_sec_doc_item.docid;
                  pkg_climsmigration.sp_dm_insertlogdetails
                                                          (v_totalrecords,
                                                           v_errormessage,
                                                           v_logmstid,
                                                           v_stage_tablename,
                                                           v_tablename,
                                                           v_columnname,
                                                           v_datas
                                                          );
               END IF;

               IF LENGTH (rc_cms_sec_doc_item.docid) > 10
               THEN
                  v_recordstatus := 'E';
                  v_errormessage := NULL;
                  v_errormessage := 'DOCID Length Mismatch';
                  v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
                  v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
                  v_columnname := 'DOCUMENT_CODE';
                  v_datas := rc_cms_sec_doc_item.docid;
                  pkg_climsmigration.sp_dm_insertlogdetails
                                                          (v_totalrecords,
                                                           v_errormessage,
                                                           v_logmstid,
                                                           v_stage_tablename,
                                                           v_tablename,
                                                           v_columnname,
                                                           v_datas
                                                          );
               END IF;

               IF    rc_cms_sec_doc_item.docname IS NULL
                  OR TRIM (rc_cms_sec_doc_item.docname) IS NULL
               THEN
                  v_recordstatus := 'E';
                  v_errormessage := NULL;
                  v_errormessage := 'DOCNAME is null';
                  v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
                  v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
                  v_columnname := 'DOCUMENT_DESCRIPTION';
                  v_datas := rc_cms_sec_doc_item.docname;
                  pkg_climsmigration.sp_dm_insertlogdetails
                                                          (v_totalrecords,
                                                           v_errormessage,
                                                           v_logmstid,
                                                           v_stage_tablename,
                                                           v_tablename,
                                                           v_columnname,
                                                           v_datas
                                                          );
               END IF;

               IF LENGTH (rc_cms_sec_doc_item.docname) > 200
               THEN
                  v_recordstatus := 'E';
                  v_errormessage := NULL;
                  v_errormessage := 'DOCNAME Length Mismatch';
                  v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
                  v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
                  v_columnname := 'DOCUMENT_DESCRIPTION';
                  v_datas := rc_cms_sec_doc_item.docname;
                  pkg_climsmigration.sp_dm_insertlogdetails
                                                          (v_totalrecords,
                                                           v_errormessage,
                                                           v_logmstid,
                                                           v_stage_tablename,
                                                           v_tablename,
                                                           v_columnname,
                                                           v_datas
                                                          );
               END IF;

               IF    rc_cms_sec_doc_item.doctenure IS NULL
                  OR TRIM (rc_cms_sec_doc_item.doctenure) IS NULL
               THEN
                  v_recordstatus := 'E';
                  v_errormessage := NULL;
                  v_errormessage := 'DOCTENURE is null';
                  v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
                  v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
                  v_columnname := 'TENURE_COUNT';
                  v_datas := rc_cms_sec_doc_item.doctenure;
                  pkg_climsmigration.sp_dm_insertlogdetails
                                                          (v_totalrecords,
                                                           v_errormessage,
                                                           v_logmstid,
                                                           v_stage_tablename,
                                                           v_tablename,
                                                           v_columnname,
                                                           v_datas
                                                          );
               END IF;

               IF LENGTH (rc_cms_sec_doc_item.doctenure) > 8
               THEN
                  v_recordstatus := 'E';
                  v_errormessage := NULL;
                  v_errormessage := 'DOCTENURE Length Mismatch';
                  v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
                  v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
                  v_columnname := 'TENURE_COUNT';
                  v_datas := rc_cms_sec_doc_item.doctenure;
                  pkg_climsmigration.sp_dm_insertlogdetails
                                                          (v_totalrecords,
                                                           v_errormessage,
                                                           v_logmstid,
                                                           v_stage_tablename,
                                                           v_tablename,
                                                           v_columnname,
                                                           v_datas
                                                          );
               END IF;

               IF    rc_cms_sec_doc_item.riskeffect IS NULL
                  OR TRIM (rc_cms_sec_doc_item.riskeffect) IS NULL
               THEN
                  v_recordstatus := 'E';
                  v_errormessage := NULL;
                  v_errormessage := 'RISKEFFECT is null';
                  v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
                  v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
                  v_columnname := 'IS_MANDATORY';
                  v_datas := rc_cms_sec_doc_item.riskeffect;
                  pkg_climsmigration.sp_dm_insertlogdetails
                                                          (v_totalrecords,
                                                           v_errormessage,
                                                           v_logmstid,
                                                           v_stage_tablename,
                                                           v_tablename,
                                                           v_columnname,
                                                           v_datas
                                                          );
               END IF;

               IF LENGTH (rc_cms_sec_doc_item.riskeffect) > 1
               THEN
                  v_recordstatus := 'E';
                  v_errormessage := NULL;
                  v_errormessage := 'RISKEFFECT Length Mismatch';
                  v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
                  v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
                  v_columnname := 'IS_MANDATORY';
                  v_datas := rc_cms_sec_doc_item.riskeffect;
                  pkg_climsmigration.sp_dm_insertlogdetails
                                                          (v_totalrecords,
                                                           v_errormessage,
                                                           v_logmstid,
                                                           v_stage_tablename,
                                                           v_tablename,
                                                           v_columnname,
                                                           v_datas
                                                          );
               END IF;

               IF v_recordstatus = v_ismigrated
               THEN
                  SELECT stage_document_globallist_seq.NEXTVAL
                    INTO v_stage_document_globallistid
                    FROM DUAL;

                  INSERT INTO stage_document_globallist
                              (document_id,
                               document_description,
                               document_code, CATEGORY, version_time,
                               doc_version, is_pre_approve, is_for_borrower,
                               is_for_pledgor, tenure_count, tenure_type,
                               deprecated, status
                              )
                       VALUES (v_stage_document_globallistid,
                               rc_cms_sec_doc_item.docname,
                               rc_cms_sec_doc_item.docid, 'S', v_version,
                               0, 'N', 'N',
                               'N', rc_cms_sec_doc_item.doctenure, 1,
                               v_deprecated, v_status
                              );

                  SELECT cms_document_globallist_seq.NEXTVAL
                    INTO v_cms_document_globallistid
                    FROM DUAL;

                  INSERT INTO cms_document_globallist
                              (document_id,
                               document_description,
                               document_code, CATEGORY, version_time,
                               doc_version, is_pre_approve, is_for_borrower,
                               is_for_pledgor, tenure_count, tenure_type,
                               deprecated, status
                              )
                       VALUES (v_cms_document_globallistid,
                               rc_cms_sec_doc_item.docname,
                               rc_cms_sec_doc_item.docid, 'S', v_version,
                               0, 'N', 'N',
                               'N', rc_cms_sec_doc_item.doctenure, 1,
                               v_deprecated, v_status
                              );

                  SELECT    TO_CHAR (SYSDATE, 'YYYYMMDD')
                         || '00000'
                         || (MAX (TO_NUMBER (SUBSTR (transaction_id, 14))) + 1
                            )
                    INTO v_transaction_id
                    FROM TRANSACTION;

                  INSERT INTO TRANSACTION
                              (transaction_id, from_state,
                               user_id, login_id, transaction_type,
                               creation_date, transaction_date,
                               reference_id, status,
                               staging_reference_id, team_id,
                               VERSION, opsdesc,
                               user_info,
                               cur_trx_history_id, team_type_id,
                               transaction_subtype, team_membership_id
                              )
                       VALUES (v_transaction_id, vtrans_from_state,
                               v_user_id, v_login_id, v_transaction_type,
                               v_app_date, v_app_date,
                               v_cms_document_globallistid, vtrans_status,
                               v_stage_document_globallistid, v_team_id,
                               vtrans_version, v_transopsdesc,
                               v_user_name || ' ( ' || v_login_id || ' )',
                               v_transaction_id, v_team_type_id,
                               v_transaction_subtype, v_team_membership_id
                              );

                  SELECT stg_document_item_seq.NEXTVAL
                    INTO v_stage_document_itemid
                    FROM DUAL;

                  INSERT INTO stage_document_item
                              (doc_item_id,
                               doc_description, in_vault, in_ext_custody,
                               is_mandatory,
                               is_mandatory_for_borrower,
                               is_mandatory_for_pledgor, is_audit,
                               is_deleted, masterlist_id,
                               document_id,
                               document_code, doc_version, with_title,
                               is_property_completed, without_title,
                               under_construction, new_with_fbr,
                               new_without_fbr, used_with_fbr,
                               used_without_fbr, is_pre_approve,
                               is_for_borrower, is_for_pledgor, tenure_count,
                               tenure_type, is_mandatory_display
                              )
                       VALUES (v_stage_document_itemid,
                               rc_cms_sec_doc_item.docname, 'N', 'N',
                               rc_cms_sec_doc_master.critical,
                               rc_cms_sec_doc_master.mandatory,
                               'N', 'N',
                               'N', v_cms_document_masterlistid,
                               v_cms_document_globallistid,
                               rc_cms_sec_doc_item.docid, 0, 0,
                               0, 0,
                               0, 0,
                               0, 0,
                               0, 'N',
                               'N', 'N', rc_cms_sec_doc_item.doctenure,
                               1, 'N'
                              );

                  SELECT document_item_seq.NEXTVAL
                    INTO v_document_itemid
                    FROM DUAL;

                  INSERT INTO cms_document_item
                              (doc_item_id,
                               doc_description, in_vault, in_ext_custody,
                               is_mandatory,
                               is_mandatory_for_borrower,
                               is_mandatory_for_pledgor, is_audit,
                               is_deleted, masterlist_id,
                               document_id,
                               document_code, doc_version, with_title,
                               is_property_completed, without_title,
                               under_construction, new_with_fbr,
                               new_without_fbr, used_with_fbr,
                               used_without_fbr, is_pre_approve,
                               is_for_borrower, is_for_pledgor, tenure_count,
                               tenure_type, is_mandatory_display
                              )
                       VALUES (v_document_itemid,
                               rc_cms_sec_doc_item.docname, 'N', 'N',
                               rc_cms_sec_doc_master.critical,
                               rc_cms_sec_doc_master.mandatory,
                               'N', 'N',
                               'N', v_cms_document_masterlistid,
                               v_cms_document_globallistid,
                               rc_cms_sec_doc_item.docid, 0, 0,
                               0, 0,
                               0, 0,
                               0, 0,
                               0, 'N',
                               'N', 'N', rc_cms_sec_doc_item.doctenure,
                               1, 'N'
                              );

                  -- Updating ID and Flag in migration database.
                  UPDATE mig_security_doc_master_item
                     SET ismigrated = v_recordstatus,
                         gstage_idmig = v_stage_document_globallistid,
                         gidmig = v_cms_document_globallistid,
                         mstage_idmig = v_stage_document_itemid,
                         midmig = v_cms_document_globallistid,
                         trans_idmig = v_transaction_id
                   WHERE CURRENT OF cr_cms_sec_doc_item;

                  v_migratedrecords := v_migratedrecords + 1;
               ELSE
                  -- Found error for record
                  v_statusflag := 'ERROR';

                  -- Updating Flag in migration database.
                  UPDATE mig_security_doc_master_item
                     SET ismigrated = v_recordstatus
                   WHERE CURRENT OF cr_cms_sec_doc_item;
               END IF;
            END LOOP;

            CLOSE cr_cms_sec_doc_item;

            -- Updating ID and Flag in migration database.
            UPDATE mig_security_document_master
               SET ismigrated = mv_recordstatus,
                   stage_idmig = v_stage_document_masterlistid,
                   idmig = v_cms_document_masterlistid,
                   trans_idmig = v_mtransaction_id
             WHERE CURRENT OF cr_cms_sec_doc_master;

            mv_migratedrecords := mv_migratedrecords + 1;
         ELSE
            -- Found error for record
            mv_statusflag := 'ERROR';

            -- Updating Flag in migration database.
            UPDATE mig_security_document_master
               SET ismigrated = mv_recordstatus
             WHERE CURRENT OF cr_cms_sec_doc_master;
         END IF;
      END LOOP;

      CLOSE cr_cms_sec_doc_master;

      -- Logging  Migration Details
      INSERT INTO logmst
                  (ID, dmid, sequenceno,
                   stage_tablename,
                   tablename, totalrecords,
                   migratedrecords, starttime, endtime, status
                  )
           VALUES (v_logmstid, v_logmstid, v_dmseqno,
                   'SEC_STAGE_DOCUMENT_MASTERLIST',
                   'SEC_CMS_DOCUMENT_MASTERLIST', mv_totalrecords,
                   mv_migratedrecords, v_starttime, SYSDATE, mv_statusflag
                  );

      INSERT INTO logmst
                  (ID, dmid, sequenceno,
                   stage_tablename,
                   tablename, totalrecords,
                   migratedrecords, starttime, endtime, status
                  )
           VALUES (v_logmstid, v_logmstid, v_dmseqno,
                   'SEC_STAGE_DOCUMENT_GLOBALLIST',
                   'SEC_CMS_DOCUMENT_GLOBALLIST', v_totalrecords,
                   v_migratedrecords, v_starttime, SYSDATE, v_statusflag
                  );
   END sp_dm_security_document;

   PROCEDURE sp_dm_facility_document (v_ismigrated IN CHAR)
   IS
      CURSOR cr_cms_sec_doc_master
      IS
         SELECT        *
                  FROM mig_facility_document_master
                 WHERE ismigrated = 'N'
         FOR UPDATE OF ismigrated;

      rc_cms_sec_doc_master           cr_cms_sec_doc_master%ROWTYPE;

      CURSOR cr_cms_sec_doc_item (c_docname VARCHAR2, c_masterid NUMBER)
      IS
         SELECT        *
                  FROM mig_facility_doc_master_item
                 WHERE ismigrated = 'N' AND docname = c_docname
         FOR UPDATE OF ismigrated;

      rc_cms_sec_doc_item             cr_cms_sec_doc_item%ROWTYPE;
      v_stage_document_globallistid   NUMBER (19);
      v_cms_document_globallistid     NUMBER (19);
      v_stage_document_masterlistid   NUMBER (19);
      v_cms_document_masterlistid     NUMBER (19);
      v_document_itemid               NUMBER (19);
      v_stage_document_itemid         NUMBER (19);
      v_mttransaction_id              NUMBER (19);
      v_mtransaction_id               VARCHAR2 (30 CHAR);
      v_mtransaction_type             VARCHAR2 (20 CHAR);
      v_mtransaction_subtype          VARCHAR2 (25 CHAR);
      vmtrans_from_state              VARCHAR2 (30);
      v_mtransopsdesc                 VARCHAR2 (100 CHAR);
      mv_recordstatus                 CHAR (1);
      mv_totalrecords                 NUMBER (19);
      mv_migratedrecords              NUMBER (19);
      mv_errormessage                 VARCHAR (4000)                  := NULL;
      mv_statusflag                   VARCHAR2 (50);
      v_facilitycode                  VARCHAR2 (300);
   BEGIN
      v_totalrecords := 0;
      v_migratedrecords := 0;
      mv_totalrecords := 0;
      mv_migratedrecords := 0;
      v_transaction_type := 'DOCITEM';
      v_transaction_subtype := 'FAC_GLOBAL_TEMPLATE';
      vtrans_from_state := 'PENDING_CREATE';
      v_mtransaction_type := 'TEMPLATE';
      v_mtransaction_subtype := 'FAC_MASTER_TEMPLATE';
      vmtrans_from_state := 'PENDING_CREATE';

      -- Getting Sequence ID for LogMst ID.
      SELECT logmst_sq.NEXTVAL
        INTO v_logmstid
        FROM DUAL;

      -- Setting data migration sequence no.
      v_dmseqno := v_dmseqno + 1;
      -- Setting StatusFlag as Successfull by default
      v_statusflag := 'SUCCESSFULL';
      mv_statusflag := 'SUCCESSFULL';

      SELECT COUNT (1)
        INTO v_totalrecords
        FROM mig_facility_doc_master_item
       WHERE ismigrated = 'N';

      -- Setting start time for migration.
      SELECT SYSDATE
        INTO v_starttime
        FROM DUAL;

      SELECT operation
        INTO v_transopsdesc
        FROM (SELECT operation, ROWNUM AS rownum1
                FROM tr_state_matrix
               WHERE stateins = v_transaction_type
                 AND fromstate = vtrans_from_state
                 AND tostate = 'ACTIVE'
                 AND userstate = 'ACTIVE'
                 AND enableind = 1
                 AND frontendop = 1)
       WHERE rownum1 = 1;

      SELECT operation
        INTO v_mtransopsdesc
        FROM (SELECT operation, ROWNUM AS rownum1
                FROM tr_state_matrix
               WHERE stateins = v_mtransaction_type
                 AND fromstate = vmtrans_from_state
                 AND tostate = 'ACTIVE'
                 AND userstate = 'ACTIVE'
                 AND enableind = 1
                 AND frontendop = 1)
       WHERE rownum1 = 1;

      OPEN cr_cms_sec_doc_master;

      LOOP
         FETCH cr_cms_sec_doc_master
          INTO rc_cms_sec_doc_master;

         EXIT WHEN cr_cms_sec_doc_master%NOTFOUND;
         mv_totalrecords := v_totalrecords + 1;
         mv_recordstatus := v_ismigrated;
         mv_errormessage := NULL;

         IF    rc_cms_sec_doc_master.docname IS NULL
            OR TRIM (rc_cms_sec_doc_master.docname) IS NULL
         THEN
            mv_recordstatus := 'E';
            mv_errormessage := NULL;
            mv_errormessage := 'DOCNAME is null';
            v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
            v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
            v_columnname := 'DOCUMENT_DESCRIPTION';
            v_datas := rc_cms_sec_doc_master.docname;
            pkg_climsmigration.sp_dm_insertlogdetails (mv_totalrecords,
                                                       mv_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_sec_doc_master.docname) > 200
         THEN
            mv_recordstatus := 'E';
            mv_errormessage := NULL;
            mv_errormessage := 'DOCNAME Length Mismatch';
            v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
            v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
            v_columnname := 'DOCUMENT_DESCRIPTION';
            v_datas := rc_cms_sec_doc_master.docname;
            pkg_climsmigration.sp_dm_insertlogdetails (mv_totalrecords,
                                                       mv_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

              /*    IF    rc_cms_sec_doc_master.facilityname IS NULL
                     OR TRIM (rc_cms_sec_doc_master.facilityname) IS NULL
                  THEN
                     mv_recordstatus := 'E';
                     mv_errormessage := NULL;
                     mv_errormessage := 'FACILITYNAME is null';
                     v_stage_tablename := 'STAGE_DOCUMENT_MASTERLIST';
                     v_tablename := 'CMS_DOCUMENT_MASTERLIST';
                     v_columnname := 'facility_TYPE_ID';
                     v_datas := rc_cms_sec_doc_master.facilityname;
                     pkg_climsmigration.sp_dm_insertlogdetails (mv_totalrecords,
                                                                mv_errormessage,
                                                                v_logmstid,
                                                                v_stage_tablename,
                                                                v_tablename,
                                                                v_columnname,
                                                                v_datas
                                                               );
                  END IF;

                  IF LENGTH (rc_cms_sec_doc_master.facilityname) > 100
                  THEN
                     mv_recordstatus := 'E';
                     mv_errormessage := NULL;
                     mv_errormessage := 'FACILITYNAME Length Mismatch';
                     v_stage_tablename := 'STAGE_DOCUMENT_MASTERLIST';
                     v_tablename := 'CMS_DOCUMENT_MASTERLIST';
                     v_columnname := 'facility_TYPE_ID';
                     v_datas := rc_cms_sec_doc_master.facilityname;
                     pkg_climsmigration.sp_dm_insertlogdetails (mv_totalrecords,
                                                                mv_errormessage,
                                                                v_logmstid,
                                                                v_stage_tablename,
                                                                v_tablename,
                                                                v_columnname,
                                                                v_datas
                                                               );
                  END IF;
         */
         SELECT COUNT (1)
           INTO v_count
           FROM cms_facility_new_master
          WHERE UPPER (new_facility_code) =
                                      UPPER (rc_cms_sec_doc_master.facilityid);

         IF v_count > 1
         THEN
            mv_recordstatus := 'E';
            mv_errormessage := NULL;
            mv_errormessage := 'FACILITYID Duplicate in Facility Master';
            v_stage_tablename := 'STAGE_DOCUMENT_MASTERLIST';
            v_tablename := 'CMS_DOCUMENT_MASTERLIST';
            v_columnname := 'facility_TYPE_ID';
            v_datas := rc_cms_sec_doc_master.facilityid;
            pkg_climsmigration.sp_dm_insertlogdetails (mv_totalrecords,
                                                       mv_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         ELSIF v_count < 1
         THEN
            mv_recordstatus := 'E';
            mv_errormessage := NULL;
            mv_errormessage := 'FACILITYID not Present in Facility Master';
            v_stage_tablename := 'STAGE_DOCUMENT_MASTERLIST';
            v_tablename := 'CMS_DOCUMENT_MASTERLIST';
            v_columnname := 'facility_TYPE_ID';
            v_datas := rc_cms_sec_doc_master.facilityid;
            pkg_climsmigration.sp_dm_insertlogdetails (mv_totalrecords,
                                                       mv_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         ELSIF v_count = 1
         THEN
            SELECT new_facility_code
              INTO v_facilitycode
              FROM cms_facility_new_master
             WHERE UPPER (new_facility_code) =
                                      UPPER (rc_cms_sec_doc_master.facilityid);
         END IF;

         IF LENGTH (v_facilitycode) > 20
         THEN
            mv_recordstatus := 'E';
            mv_errormessage := NULL;
            mv_errormessage :=
                           'FACILITYID Length Mismatch With SECURITY_TYPE_ID';
            v_stage_tablename := 'STAGE_DOCUMENT_MASTERLIST';
            v_tablename := 'CMS_DOCUMENT_MASTERLIST';
            v_columnname := 'facility_TYPE_ID';
            v_datas := v_facilitycode;
            pkg_climsmigration.sp_dm_insertlogdetails (mv_totalrecords,
                                                       mv_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF mv_recordstatus = v_ismigrated
         THEN
            -- v_mttransaction_id := NULL;
            SELECT stage_document_masterlist_seq.NEXTVAL
              INTO v_stage_document_masterlistid
              FROM DUAL;

            INSERT INTO stage_document_masterlist
                        (masterlist_id, country_iso_code, CATEGORY,
                         security_sub_type_id, security_type_id, version_time
                        )
                 VALUES (v_stage_document_masterlistid, 'IN', 'F',
                         v_facilitycode, v_facilitycode, v_version
                        );

            SELECT cms_document_masterlist_seq.NEXTVAL
              INTO v_cms_document_masterlistid
              FROM DUAL;

            INSERT INTO cms_document_masterlist
                        (masterlist_id, country_iso_code, CATEGORY,
                         security_sub_type_id, security_type_id, version_time
                        )
                 VALUES (v_cms_document_masterlistid, 'IN', 'F',
                         v_facilitycode, v_facilitycode, v_version
                        );

            SELECT    TO_CHAR (SYSDATE, 'YYYYMMDD')
                   || '00000'
                   || (MAX (TO_NUMBER (SUBSTR (transaction_id, 14))) + 1)
              INTO v_mtransaction_id
              FROM TRANSACTION;

            INSERT INTO TRANSACTION
                        (transaction_id, from_state, user_id,
                         login_id, transaction_type, creation_date,
                         transaction_date, reference_id,
                         status, staging_reference_id,
                         team_id, VERSION, opsdesc,
                         user_info,
                         cur_trx_history_id, team_type_id,
                         transaction_subtype, team_membership_id
                        )
                 VALUES (v_mtransaction_id, vmtrans_from_state, v_user_id,
                         v_login_id, v_mtransaction_type, v_app_date,
                         v_app_date, v_cms_document_masterlistid,
                         vtrans_status, v_stage_document_globallistid,
                         v_team_id, vtrans_version, v_mtransopsdesc,
                         v_user_name || ' ( ' || v_login_id || ' )',
                         v_mtransaction_id, v_team_type_id,
                         v_mtransaction_subtype, v_team_membership_id
                        );

            -- v_mttransaction_id := v_cms_document_masterlistid;
            OPEN cr_cms_sec_doc_item (rc_cms_sec_doc_master.docname,
                                      v_cms_document_masterlistid
                                     );

            LOOP
               FETCH cr_cms_sec_doc_item
                INTO rc_cms_sec_doc_item;

               EXIT WHEN cr_cms_sec_doc_item%NOTFOUND;
               -- v_totalrecords := v_totalrecords + 1;
               v_recordstatus := v_ismigrated;
               v_errormessage := NULL;

               IF    rc_cms_sec_doc_item.docid IS NULL
                  OR TRIM (rc_cms_sec_doc_item.docid) IS NULL
               THEN
                  v_recordstatus := 'E';
                  v_errormessage := NULL;
                  v_errormessage := 'DOCID is null';
                  v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
                  v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
                  v_columnname := 'DOCUMENT_CODE';
                  v_datas := rc_cms_sec_doc_item.docid;
                  pkg_climsmigration.sp_dm_insertlogdetails
                                                          (v_totalrecords,
                                                           v_errormessage,
                                                           v_logmstid,
                                                           v_stage_tablename,
                                                           v_tablename,
                                                           v_columnname,
                                                           v_datas
                                                          );
               END IF;

               IF LENGTH (rc_cms_sec_doc_item.docid) > 10
               THEN
                  v_recordstatus := 'E';
                  v_errormessage := NULL;
                  v_errormessage := 'DOCID Length Mismatch';
                  v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
                  v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
                  v_columnname := 'DOCUMENT_CODE';
                  v_datas := rc_cms_sec_doc_item.docid;
                  pkg_climsmigration.sp_dm_insertlogdetails
                                                          (v_totalrecords,
                                                           v_errormessage,
                                                           v_logmstid,
                                                           v_stage_tablename,
                                                           v_tablename,
                                                           v_columnname,
                                                           v_datas
                                                          );
               END IF;

               IF    rc_cms_sec_doc_item.docname IS NULL
                  OR TRIM (rc_cms_sec_doc_item.docname) IS NULL
               THEN
                  v_recordstatus := 'E';
                  v_errormessage := NULL;
                  v_errormessage := 'DOCNAME is null';
                  v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
                  v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
                  v_columnname := 'DOCUMENT_DESCRIPTION';
                  v_datas := rc_cms_sec_doc_item.docname;
                  pkg_climsmigration.sp_dm_insertlogdetails
                                                          (v_totalrecords,
                                                           v_errormessage,
                                                           v_logmstid,
                                                           v_stage_tablename,
                                                           v_tablename,
                                                           v_columnname,
                                                           v_datas
                                                          );
               END IF;

               IF LENGTH (rc_cms_sec_doc_item.docname) > 200
               THEN
                  v_recordstatus := 'E';
                  v_errormessage := NULL;
                  v_errormessage := 'DOCNAME Length Mismatch';
                  v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
                  v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
                  v_columnname := 'DOCUMENT_DESCRIPTION';
                  v_datas := rc_cms_sec_doc_item.docname;
                  pkg_climsmigration.sp_dm_insertlogdetails
                                                          (v_totalrecords,
                                                           v_errormessage,
                                                           v_logmstid,
                                                           v_stage_tablename,
                                                           v_tablename,
                                                           v_columnname,
                                                           v_datas
                                                          );
               END IF;

               IF    rc_cms_sec_doc_item.doctenure IS NULL
                  OR TRIM (rc_cms_sec_doc_item.doctenure) IS NULL
               THEN
                  v_recordstatus := 'E';
                  v_errormessage := NULL;
                  v_errormessage := 'DOCTENURE is null';
                  v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
                  v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
                  v_columnname := 'TENURE_COUNT';
                  v_datas := rc_cms_sec_doc_item.doctenure;
                  pkg_climsmigration.sp_dm_insertlogdetails
                                                          (v_totalrecords,
                                                           v_errormessage,
                                                           v_logmstid,
                                                           v_stage_tablename,
                                                           v_tablename,
                                                           v_columnname,
                                                           v_datas
                                                          );
               END IF;

               IF LENGTH (rc_cms_sec_doc_item.doctenure) > 8
               THEN
                  v_recordstatus := 'E';
                  v_errormessage := NULL;
                  v_errormessage := 'DOCTENURE Length Mismatch';
                  v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
                  v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
                  v_columnname := 'TENURE_COUNT';
                  v_datas := rc_cms_sec_doc_item.doctenure;
                  pkg_climsmigration.sp_dm_insertlogdetails
                                                          (v_totalrecords,
                                                           v_errormessage,
                                                           v_logmstid,
                                                           v_stage_tablename,
                                                           v_tablename,
                                                           v_columnname,
                                                           v_datas
                                                          );
               END IF;

                          /*
                              IF    rc_cms_sec_doc_item.riskeffect IS NULL
                                 OR TRIM (rc_cms_sec_doc_item.riskeffect) IS NULL
                              THEN
                                 v_recordstatus := 'E';
                                 v_errormessage := NULL;
                                 v_errormessage := 'RISKEFFECT is null';
                                 v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
                                 v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
                                 v_columnname := 'IS_MANDATORY';
                                 v_datas := rc_cms_sec_doc_item.riskeffect;
                                 pkg_climsmigration.sp_dm_insertlogdetails
                                                                         (v_totalrecords,
                                                                          v_errormessage,
                                                                          v_logmstid,
                                                                          v_stage_tablename,
                                                                          v_tablename,
                                                                          v_columnname,
                                                                          v_datas
                                                                         );
                              END IF;

                              IF LENGTH (rc_cms_sec_doc_item.riskeffect) > 1
                              THEN
                                 v_recordstatus := 'E';
                                 v_errormessage := NULL;
                                 v_errormessage := 'RISKEFFECT Length Mismatch';
                                 v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
                                 v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
                                 v_columnname := 'IS_MANDATORY';
                                 v_datas := rc_cms_sec_doc_item.riskeffect;
                                 pkg_climsmigration.sp_dm_insertlogdetails
                                                                         (v_totalrecords,
                                                                          v_errormessage,
                                                                          v_logmstid,
                                                                          v_stage_tablename,
                                                                          v_tablename,
                                                                          v_columnname,
                                                                          v_datas
                                                                         );
                              END IF;
               */
               IF v_recordstatus = v_ismigrated
               THEN
                  SELECT stage_document_globallist_seq.NEXTVAL
                    INTO v_stage_document_globallistid
                    FROM DUAL;

                  INSERT INTO stage_document_globallist
                              (document_id,
                               document_description,
                               document_code, CATEGORY, version_time,
                               doc_version, is_pre_approve, is_for_borrower,
                               is_for_pledgor, tenure_count, tenure_type,
                               deprecated, status
                              )
                       VALUES (v_stage_document_globallistid,
                               rc_cms_sec_doc_item.docname,
                               rc_cms_sec_doc_item.docid, 'S', v_version,
                               0, 'N', 'N',
                               'N', rc_cms_sec_doc_item.doctenure, 1,
                               v_deprecated, v_status
                              );

                  SELECT cms_document_globallist_seq.NEXTVAL
                    INTO v_cms_document_globallistid
                    FROM DUAL;

                  INSERT INTO cms_document_globallist
                              (document_id,
                               document_description,
                               document_code, CATEGORY, version_time,
                               doc_version, is_pre_approve, is_for_borrower,
                               is_for_pledgor, tenure_count, tenure_type,
                               deprecated, status
                              )
                       VALUES (v_cms_document_globallistid,
                               rc_cms_sec_doc_item.docname,
                               rc_cms_sec_doc_item.docid, 'S', v_version,
                               0, 'N', 'N',
                               'N', rc_cms_sec_doc_item.doctenure, 1,
                               v_deprecated, v_status
                              );

                  SELECT    TO_CHAR (SYSDATE, 'YYYYMMDD')
                         || '00000'
                         || (MAX (TO_NUMBER (SUBSTR (transaction_id, 14))) + 1
                            )
                    INTO v_transaction_id
                    FROM TRANSACTION;

                  INSERT INTO TRANSACTION
                              (transaction_id, from_state,
                               user_id, login_id, transaction_type,
                               creation_date, transaction_date,
                               reference_id, status,
                               staging_reference_id, team_id,
                               VERSION, opsdesc,
                               user_info,
                               cur_trx_history_id, team_type_id,
                               transaction_subtype, team_membership_id
                              )
                       VALUES (v_transaction_id, vtrans_from_state,
                               v_user_id, v_login_id, v_transaction_type,
                               v_app_date, v_app_date,
                               v_cms_document_globallistid, vtrans_status,
                               v_stage_document_globallistid, v_team_id,
                               vtrans_version, v_transopsdesc,
                               v_user_name || ' ( ' || v_login_id || ' )',
                               v_transaction_id, v_team_type_id,
                               v_transaction_subtype, v_team_membership_id
                              );

                  SELECT stg_document_item_seq.NEXTVAL
                    INTO v_stage_document_itemid
                    FROM DUAL;

                  INSERT INTO stage_document_item
                              (doc_item_id,
                               doc_description, in_vault, in_ext_custody,
                               is_mandatory,
                               is_mandatory_for_borrower,
                               is_mandatory_for_pledgor, is_audit,
                               is_deleted, masterlist_id,
                               document_id,
                               document_code, doc_version, with_title,
                               is_property_completed, without_title,
                               under_construction, new_with_fbr,
                               new_without_fbr, used_with_fbr,
                               used_without_fbr, is_pre_approve,
                               is_for_borrower, is_for_pledgor, tenure_count,
                               tenure_type, is_mandatory_display
                              )
                       VALUES (v_stage_document_itemid,
                               rc_cms_sec_doc_item.docname, 'N', 'N',
                               rc_cms_sec_doc_master.critical,
                               rc_cms_sec_doc_master.mandatory,
                               'N', 'N',
                               'N', v_cms_document_masterlistid,
                               v_cms_document_globallistid,
                               rc_cms_sec_doc_item.docid, 0, 0,
                               0, 0,
                               0, 0,
                               0, 0,
                               0, 'N',
                               'N', 'N', rc_cms_sec_doc_item.doctenure,
                               1, 'N'
                              );

                  SELECT document_item_seq.NEXTVAL
                    INTO v_document_itemid
                    FROM DUAL;

                  INSERT INTO cms_document_item
                              (doc_item_id,
                               doc_description, in_vault, in_ext_custody,
                               is_mandatory,
                               is_mandatory_for_borrower,
                               is_mandatory_for_pledgor, is_audit,
                               is_deleted, masterlist_id,
                               document_id,
                               document_code, doc_version, with_title,
                               is_property_completed, without_title,
                               under_construction, new_with_fbr,
                               new_without_fbr, used_with_fbr,
                               used_without_fbr, is_pre_approve,
                               is_for_borrower, is_for_pledgor, tenure_count,
                               tenure_type, is_mandatory_display
                              )
                       VALUES (v_document_itemid,
                               rc_cms_sec_doc_item.docname, 'N', 'N',
                               rc_cms_sec_doc_master.critical,
                               rc_cms_sec_doc_master.mandatory,
                               'N', 'N',
                               'N', v_cms_document_masterlistid,
                               v_cms_document_globallistid,
                               rc_cms_sec_doc_item.docid, 0, 0,
                               0, 0,
                               0, 0,
                               0, 0,
                               0, 'N',
                               'N', 'N', rc_cms_sec_doc_item.doctenure,
                               1, 'N'
                              );

                  -- Updating ID and Flag in migration database.
                  UPDATE mig_facility_doc_master_item
                     SET ismigrated = v_recordstatus,
                         gstage_idmig = v_stage_document_globallistid,
                         gidmig = v_cms_document_globallistid,
                         mstage_idmig = v_stage_document_itemid,
                         midmig = v_cms_document_globallistid,
                         trans_idmig = v_transaction_id
                   WHERE CURRENT OF cr_cms_sec_doc_item;

                  v_migratedrecords := v_migratedrecords + 1;
               ELSE
                  -- Found error for record
                  v_statusflag := 'ERROR';

                  -- Updating Flag in migration database.
                  UPDATE mig_facility_doc_master_item
                     SET ismigrated = v_recordstatus
                   WHERE CURRENT OF cr_cms_sec_doc_item;
               END IF;
            END LOOP;

            CLOSE cr_cms_sec_doc_item;

            -- Updating ID and Flag in migration database.
            UPDATE mig_facility_document_master
               SET ismigrated = mv_recordstatus,
                   stage_idmig = v_stage_document_masterlistid,
                   idmig = v_cms_document_masterlistid,
                   trans_idmig = v_mtransaction_id
             WHERE CURRENT OF cr_cms_sec_doc_master;

            mv_migratedrecords := mv_migratedrecords + 1;
         ELSE
            -- Found error for record
            mv_statusflag := 'ERROR';

            -- Updating Flag in migration database.
            UPDATE mig_facility_document_master
               SET ismigrated = mv_recordstatus
             WHERE CURRENT OF cr_cms_sec_doc_master;
         END IF;
      END LOOP;

      CLOSE cr_cms_sec_doc_master;

      -- Logging  Migration Details
      INSERT INTO logmst
                  (ID, dmid, sequenceno,
                   stage_tablename,
                   tablename, totalrecords,
                   migratedrecords, starttime, endtime, status
                  )
           VALUES (v_logmstid, v_logmstid, v_dmseqno,
                   'FAC_STAGE_DOCUMENT_MASTERLIST',
                   'FAC_CMS_DOCUMENT_MASTERLIST', mv_totalrecords,
                   mv_migratedrecords, v_starttime, SYSDATE, mv_statusflag
                  );

      INSERT INTO logmst
                  (ID, dmid, sequenceno,
                   stage_tablename,
                   tablename, totalrecords,
                   migratedrecords, starttime, endtime, status
                  )
           VALUES (v_logmstid, v_logmstid, v_dmseqno,
                   'FAC_STAGE_DOCUMENT_GLOBALLIST',
                   'FAC_CMS_DOCUMENT_GLOBALLIST', v_totalrecords,
                   v_migratedrecords, v_starttime, SYSDATE, v_statusflag
                  );
   END sp_dm_facility_document;

   PROCEDURE sp_dm_cam_document (v_ismigrated IN CHAR)
   IS
      CURSOR cr_cms_cam_document
      IS
         SELECT        *
                  FROM mig_cam_document_master
                 WHERE ismigrated = 'N'
         FOR UPDATE OF ismigrated;

      rc_cms_cam_document             cr_cms_cam_document%ROWTYPE;
      v_stage_document_globallistid   NUMBER (19);
      v_cms_document_globallistid     NUMBER (19);
      v_stage_document_masterlistid   NUMBER (19);
      v_cms_document_masterlistid     NUMBER (19);
      v_document_itemid               NUMBER (19);
      v_stage_document_itemid         NUMBER (19);
      vmtrans_from_state              VARCHAR2 (30);
      v_mtransaction_id               VARCHAR2 (30 CHAR);
   BEGIN
      v_totalrecords := 0;
      v_migratedrecords := 0;
      v_transaction_type := 'DOCITEM';
      v_transaction_subtype := 'CAM_GLOBAL_TEMPLATE';
      vtrans_from_state := 'PENDING_CREATE';

      -- Getting Sequence ID for LogMst ID.
      SELECT logmst_sq.NEXTVAL
        INTO v_logmstid
        FROM DUAL;

      -- Setting data migration sequence no.
      v_dmseqno := v_dmseqno + 1;
      -- Setting StatusFlag as Successfull by default
      v_statusflag := 'SUCCESSFULL';

      -- Setting start time for migration.
      SELECT SYSDATE
        INTO v_starttime
        FROM DUAL;

      SELECT operation
        INTO v_transopsdesc
        FROM (SELECT operation, ROWNUM AS rownum1
                FROM tr_state_matrix
               WHERE stateins = v_transaction_type
                 AND fromstate = vtrans_from_state
                 AND tostate = 'ACTIVE'
                 AND userstate = 'ACTIVE'
                 AND enableind = 1
                 AND frontendop = 1)
       WHERE rownum1 = 1;

      OPEN cr_cms_cam_document;

      LOOP
         FETCH cr_cms_cam_document
          INTO rc_cms_cam_document;

         EXIT WHEN cr_cms_cam_document%NOTFOUND;
         v_totalrecords := v_totalrecords + 1;
         v_recordstatus := v_ismigrated;
         v_errormessage := NULL;

         IF    rc_cms_cam_document.docid IS NULL
            OR TRIM (rc_cms_cam_document.docid) IS NULL
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'DOCID is null';
            v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
            v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
            v_columnname := 'DOCUMENT_CODE';
            v_datas := rc_cms_cam_document.docid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_cam_document.docid) > 10
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'DOCID Length Mismatch';
            v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
            v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
            v_columnname := 'DOCUMENT_CODE';
            v_datas := rc_cms_cam_document.docid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_cam_document.docname IS NULL
            OR TRIM (rc_cms_cam_document.docname) IS NULL
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'DOCNAME is null';
            v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
            v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
            v_columnname := 'DOCUMENT_DESCRIPTION';
            v_datas := rc_cms_cam_document.docname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_cam_document.docname) > 10
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'DOCNAME Length Mismatch';
            v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
            v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
            v_columnname := 'DOCUMENT_DESCRIPTION';
            v_datas := rc_cms_cam_document.docname;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_cam_document.doctenure IS NULL
            OR TRIM (rc_cms_cam_document.doctenure) IS NULL
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'DOCTENURE is null';
            v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
            v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
            v_columnname := 'TENURE_COUNT';
            v_datas := rc_cms_cam_document.doctenure;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_cam_document.doctenure) > 8
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'DOCTENURE Length Mismatch';
            v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
            v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
            v_columnname := 'TENURE_COUNT';
            v_datas := rc_cms_cam_document.doctenure;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_cam_document.critical IS NULL
            OR TRIM (rc_cms_cam_document.critical) IS NULL
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'CRITICAL is null';
            v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
            v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
            v_columnname := 'IS_MANDATORY';
            v_datas := rc_cms_cam_document.critical;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_cam_document.critical) > 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'CRITICAL Length Mismatch';
            v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
            v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
            v_columnname := 'IS_MANDATORY';
            v_datas := rc_cms_cam_document.critical;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF    rc_cms_cam_document.mandatory IS NULL
            OR TRIM (rc_cms_cam_document.mandatory) IS NULL
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'MANDATORY is null';
            v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
            v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
            v_columnname := 'IS_MANDATORY_FOR_BORROWER';
            v_datas := rc_cms_cam_document.mandatory;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_cam_document.mandatory) > 1
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'MANDATORY Length Mismatch';
            v_stage_tablename := 'STAGE_DOCUMENT_GLOBALLIST';
            v_tablename := 'CMS_DOCUMENT_GLOBALLIST';
            v_columnname := 'IS_MANDATORY_FOR_BORROWER';
            v_datas := rc_cms_cam_document.mandatory;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF v_recordstatus = v_ismigrated
         THEN
            SELECT stage_document_globallist_seq.NEXTVAL
              INTO v_stage_document_globallistid
              FROM DUAL;

            INSERT INTO stage_document_globallist
                        (document_id,
                         document_description,
                         document_code, CATEGORY, version_time, doc_version,
                         is_pre_approve, is_for_borrower, is_for_pledgor,
                         tenure_count, tenure_type, deprecated,
                         status
                        )
                 VALUES (v_stage_document_globallistid,
                         rc_cms_cam_document.docname,
                         rc_cms_cam_document.docid, 'S', v_version, 0,
                         'N', 'N', 'N',
                         rc_cms_cam_document.doctenure, 1, v_deprecated,
                         v_status
                        );

            SELECT cms_document_globallist_seq.NEXTVAL
              INTO v_cms_document_globallistid
              FROM DUAL;

            INSERT INTO cms_document_globallist
                        (document_id,
                         document_description,
                         document_code, CATEGORY, version_time, doc_version,
                         is_pre_approve, is_for_borrower, is_for_pledgor,
                         tenure_count, tenure_type, deprecated,
                         status
                        )
                 VALUES (v_cms_document_globallistid,
                         rc_cms_cam_document.docname,
                         rc_cms_cam_document.docid, 'S', v_version, 0,
                         'N', 'N', 'N',
                         rc_cms_cam_document.doctenure, 1, v_deprecated,
                         v_status
                        );

            SELECT    TO_CHAR (SYSDATE, 'YYYYMMDD')
                   || '00000'
                   || (MAX (TO_NUMBER (SUBSTR (transaction_id, 14))) + 1)
              INTO v_transaction_id
              FROM TRANSACTION;

            INSERT INTO TRANSACTION
                        (transaction_id, from_state, user_id,
                         login_id, transaction_type, creation_date,
                         transaction_date, reference_id,
                         status, staging_reference_id,
                         team_id, VERSION, opsdesc,
                         user_info,
                         cur_trx_history_id, team_type_id,
                         transaction_subtype, team_membership_id
                        )
                 VALUES (v_transaction_id, vtrans_from_state, v_user_id,
                         v_login_id, v_transaction_type, v_app_date,
                         v_app_date, v_cms_document_globallistid,
                         vtrans_status, v_stage_document_globallistid,
                         v_team_id, vtrans_version, v_transopsdesc,
                         v_user_name || ' ( ' || v_login_id || ' )',
                         v_transaction_id, v_team_type_id,
                         v_transaction_subtype, v_team_membership_id
                        );

            SELECT COUNT (1)
              INTO v_count
              FROM cms_document_masterlist
             WHERE UPPER (CATEGORY) = 'CAM';

            IF v_count = 0
            THEN
               SELECT stage_document_masterlist_seq.NEXTVAL
                 INTO v_stage_document_masterlistid
                 FROM DUAL;

               INSERT INTO stage_document_masterlist
                           (masterlist_id, country_iso_code, CATEGORY,
                            security_sub_type_id, security_type_id,
                            version_time
                           )
                    VALUES (v_stage_document_masterlistid, 'IN', 'CAM',
                            'CAM', 'CAM',
                            v_version
                           );

               SELECT cms_document_masterlist_seq.NEXTVAL
                 INTO v_cms_document_masterlistid
                 FROM DUAL;

               INSERT INTO cms_document_masterlist
                           (masterlist_id, country_iso_code, CATEGORY,
                            security_sub_type_id, security_type_id,
                            version_time
                           )
                    VALUES (v_cms_document_masterlistid, 'IN', 'CAM',
                            'CAM', 'CAM',
                            v_version
                           );

               SELECT    TO_CHAR (SYSDATE, 'YYYYMMDD')
                      || '00000'
                      || (MAX (TO_NUMBER (SUBSTR (transaction_id, 14))) + 1)
                 INTO v_mtransaction_id
                 FROM TRANSACTION;

               INSERT INTO TRANSACTION
                           (transaction_id, from_state, user_id,
                            login_id, transaction_type, creation_date,
                            transaction_date, reference_id,
                            status, staging_reference_id,
                            team_id, VERSION, remarks, trx_reference_id,
                            opsdesc, legal_name, legal_id, customer_name,
                            customer_id, trx_origin_country,
                            trx_origin_organisation, limit_profile_id,
                            limit_profile_ref_num, trx_segment,
                            user_info,
                            cur_trx_history_id, team_type_id,
                            transaction_subtype, to_group_type_id,
                            to_group_id, to_user_id, deal_no,
                            team_membership_id
                           )
                    VALUES (v_mtransaction_id, vmtrans_from_state, v_user_id,
                            v_login_id, 'TEMPLATE', v_app_date,
                            v_app_date, v_cms_document_masterlistid,
                            'PENDING_UPDATE', v_stage_document_masterlistid,
                            v_team_id, 1316697731950, NULL, -999999999,
                            'UPDATE_TEMPLATE', NULL, NULL, NULL,
                            -999999999, '--',
                            '--', -999999999,
                            NULL, '--',
                            v_user_name || ' ( ' || v_login_id || ' )',
                            v_mtransaction_id, v_team_type_id,
                            NULL, '-999999999',
                            -999999999, -999999999, NULL,
                            v_team_membership_id
                           );
            ELSE
               SELECT MIN (masterlist_id)
                 INTO v_cms_document_masterlistid
                 FROM cms_document_masterlist
                WHERE UPPER (CATEGORY) = 'CAM';
            END IF;

            SELECT stg_document_item_seq.NEXTVAL
              INTO v_stage_document_itemid
              FROM DUAL;

            INSERT INTO stage_document_item
                        (doc_item_id,
                         doc_description, in_vault, in_ext_custody,
                         is_mandatory,
                         is_mandatory_for_borrower, is_mandatory_for_pledgor,
                         is_audit, is_deleted, masterlist_id,
                         document_id,
                         document_code, doc_version, with_title,
                         is_property_completed, without_title,
                         under_construction, new_with_fbr, new_without_fbr,
                         used_with_fbr, used_without_fbr, is_pre_approve,
                         is_for_borrower, is_for_pledgor, tenure_count,
                         tenure_type, is_mandatory_display
                        )
                 VALUES (v_stage_document_itemid,
                         rc_cms_cam_document.docname, 'N', 'N',
                         rc_cms_cam_document.critical,
                         rc_cms_cam_document.mandatory, 'N',
                         'N', 'N', v_cms_document_masterlistid,
                         v_cms_document_globallistid,
                         rc_cms_cam_document.docid, 0, 0,
                         0, 0,
                         0, 0, 0,
                         0, 0, 'N',
                         'N', 'N', rc_cms_cam_document.doctenure,
                         1, 'N'
                        );

            SELECT document_item_seq.NEXTVAL
              INTO v_document_itemid
              FROM DUAL;

            INSERT INTO cms_document_item
                        (doc_item_id, doc_description, in_vault,
                         in_ext_custody, is_mandatory,
                         is_mandatory_for_borrower, is_mandatory_for_pledgor,
                         is_audit, is_deleted, masterlist_id,
                         document_id,
                         document_code, doc_version, with_title,
                         is_property_completed, without_title,
                         under_construction, new_with_fbr, new_without_fbr,
                         used_with_fbr, used_without_fbr, is_pre_approve,
                         is_for_borrower, is_for_pledgor, tenure_count,
                         tenure_type, is_mandatory_display
                        )
                 VALUES (v_document_itemid, rc_cms_cam_document.docname, 'N',
                         'N', rc_cms_cam_document.critical,
                         rc_cms_cam_document.mandatory, 'N',
                         'N', 'N', v_cms_document_masterlistid,
                         v_cms_document_globallistid,
                         rc_cms_cam_document.docid, 0, 0,
                         0, 0,
                         0, 0, 0,
                         0, 0, 'N',
                         'N', 'N', rc_cms_cam_document.doctenure,
                         1, 'N'
                        );

            -- Updating ID and Flag in migration database.
            UPDATE mig_cam_document_master
               SET ismigrated = v_recordstatus,
                   stage_idmig = v_stage_document_globallistid,
                   idmig = v_cms_document_globallistid,
                   trans_idmig = v_transaction_id
             WHERE CURRENT OF cr_cms_cam_document;

            v_migratedrecords := v_migratedrecords + 1;
         ELSE
            -- Found error for record
            v_statusflag := 'ERROR';

            -- Updating Flag in migration database.
            UPDATE mig_cam_document_master
               SET ismigrated = v_recordstatus
             WHERE CURRENT OF cr_cms_cam_document;
         END IF;
      END LOOP;

      CLOSE cr_cms_cam_document;

      -- Logging  Migration Details
      INSERT INTO logmst
                  (ID, dmid, sequenceno,
                   stage_tablename,
                   tablename, totalrecords,
                   migratedrecords, starttime, endtime, status
                  )
           VALUES (v_logmstid, v_logmstid, v_dmseqno,
                   'CAM_STAGE_DOCUMENT_GLOBALLIST_CAM',
                   'CAM_CMS_DOCUMENT_GLOBALLIST_CAM', v_totalrecords,
                   v_migratedrecords, v_starttime, SYSDATE, v_statusflag
                  );
   END sp_dm_cam_document;
END pkg_climsmigration; 
/


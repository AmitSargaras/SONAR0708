CREATE OR REPLACE PACKAGE HDFC_MIG_CLIMS.pkg_climstranmigration
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

     PROCEDURE sp_dm_Party_sfcr (v_ismigrated IN CHAR);
  
END pkg_climstranmigration; 
/

CREATE OR REPLACE PACKAGE BODY HDFC_MIG_CLIMS.pkg_climstranmigration
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
      pkg_climstranmigration.sp_settingbasicdata;
      pkg_climstranmigration.sp_dm_party_sfcr (v_ismigrated);
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
      SELECT logdet_sq.NEXTVAL@climsmig
        INTO v_logdetid
        FROM DUAL@climsmig;

      INSERT INTO logdet@climsmig
                  (ID, logmstid, recordno, errordesc,
                   stage_tablename, tablename, columnname, datas
                  )
           VALUES (v_logdetid, v_logmstid, v_totalrecords, v_errordesc,
                   v_stage_tablename, v_tablename, v_columnname, v_datas
                  );
   END sp_dm_insertlogdetails;

   PROCEDURE sp_dm_party_sfcr (v_ismigrated IN CHAR)
   IS
      CURSOR cr_cms_party_summary
      IS
         SELECT        *
                  FROM mig_party_summarydetails@climsmig
                 WHERE ismigrated = 'N'
         FOR UPDATE OF ismigrated;

      rc_cms_party_summary     cr_cms_party_summary%ROWTYPE;

      CURSOR cr_cms_party_financial (c_ptyid VARCHAR2)
      IS
         SELECT        *
                  FROM mig_party_financialdetails@climsmig
                 WHERE ptyid = c_ptyid AND ismigrated = 'N'
         FOR UPDATE OF ismigrated;

      rc_cms_party_financial   cr_cms_party_financial%ROWTYPE;

      CURSOR cr_cms_party_cibil (c_ptyid VARCHAR2)
      IS
         SELECT        *
                  FROM mig_party_cibil@climsmig
                 WHERE ptyid = c_ptyid AND ismigrated = 'N'
         FOR UPDATE OF ismigrated;

      rc_cms_party_cibil       cr_cms_party_cibil%ROWTYPE;

      CURSOR cr_cms_party_regoff (c_ptyid VARCHAR2)
      IS
         SELECT        *
                  FROM mig_party_regoffice_details@climsmig
                 WHERE ptyid = c_ptyid AND ismigrated = 'N'
         FOR UPDATE OF ismigrated;

      rc_cms_party_regoff      cr_cms_party_regoff%ROWTYPE;
      cms_stage_ptyid          NUMBER (19);
      cms_ptyid                NUMBER (19);
   BEGIN
      v_totalrecords := 0;
      v_migratedrecords := 0;
      v_transaction_type := 'CUSTOMER';
      vtrans_from_state := 'PENDING_UPDATE';

      -- Getting Sequence ID for LogMst ID.
      SELECT logmst_sq.NEXTVAL@climsmig
        INTO v_logmstid
        FROM DUAL@climsmig;

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

      OPEN cr_cms_party_summary;

      LOOP
         FETCH cr_cms_party_summary
          INTO rc_cms_party_summary;

         EXIT WHEN cr_cms_party_summary%NOTFOUND;
         v_totalrecords := v_totalrecords + 1;
         v_recordstatus := v_ismigrated;
         v_errormessage := NULL;

         IF    rc_cms_party_summary.ptyid IS NULL
            OR TRIM (rc_cms_party_summary.ptyid) IS NULL
            OR TRIM (rc_cms_party_summary.ptyid) = 'NULL'
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'PTYID is null';
            v_stage_tablename := 'STAGE_SCI_LE_MAIN_PROFILE';
            v_tablename := 'SCI_LE_MAIN_PROFILE';
            v_columnname := 'LMP_LE_ID';
            v_datas := rc_cms_party_summary.ptyid;
            pkg_climsmigration.sp_dm_insertlogdetails (v_totalrecords,
                                                       v_errormessage,
                                                       v_logmstid,
                                                       v_stage_tablename,
                                                       v_tablename,
                                                       v_columnname,
                                                       v_datas
                                                      );
         END IF;

         IF LENGTH (rc_cms_party_summary.ptyid) > 10
         THEN
            v_recordstatus := 'E';
            v_errormessage := NULL;
            v_errormessage := 'PTYID Length Mismatch';
            v_stage_tablename := 'STAGE_SCI_LE_MAIN_PROFILE';
            v_tablename := 'SCI_LE_MAIN_PROFILE';
            v_columnname := 'LMP_LE_ID';
            v_datas := rc_cms_party_summary.ptyid;
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
                      /*   SELECT cms_stage_forex_seq.NEXTVAL
                          INTO cms_stage_forexid
                          FROM DUAL;

                       INSERT INTO cms_stage_forex
                                    (feed_id, buy_currency,
                                     sell_currency,
                                     buy_rate,
                                     currency_description,
                                     currency_iso_code
                                    )
                             VALUES (cms_stage_forexid, rc_cms_party_summary.ccymbcode,
                                     rc_cms_party_summary.ccymbcode,
                                     rc_cms_party_summary.ccyrate,
                                     rc_cms_party_summary.ccydesc,
                                     rc_cms_party_summary.ccycode
                                    );
            */
            
           select AUTOIDGENERATION('TRANSACTION','TRANSACTION_ID') INTO v_transaction_id from dual;
            
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
                         v_app_date, cms_ptyid, vtrans_status,
                         cms_stage_ptyid, v_team_id, vtrans_version,
                         v_transopsdesc,
                         v_user_name || ' ( ' || v_login_id || ' )',
                         v_transaction_id, v_team_type_id,
                         v_team_membership_id
                        );

            -- Updating ID and Flag in migration database.
            UPDATE mig_party_summarydetails@climsmig
               SET ismigrated = v_recordstatus,
                   stage_idmig = cms_stage_ptyid,
                   idmig = cms_ptyid,
                   trans_idmig = v_transaction_id
             WHERE CURRENT OF cr_cms_party_summary;

            v_migratedrecords := v_migratedrecords + 1;
         ELSE
            -- Found error for record
            v_statusflag := 'ERROR';

            -- Updating  Flag in migration database.
            UPDATE mig_party_summarydetails@climsmig
               SET ismigrated = v_recordstatus
             WHERE CURRENT OF cr_cms_party_summary;
         END IF;
      END LOOP;

      CLOSE cr_cms_party_summary;

      -- Logging  Migration Details
      INSERT INTO logmst@climsmig
                  (ID, dmid, sequenceno,
                   stage_tablename, tablename,
                   totalrecords, migratedrecords, starttime, endtime,
                   status
                  )
           VALUES (v_logmstid, v_logmstid, v_dmseqno,
                   'STAGE_SCI_LE_MAIN_PROFILE', 'SCI_LE_MAIN_PROFILE',
                   v_totalrecords, v_migratedrecords, v_starttime, SYSDATE,
                   v_statusflag
                  );
   END sp_dm_party_sfcr;
END pkg_climstranmigration; 
/


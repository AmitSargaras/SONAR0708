SET SERVEROUTPUT ON SIZE 999999;
SPOOL update_col_chrg_details.log;

DECLARE
   coll_info   cms_security.rpt_collateral_particulars%TYPE;
   chg_info    cms_security.rpt_charge_details%TYPE;
   asql        VARCHAR2 (255)
      := 'UPDATE cms_security SET rpt_collateral_particulars = NULL, rpt_charge_details = NULL';
BEGIN
   /* Delete value of columns rpt_collateral_particulars, rpt_charge_details of cms_security */
   EXECUTE IMMEDIATE asql;

   /* main loop - loop thru all securities */

   /*  for subtypes under asset based and insurance,
          the details varies for each subtype.
    rest of the subtypes have common behaviour */
   FOR rec IN (SELECT sec.cms_collateral_id, stype.security_type_id,
                      stype.security_sub_type_id
                 FROM cms_security sec, cms_security_sub_type stype
                WHERE sec.security_sub_type_id = stype.security_sub_type_id)
   LOOP
      BEGIN
         IF (rec.security_type_id = pkg_security_types.c_asset_type)
         THEN
            coll_info :=
               pkg_audit.get_asset_details (rec.cms_collateral_id,
                                            rec.security_sub_type_id
                                           );
         ELSIF (rec.security_type_id = pkg_security_types.c_cash_type)
         THEN
            coll_info := pkg_audit.get_cash_details (rec.cms_collateral_id);
         ELSIF (rec.security_type_id = pkg_security_types.c_commodity_type)
         THEN
            coll_info :=
                      pkg_audit.get_commodity_details (rec.cms_collateral_id);
         ELSIF (rec.security_type_id = pkg_security_types.c_document_type)
         THEN
            coll_info :=
                       pkg_audit.get_document_details (rec.cms_collateral_id);
         ELSIF (rec.security_type_id = pkg_security_types.c_guarantee_type)
         THEN
            coll_info :=
                      pkg_audit.get_guarantee_details (rec.cms_collateral_id);
         ELSIF (rec.security_type_id = pkg_security_types.c_insurance_type)
         THEN
            coll_info :=
               pkg_audit.get_insurance_details (rec.cms_collateral_id,
                                                rec.security_sub_type_id
                                               );
         ELSIF (rec.security_type_id = pkg_security_types.c_property_type)
         THEN
            coll_info :=
                       pkg_audit.get_property_details (rec.cms_collateral_id);
         ELSIF (rec.security_type_id = pkg_security_types.c_mktsec_type)
         THEN
            coll_info :=
                        pkg_audit.get_mkt_sec_details (rec.cms_collateral_id);
         ELSIF (rec.security_type_id = pkg_security_types.c_others_type)
         THEN
            coll_info := pkg_audit.get_other_details (rec.cms_collateral_id);
         END IF;

         chg_info := pkg_audit.get_charge_details (rec.cms_collateral_id);

         UPDATE cms_security
            SET rpt_collateral_particulars = coll_info,
                rpt_charge_details = chg_info
          WHERE cms_collateral_id = rec.cms_collateral_id;
      EXCEPTION
         WHEN OTHERS
         THEN
            DBMS_OUTPUT.ENABLE;
            DBMS_OUTPUT.PUT_LINE ('** EXCEPTION ** sqlcode ' || SQLCODE);
            DBMS_OUTPUT.PUT_LINE ('sqlmsg ' || SQLERRM);
            DBMS_OUTPUT.PUT_LINE (   'cms_collateral_id: '
                                  || rec.cms_collateral_id
                                 );
      END;
   END LOOP;
END;
/

SPOOL OFF;
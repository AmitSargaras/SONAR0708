Create Table Day_Zero_Mig_Emp_Grade_user
(Employee_Grade Varchar2(50),
Override_Exc_Loa Char(1),
User_Name Varchar2(50 Char),
Employee_Id Varchar2(20 Char),
Login_Id Varchar2(20 Char),
Cms_Usr_Id Number(19),
Stg_Usr_Id Number(19),
Membership_Name Varchar2(100 Char),
Status Char(1) Default 'P'
);

Create Table Day_Zero_Mig_Emp_Grade_Fac(
Line_Exclude_From_Loa Char(1),
New_Facility_Code Varchar2(300 Char) ,
New_Facility_Name Varchar2(300 Char) ,
New_Facility_Type Varchar2(300 Char) ,
Fac_Master_Id  Number(38),
Stg_Fac_Master_Id  NUMBER(38),
Status Char(1) Default 'P'
);


Create Table Day_Zero_Mig_Emp_Grade_Loa_Master_Master(
Employee_Grade	VARCHAR2(50 CHAR),  
segment VARCHAR2(50 CHAR),
Limit_Release_Amt Number(24,2),
Total_Sanctioned_Limit Number (32,2),
Property_Valuation_amt  Number (22,2),
Fd_Amount           Number(17,2),
Drawing_Power       Number(17,2),
Sblc_Security_Omv Number(17,2),
facility_cam_covenant char(1) ,
Status Char(1) Default 'P'
);


create or replace 
procedure sp_mig_emp_grade_user  as
V_Status Char(1);
V_Ref_Id Number(19);
V_Stage_Id Number(19);

CURSOR CR_DATA IS select * from Day_Zero_Mig_Emp_Grade_user where status = 'P' for update of status;
RC_DATA CR_DATA%ROWTYPE;
begin 
open cr_data;
  loop
   FETCH CR_DATA INTO RC_DATA;
      EXIT WHEN CR_DATA%NOTFOUND;
      
      V_Ref_Id := Rc_Data.CMS_USR_ID;
      V_Stage_Id := Null;
      V_Status := 'F';
      
                 
      if V_Ref_Id is not null then
      
        Select Staging_Reference_Id Into V_Stage_Id From Transaction Where Reference_Id = V_Ref_Id And Transaction_Type = 'USER'
        and status ='ACTIVE';
      
        Update Cms_User Set 
          Employee_Grade = Rc_Data.Employee_Grade ,
          OVERRIDE_EXC_LOA = Rc_Data.OVERRIDE_EXC_LOA
          Where USER_ID = V_Ref_Id;
        
        Update Stage_User Set 
          Employee_Grade = Rc_Data.Employee_Grade ,
          Override_Exc_Loa = Rc_Data.Override_Exc_Loa
          Where USER_ID = V_Stage_Id;
      
       v_status := 'S';  
      end if;
      update Day_Zero_Mig_Emp_Grade_user set status = v_status where current of CR_DATA;
    END LOOP;
    close CR_DATA;
    Commit;
end sp_mig_emp_grade_user;
/


create or replace 
procedure sp_mig_emp_grade_fac  as
V_Status Char(1);
V_Ref_Id Number(19);
V_Stage_Id Number(19);

CURSOR CR_DATA IS select * from Day_Zero_Mig_Emp_Grade_Fac where status = 'P' for update of status;
RC_DATA CR_DATA%ROWTYPE;
begin 
open cr_data;
  loop
   FETCH CR_DATA INTO RC_DATA;
      EXIT WHEN CR_DATA%NOTFOUND;
      
      V_Ref_Id := Rc_Data.FAC_MASTER_ID;
      V_Stage_Id := Null;
      V_Status := 'F';
              
      if V_Ref_Id is not null then
      
        Select Staging_Reference_Id Into V_Stage_Id From Transaction Where Reference_Id = V_Ref_Id And Transaction_Type = 'FACILITY_NEW_MASTER'
        and status ='ACTIVE';
                         
        Update Cms_Facility_New_Master Set LINE_EXCLUDE_FROM_LOA = Rc_Data.LINE_EXCLUDE_FROM_LOA Where ID = V_Ref_Id;
        update Cms_stage_Facility_New_Master set LINE_EXCLUDE_FROM_LOA = Rc_Data.LINE_EXCLUDE_FROM_LOA where ID = V_Stage_Id;
      
       v_status := 'S';  
      end if;
      update Day_Zero_Mig_Emp_Grade_Fac set status = v_status where current of CR_DATA;
    END LOOP;
    close CR_DATA;
    Commit;
end sp_mig_emp_grade_fac;
/



create or replace procedure pro_loa_master_emp_grade  as
V_Status Char(1);
V_Ref_Id Number(19);
v_stg_id Number(19);
V_Trx_Id Number(19);
V_Trx_Hist_Id Number(19);
V_Emp_Grade varchar(50);V_Emp_Grade_Allowed varchar(50);V_Emp_Grade_All varchar(50);
V_Sequence Number(5);min_ros Number(5);max_ros Number(5);
V_Common_Cat Number(5);dup_count Number(5);
r_count Number(5);Neg_Value char(1);
l_lra Number(24,2);u_lra Number(24,2);
l_tsl Number(32,2);u_tsl Number(32,2);
l_pva Number(22,2);u_pva Number(22,2);
l_fa Number(17,2);u_fa Number(17,2);
l_dp Number(17,2);u_dp Number(17,2);
l_sso Number(17,2);u_sso Number(17,2);
lra char(1);tsl char(1);pva char(1);
fa char(1);dp char(1);sso char(1);
reason varchar(4000);reason_for_fail_amt1 varchar(4000);
reason_for_fail_amt2 varchar(4000);reason_for_fail_amt3 varchar(4000);
      
CURSOR CR_DATA IS select * from Day_Zero_Mig_Emp_Grade_Loa where status = 'P' for update of status;
RC_DATA CR_DATA%ROWTYPE;
begin 
open cr_data;
  loop
   FETCH CR_DATA INTO RC_DATA;
      EXIT WHEN CR_DATA%NOTFOUND;
      
	V_Sequence := null;
  V_Ref_Id := null;
  v_stg_id := null;
  V_Status := 'F';
  Neg_Value := 'F';	reason:=''; 
	lra:='F'; tsl:='F'; pva:='F';
	fa:='F'; dp:='F'; sso:='F';
	reason_for_fail_amt1 :=null;
	reason_for_fail_amt2 :=null;
	reason_for_fail_amt3 :=null;
	
	  
	begin
        select count(*) into r_count from cms_loa_master;
    end;    
    begin    
        select EMPLOYEE_GRADE into V_Emp_Grade from Cms_Loa_Master where EMPLOYEE_GRADE=Rc_Data.Employee_Grade and DEPRECATED='N' and STATUS='ACTIVE' fetch first 1 row only;
        exception when NO_DATA_FOUND then V_Emp_Grade := null; 	
    end;
    begin    
        select EMPLOYEE_GRADE into V_Emp_Grade_All from Cms_Loa_Master where EMPLOYEE_GRADE=Rc_Data.Employee_Grade and Segment='ALL' and DEPRECATED='N' and STATUS='ACTIVE' fetch first 1 row only;
        exception when NO_DATA_FOUND then V_Emp_Grade_All := null; 	
    end;
    begin
        select COUNT(entry_code) into V_Common_Cat from COMMON_CODE_CATEGORY_ENTRY where CATEGORY_CODE='HDFC_SEGMENT' and ACTIVE_STATUS='1' and  entry_code=Rc_Data.Segment fetch first 1 row only;
        exception when NO_DATA_FOUND then V_Common_Cat := null; 
	end;		
      
	BEGIN
		CASE RC_DATA.EMPLOYEE_GRADE
			WHEN 'E1' THEN V_Sequence :=1;
			WHEN 'E2' THEN V_Sequence :=2;
			WHEN 'E3' THEN V_Sequence :=3;
			WHEN 'E4' THEN V_Sequence :=4;
			WHEN 'D1' THEN V_Sequence :=5;
			WHEN 'D2' THEN V_Sequence :=6;
			WHEN 'D3' THEN V_Sequence :=7;
			WHEN 'D4' THEN V_Sequence :=8;
			WHEN 'D5' THEN V_Sequence :=9;
			WHEN 'C1' THEN V_Sequence :=10;
			WHEN 'C2' THEN V_Sequence :=11;
			WHEN 'GH' THEN V_Sequence :=12;
			ELSE V_Sequence :=null;
		END CASE;	
	END;
-------------------------------------------------TO RETRIVE LOWER AND UPPER ROW TO HANDLE AMOUNT VALIDATION-----------------------------------------------  
    begin 
		select max(RANKING_OF_SEQUENCE) into max_ros from cms_loa_master where RANKING_OF_SEQUENCE<V_Sequence;
		exception when NO_DATA_FOUND then max_ros:=null;
    end; 
    
    begin
		select min(RANKING_OF_SEQUENCE) into min_ros from cms_loa_master where RANKING_OF_SEQUENCE>V_Sequence;
		exception when NO_DATA_FOUND then min_ros:=null;
    end;
 -------------------------------------------------FOR PURPOSE OF HANDLING AMOUNT VALIDATIONS-------------------------------------------------------------
		
    begin
<<<<<<< .working
      if max_ros is not null then
        begin
        select MAX(LIMIT_RELEASE_AMT) into l_lra from CMS_LOA_MASTER where RANKING_OF_SEQUENCE=max_ros AND SEGMENT=Rc_Data.Segment;
        exception when NO_DATA_FOUND then l_lra:=0;
        end;
        begin
        select MAX(TOTAL_SANCTIONED_LIMIT) into l_tsl from CMS_LOA_MASTER where RANKING_OF_SEQUENCE=max_ros AND SEGMENT=Rc_Data.Segment;
        exception when NO_DATA_FOUND then l_tsl:=0;
        end;
        begin
        select MAX(PROPERTY_VALUATION_AMT) into l_pva from CMS_LOA_MASTER where RANKING_OF_SEQUENCE=max_ros AND SEGMENT=Rc_Data.Segment;
        exception when NO_DATA_FOUND then l_pva:=0;
        end;
        begin
        select MAX(FD_AMOUNT) into l_fa from CMS_LOA_MASTER where RANKING_OF_SEQUENCE=max_ros AND SEGMENT=Rc_Data.Segment;
        exception when NO_DATA_FOUND then l_fa:=0;
        end;
        begin
        select MAX(DRAWING_POWER) into l_dp from CMS_LOA_MASTER where RANKING_OF_SEQUENCE=max_ros AND SEGMENT=Rc_Data.Segment;
        exception when NO_DATA_FOUND then l_dp:=0;
        end;
        begin
        select MAX(SBLC_SECURITY_OMV) into l_sso from CMS_LOA_MASTER where RANKING_OF_SEQUENCE=max_ros AND SEGMENT=Rc_Data.Segment;
        exception when NO_DATA_FOUND then l_sso:=0;
        end;
        dbms_output.put_line('LOWER ROW=> '||l_lra ||':'|| l_tsl ||':'|| l_pva ||':'|| l_fa ||':'|| l_dp ||':'|| l_sso);
      else
        l_lra:=0;l_tsl:=0;l_pva:=0;l_fa:=0;l_dp:=0;l_sso:=0;
=======
		if max_ros is not null then
			begin
			select MAX(LIMIT_RELEASE_AMT) into l_lra from CMS_LOA_MASTER where RANKING_OF_SEQUENCE=max_ros;
			exception when NO_DATA_FOUND then l_lra:=0;
			end;
			begin
			select MAX(TOTAL_SANCTIONED_LIMIT) into l_tsl from CMS_LOA_MASTER where RANKING_OF_SEQUENCE=max_ros;
			exception when NO_DATA_FOUND then l_tsl:=0;
			end;
			begin
			select MAX(PROPERTY_VALUATION_AMT) into l_pva from CMS_LOA_MASTER where RANKING_OF_SEQUENCE=max_ros;
			exception when NO_DATA_FOUND then l_pva:=0;
			end;
			begin
			select MAX(FD_AMOUNT) into l_fa from CMS_LOA_MASTER where RANKING_OF_SEQUENCE=max_ros;
			exception when NO_DATA_FOUND then l_fa:=0;
			end;
			begin
			select MAX(DRAWING_POWER) into l_dp from CMS_LOA_MASTER where RANKING_OF_SEQUENCE=max_ros;
			exception when NO_DATA_FOUND then l_dp:=0;
			end;
			begin
			select MAX(SBLC_SECURITY_OMV) into l_sso from CMS_LOA_MASTER where RANKING_OF_SEQUENCE=max_ros;
			exception when NO_DATA_FOUND then l_sso:=0;
			end;
		else
			l_lra:=0;l_tsl:=0;l_pva:=0;l_fa:=0;l_dp:=0;l_sso:=0;
>>>>>>> .merge-right.r17372
    end if;
    end;
    begin
<<<<<<< .working
      if min_ros is not null then
        begin
        select MIN(LIMIT_RELEASE_AMT) into u_lra from CMS_LOA_MASTER where RANKING_OF_SEQUENCE=max_ros AND SEGMENT=Rc_Data.Segment;
        exception when NO_DATA_FOUND then u_lra:=0;
        end;
        begin
        select MIN(TOTAL_SANCTIONED_LIMIT) into u_tsl from CMS_LOA_MASTER where RANKING_OF_SEQUENCE=max_ros AND SEGMENT=Rc_Data.Segment;
        exception when NO_DATA_FOUND then u_tsl:=0;
        end;
        begin
        select MIN(PROPERTY_VALUATION_AMT) into u_pva from CMS_LOA_MASTER where RANKING_OF_SEQUENCE=max_ros AND SEGMENT=Rc_Data.Segment;
        exception when NO_DATA_FOUND then u_pva:=0;
        end;
        begin
        select MIN(FD_AMOUNT) into u_fa from CMS_LOA_MASTER where RANKING_OF_SEQUENCE=max_ros AND SEGMENT=Rc_Data.Segment;
        exception when NO_DATA_FOUND then u_fa:=0;
        end;
        begin
        select MIN(DRAWING_POWER) into u_dp from CMS_LOA_MASTER where RANKING_OF_SEQUENCE=max_ros AND SEGMENT=Rc_Data.Segment;
        exception when NO_DATA_FOUND then u_dp:=0;
        end;
        begin
        select MIN(SBLC_SECURITY_OMV) into u_sso from CMS_LOA_MASTER where RANKING_OF_SEQUENCE=max_ros AND SEGMENT=Rc_Data.Segment;
        exception when NO_DATA_FOUND then u_sso:=0;
        end;
        dbms_output.put_line('UPPER ROW=> '||u_lra ||':'|| u_tsl ||':'|| u_pva ||':'|| u_fa ||':'|| u_dp ||':'|| u_sso);
      else
        u_lra:=0;u_tsl:=0;u_pva:=0;u_fa:=0;u_dp:=0;u_sso:=0;
      end if;
=======
        if min_ros is not null then
			begin
			select MIN(LIMIT_RELEASE_AMT) into u_lra from CMS_LOA_MASTER where RANKING_OF_SEQUENCE=min_ros;
			exception when NO_DATA_FOUND then u_lra:=0;
			end;
			begin
			select MIN(TOTAL_SANCTIONED_LIMIT) into u_tsl from CMS_LOA_MASTER where RANKING_OF_SEQUENCE=min_ros;
			exception when NO_DATA_FOUND then u_tsl:=0;
			end;
			begin
			select MIN(PROPERTY_VALUATION_AMT) into u_pva from CMS_LOA_MASTER where RANKING_OF_SEQUENCE=min_ros;
			exception when NO_DATA_FOUND then u_pva:=0;
			end;
			begin
			select MIN(FD_AMOUNT) into u_fa from CMS_LOA_MASTER where RANKING_OF_SEQUENCE=min_ros;
			exception when NO_DATA_FOUND then u_fa:=0;
			end;
			begin
			select MIN(DRAWING_POWER) into u_dp from CMS_LOA_MASTER where RANKING_OF_SEQUENCE=min_ros;
			exception when NO_DATA_FOUND then u_dp:=0;
			end;
			begin
			select MIN(SBLC_SECURITY_OMV) into u_sso from CMS_LOA_MASTER where RANKING_OF_SEQUENCE=min_ros;
			exception when NO_DATA_FOUND then u_sso:=0;
			end;
	    else
			u_lra:=0;u_tsl:=0;u_pva:=0;u_fa:=0;u_dp:=0;u_sso:=0;
		end if;
>>>>>>> .merge-right.r17372
    end;
<<<<<<< .working
-----------------------------------TO HANDLE NULL VALUES FOR COMPARISION------------------------------------------------------------------------------------------
begin
if l_lra is null then l_lra:=0;end if;  if u_lra is null then u_lra:=0;end if;
if l_tsl is null then l_tsl:=0;end if;  if u_tsl is null then u_tsl:=0;end if;
if l_pva is null then l_pva:=0;end if;  if u_pva is null then u_pva:=0;end if;
if l_fa is null then l_fa:=0;end if;    if u_fa is null then u_fa:=0;end if;
if l_dp is null then l_dp:=0;end if;    if u_dp is null then u_dp:=0;end if;
if l_sso is null then l_sso:=0;end if;  if u_sso is null then u_sso:=0;end if;
end;
=======
--------------------------------------------------TO HANDLE NULL VALUES FOR COMPARISION----------------------------------------------------------------------------
	begin
		if l_lra is null then l_lra:=0;end if;  if u_lra is null then u_lra:=0;end if;
		if l_tsl is null then l_tsl:=0;end if;  if u_tsl is null then u_tsl:=0;end if;
		if l_pva is null then l_pva:=0;end if;  if u_pva is null then u_pva:=0;end if;
		if l_fa is null then l_fa:=0;end if;    if u_fa is null then u_fa:=0;end if;
		if l_dp is null then l_dp:=0;end if;    if u_dp is null then u_dp:=0;end if;
		if l_sso is null then l_sso:=0;end if;  if u_sso is null then u_sso:=0;end if;
	end;
>>>>>>> .merge-right.r17372
--------------------------------------FOR PURPOSE OF HANDLE DUPLICATE RECORDS--------------------------------------------------------------------------------------
	begin      
		select count(1) into dup_count from cms_loa_master where LIMIT_RELEASE_AMT=Rc_Data.LIMIT_RELEASE_AMT and TOTAL_SANCTIONED_LIMIT=Rc_Data.TOTAL_SANCTIONED_LIMIT 
		and EMPLOYEE_GRADE=Rc_Data.EMPLOYEE_GRADE and PROPERTY_VALUATION_AMT=Rc_Data.PROPERTY_VALUATION_AMT and FD_AMOUNT=Rc_Data.FD_AMOUNT 
		and DRAWING_POWER=Rc_Data.DRAWING_POWER and SBLC_SECURITY_OMV=Rc_Data.SBLC_SECURITY_OMV and SEGMENT=Rc_Data.SEGMENT and RANKING_OF_SEQUENCE=V_Sequence; 
	end;
  
  if(dup_count>0) then
		reason:='DUPLICATE RECORD;';
  end if;  
--------------------------------------TO HANDLE AMOUNTS VALIDATION------------------------------------------------------------------------------------------------
if r_count!=0 then
if max_ros is null and min_ros is not null then
	if  Rc_Data.LIMIT_RELEASE_AMT<=u_lra then
		lra:='P';
	else
		lra:='F';
		reason_for_fail_amt1:=reason_for_fail_amt1 ||'LIMIT_RELEASE_AMT AMOUNT SHOULD BE <= '||u_lra||';';
	end if;	
	if Rc_Data.TOTAL_SANCTIONED_LIMIT<=u_tsl then
		tsl:='P';
	else
		tsl:='F';
		reason_for_fail_amt1:=reason_for_fail_amt1 ||' TOTAL_SANCTIONED_LIMIT AMOUNT SHOULD BE <= '||u_tsl||';';
	end if;
	if Rc_Data.PROPERTY_VALUATION_AMT<=u_pva then
		pva:='P';
	else 
		pva:='F';
		reason_for_fail_amt1:=reason_for_fail_amt1 ||' PROPERTY_VALUATION_AMT AMOUNT SHOULD BE <= '||u_pva||';';
	end if;
	if Rc_Data.FD_AMOUNT<=u_fa then
		fa:='P';
	else
		fa:='F';
		reason_for_fail_amt1:=reason_for_fail_amt1 ||' FD_AMOUNT AMOUNT SHOULD BE <= '||u_fa||';';
	end if;
	if Rc_Data.DRAWING_POWER<=u_dp then
		dp:='P';
	else
		dp:='F';
		reason_for_fail_amt1:=reason_for_fail_amt1 ||' DRAWING_POWER AMOUNT SHOULD BE <= '||u_dp||';';
	end if;
	if Rc_Data.SBLC_SECURITY_OMV<=u_sso then
		sso:='P';
	else
		sso:='F';
		reason_for_fail_amt1:=reason_for_fail_amt1 ||' SBLC_SECURITY_OMV AMOUNT SHOULD BE <= '||u_sso||';';
	end if;
elsif min_ros is null and max_ros is not null then  ------
	if l_lra<=Rc_Data.LIMIT_RELEASE_AMT then
		lra:='P';
	else
		lra:='F';
		reason_for_fail_amt2:=reason_for_fail_amt2 ||'LIMIT_RELEASE_AMT AMOUNT SHOULD BE >= '||l_lra||';';
	end if;	
	if l_tsl<=Rc_Data.TOTAL_SANCTIONED_LIMIT then
		tsl:='P';
	else
		tsl:='F';
		reason_for_fail_amt2:=reason_for_fail_amt2 ||' TOTAL_SANCTIONED_LIMIT AMOUNT SHOULD BE >= '||l_tsl||';';
	end if;
	if l_pva<=Rc_Data.PROPERTY_VALUATION_AMT then
		pva:='P';
	else 
		pva:='F';
		reason_for_fail_amt2:=reason_for_fail_amt2 ||' PROPERTY_VALUATION_AMT AMOUNT SHOULD BE >= '||l_pva||';';
	end if;
	if l_fa<=Rc_Data.FD_AMOUNT then
		fa:='P';
	else
		fa:='F';
		reason_for_fail_amt2:=reason_for_fail_amt2 ||' FD_AMOUNT AMOUNT SHOULD BE >= '||l_fa||';';
	end if;
	if l_dp<=Rc_Data.DRAWING_POWER then
		dp:='P';
	else
		dp:='F';
		reason_for_fail_amt2:=reason_for_fail_amt2 ||' DRAWING_POWER AMOUNT SHOULD BE >= '||l_dp||';'; 
	end if;
	if l_sso<=Rc_Data.SBLC_SECURITY_OMV  then
		sso:='P';
	else
		sso:='F';
		reason_for_fail_amt2:=reason_for_fail_amt2 ||' SBLC_SECURITY_OMV AMOUNT SHOULD BE >= '||l_sso||';'; 
	end if;
elsif min_ros is not null and max_ros is not null then ------
	if l_lra<=Rc_Data.LIMIT_RELEASE_AMT and Rc_Data.LIMIT_RELEASE_AMT<=u_lra then
		lra:='P';
	else
		lra:='F';
		reason_for_fail_amt3:=reason_for_fail_amt3 ||'LIMIT_RELEASE_AMT AMOUNT SHOULD BE >= '||l_lra||' AND <='||u_lra||';'; 
	end if;	
	if l_tsl<=Rc_Data.TOTAL_SANCTIONED_LIMIT and Rc_Data.TOTAL_SANCTIONED_LIMIT<=u_tsl then
		tsl:='P';
	else
		tsl:='F';
		reason_for_fail_amt3:=reason_for_fail_amt3 ||' TOTAL_SANCTIONED_LIMIT AMOUNT SHOULD BE >= '||l_tsl||' AND <='||u_tsl||';'; 
	end if;
	if l_pva<=Rc_Data.PROPERTY_VALUATION_AMT and Rc_Data.PROPERTY_VALUATION_AMT<=u_pva then
		pva:='P';
	else 
		pva:='F';
		reason_for_fail_amt3:=reason_for_fail_amt3 ||' PROPERTY_VALUATION_AMT AMOUNT SHOULD BE >= '||l_pva||' AND <='||u_pva||';'; 
	end if;
	if l_fa<=Rc_Data.FD_AMOUNT and Rc_Data.FD_AMOUNT<=u_fa then
		fa:='P';
	else
		fa:='F';
		reason_for_fail_amt3:=reason_for_fail_amt3 ||' FD_AMOUNT AMOUNT SHOULD BE >= '||l_fa||' AND <='||u_fa||';'; 
	end if;
	if l_dp<=Rc_Data.DRAWING_POWER and Rc_Data.DRAWING_POWER<=u_dp then
		dp:='P';
	else
		dp:='F';
		reason_for_fail_amt3:=reason_for_fail_amt3 ||' DRAWING_POWER AMOUNT SHOULD BE >= '||l_dp||' AND <='||u_dp||';'; 
	end if;
	if l_sso<=Rc_Data.SBLC_SECURITY_OMV and Rc_Data.SBLC_SECURITY_OMV<=u_sso then
		sso:='P';
	else
		sso:='F';
		reason_for_fail_amt3:=reason_for_fail_amt3 ||' SBLC_SECURITY_OMV AMOUNT SHOULD BE >= '||l_sso||' AND <='||u_sso||';'; 
	end if;
end if;  
end if;
--------------------------------TO HANDLE EMPLOYEE GRADE AND SEGMENT VALIDATION-------------------------------------------------
if r_count!=0 then
if Rc_Data.Segment='ALL' then
    if V_Emp_Grade is null then
        V_Emp_Grade_Allowed:='ALLOWED';
    else
        V_Emp_Grade_Allowed:='NOT_ALLOWED';
        reason:='SEGMENT IS ALREADY MAINTAINED FOR '||V_Emp_Grade||' SO SEGMENT ALL IS NOT ALLOWED;';
    end if;    
else  
    if V_Emp_Grade_All is null then
        V_Emp_Grade_Allowed:='ALLOWED'; 
    else  
        V_Emp_Grade_Allowed:='NOT_ALLOWED';
        reason:='SEGMENT ALL IS ALREADY MAINTAINED FOR '||V_Emp_Grade||' SO NOT ALLOWED;';
    end if;
end if;
end if;
--------------------------------PURPOSE: INSERT FIRST RECORD WITHOUT VALIDATION-------------------------------------------------
if r_count=0 then
    sso:='P'; dp:='P'; fa:='P'; pva:='P'; tsl:='P'; V_Emp_Grade_Allowed:='ALLOWED';
elsif r_count!=0 and min_ros is null and max_ros is null and V_Emp_Grade=Rc_Data.EMPLOYEE_GRADE then
	sso:='P'; dp:='P'; fa:='P'; pva:='P'; tsl:='P';
end if;
---------------------------------PURPOSE: FOR CHECK NEGATIVE VALUES-------------------------------------------------------------
if Rc_Data.LIMIT_RELEASE_AMT>=0 and Rc_Data.TOTAL_SANCTIONED_LIMIT>=0 and Rc_Data.PROPERTY_VALUATION_AMT>=0 and Rc_Data.FD_AMOUNT>=0 and Rc_Data.DRAWING_POWER>=0 and Rc_Data.SBLC_SECURITY_OMV>=0 then
    Neg_Value := 'P';
else
	Neg_Value := 'F';
    reason := 'NEGATIVE VALUES NOT ALLOWED;';
end if;
---------------------------------PURPOSE: TO CHECK FAILURE REASON-----------------------------------------------------------
if V_Emp_Grade_Allowed='NOT_ALLOWED' or dup_count>0 or Neg_Value='F' then
	update Day_Zero_Mig_Emp_Grade_Loa set status='F', reason_for_fail = reason where current of CR_DATA; 
	continue;
elsif reason_for_fail_amt1 is not null then	
	update Day_Zero_Mig_Emp_Grade_Loa set status='F', reason_for_fail = reason_for_fail_amt1 where current of CR_DATA; 
	continue;
elsif reason_for_fail_amt2 is not null then	
	update Day_Zero_Mig_Emp_Grade_Loa set status='F', reason_for_fail = reason_for_fail_amt2 where current of CR_DATA; 
	continue;
elsif reason_for_fail_amt3 is not null then	
	update Day_Zero_Mig_Emp_Grade_Loa set status='F', reason_for_fail = reason_for_fail_amt3 where current of CR_DATA; 
	continue;
elsif V_Common_Cat is null then
	update Day_Zero_Mig_Emp_Grade_Loa set status='F', reason_for_fail = 'SEGMENT NOT FOUND;' where current of CR_DATA; 
	continue;
elsif sso='F' then
	update Day_Zero_Mig_Emp_Grade_Loa set status='F', reason_for_fail = 'SBLC_SECURITY_OMV AMOUNT FAILURE;' where current of CR_DATA; 
	continue;
elsif dp='F' then
	update Day_Zero_Mig_Emp_Grade_Loa set status='F', reason_for_fail = 'DRAWING_POWER AMOUNT FAILURE;' where current of CR_DATA; 
	continue;
elsif fa='F' then
	update Day_Zero_Mig_Emp_Grade_Loa set status='F', reason_for_fail = 'FD_AMOUNT AMOUNT FAILURE;' where current of CR_DATA; 
	continue;	
elsif pva='F' then
	update Day_Zero_Mig_Emp_Grade_Loa set status='F', reason_for_fail = 'PROPERTY_VALUATION_AMT AMOUNT FAILURE;' where current of CR_DATA; 
	continue;
elsif tsl='F' then
	update Day_Zero_Mig_Emp_Grade_Loa set status='F', reason_for_fail = 'TOTAL_SANCTIONED_LIMIT AMOUNT FAILURE;' where current of CR_DATA; 
	continue;
elsif V_Sequence is null then
	update Day_Zero_Mig_Emp_Grade_Loa set status='F', reason_for_fail = 'SEQUENCE ERROR;' where current of CR_DATA; 
	continue;
end if;
----------------------------------PURPOSE: FOR INSERT RECORDS-------------------------------------------------------------------
	if RC_DATA.EMPLOYEE_GRADE is not null and V_Sequence is not null and V_Common_Cat=1 and dup_count=0 and
	   V_Emp_Grade_Allowed='ALLOWED' and sso='P' and dp='P' and fa='P' and pva='P' and tsl='P' and Neg_Value='P' then
	  
        V_Ref_Id := To_Char(Sysdate,'YYYYMMDD') || Lpad(CMS_LOA_MASTER_SEQ.Nextval,9,0);
        v_stg_id := to_char(sysdate,'YYYYMMDD') || lpad(CMS_STAGE_LOA_MASTER_SEQ.nextval,9,0);
        V_Trx_Id := To_Char(Sysdate,'YYYYMMDD') || Lpad(Trx_Seq.Nextval,9,0);
        v_trx_hist_id := to_char(sysdate,'YYYYMMDD') || lpad(TRX_HISTORY_SEQ.nextval,9,0);
        
        insert into trans_history (tr_history_id, transaction_id, from_state, to_state,
        user_id, login_id, transaction_type, creation_date, transaction_date,reference_id,status,
        staging_reference_id, team_id, opsdesc, to_user_id, to_group_id, customer_id, limit_profile_id,
        team_type_id, team_membership_id)
        values (
        V_Trx_Hist_Id, V_Trx_Id, 'ND', 'PENDING_CREATE',
        -1, 'SYSTEM', 'LIMITS_OF_AUTHORITY', sysdate, sysdate, null, 'PENDING_CREATE',
        v_stg_id, -999999999, 'CREATE', -999999999, -999999999, -999999999, -999999999,
        -999999999, -999999999);

        v_trx_hist_id := to_char(sysdate,'YYYYMMDD') || lpad(TRX_HISTORY_SEQ.nextval,9,0);

        insert into trans_history (tr_history_id, transaction_id, from_state, to_state,
        user_id, login_id, transaction_type, creation_date, transaction_date,reference_id,status,
        staging_reference_id, team_id, opsdesc, to_user_id, to_group_id, customer_id, limit_profile_id,
        team_type_id, team_membership_id)
        values (
        v_trx_hist_id, v_trx_id, 'PENDING_CREATE', 'ACTIVE',
        -1, 'SYSTEM', 'LIMITS_OF_AUTHORITY', sysdate, sysdate, V_Ref_Id, 'ACTIVE',
        v_stg_id, -999999999, 'APPROVE_CREATE', -999999999, -999999999, -999999999, -999999999,
        -999999999, -999999999);
        
        insert into transaction (transaction_id, from_state, user_id, login_id, transaction_type,
        creation_date, transaction_date, reference_id, status, staging_reference_id, team_id, version,
        trx_reference_id, opsdesc, customer_id, limit_profile_id, cur_trx_history_id, team_type_id,
        to_group_type_id, to_group_id, to_user_id, team_membership_id, system_date)
        values (
        v_trx_id, 'PENDING_CREATE', -1, 'SYSTEM', 'LIMITS_OF_AUTHORITY',
        sysdate, sysdate, V_Ref_Id, 'ACTIVE', v_stg_id, -999999999, 0,
        -999999999, 'APPROVE_CREATE', -999999999, -999999999, v_trx_hist_id, -999999999,
        -999999999, -999999999, -999999999, -999999999, sysdate);
        
        Insert Into CMS_STAGE_LOA_MASTER ( Id, Employee_Grade, Segment , Ranking_Of_Sequence, Limit_Release_Amt ,
        Total_Sanctioned_Limit, Property_Valuation_Amt, Fd_Amount, Drawing_Power,Sblc_Security_Omv ,Facility_Cam_Covenant ,
        status, version_time, Created_By, Creation_Date, Last_Update_By, Last_Update_Date, Deprecated)
        Values ( V_Stg_Id, Rc_Data.Employee_Grade, Rc_Data.Segment, V_Sequence, 
        Rc_Data.LIMIT_RELEASE_AMT, Rc_Data.Total_Sanctioned_Limit, Rc_Data.Property_Valuation_Amt, Rc_Data.Fd_Amount, 
        Rc_Data.Drawing_Power, Rc_Data.Sblc_Security_Omv, Rc_Data.Facility_Cam_Covenant,           
        'ACTIVE', 0, 'SYSTEM', sysdate, 'SYSTEM', sysdate, 'N');
        
        Insert Into Cms_Loa_Master ( Id, Employee_Grade, Segment , Ranking_Of_Sequence, Limit_Release_Amt ,
        Total_Sanctioned_Limit, Property_Valuation_Amt, Fd_Amount, Drawing_Power,Sblc_Security_Omv ,Facility_Cam_Covenant ,
        status, version_time, Created_By, Creation_Date, Last_Update_By, Last_Update_Date, Deprecated)
        Values ( V_Ref_Id, Rc_Data.Employee_Grade, Rc_Data.Segment, V_Sequence, 
        Rc_Data.LIMIT_RELEASE_AMT, Rc_Data.Total_Sanctioned_Limit, Rc_Data.Property_Valuation_Amt, Rc_Data.Fd_Amount, 
        Rc_Data.Drawing_Power, Rc_Data.Sblc_Security_Omv, Rc_Data.Facility_Cam_Covenant,           
        'ACTIVE', 0, 'SYSTEM', Sysdate, 'SYSTEM', Sysdate, 'N');
          
      
       v_status := 'S';  
      end if;
        update Day_Zero_Mig_Emp_Grade_Loa set status = v_status where current of CR_DATA;
    END LOOP;
    close CR_DATA;
    Commit;
end pro_loa_master_emp_grade;
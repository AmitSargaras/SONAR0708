
--File Upload for Bond
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200101','feed_bond_item','checker_process_create_insert','7');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200102','feed_bond_item','maker_rejected_delete_read','6');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200103','feed_bond_item','checker_process_create_insert','7');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200104','feed_bond_item','checker_approve_insert','7');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200105','feed_bond_item','checker_reject_insert','7');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200106','feed_bond_item','maker_prepare_insert_close','6');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200107','feed_bond_item','maker_confirm_insert_close','6');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200108','feed_bond_item','maker_rejected_delete_read','7');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200109','feed_bond_item','maker_event_upload_bondItem','6');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200110','feed_bond_item','maker_prepare_upload_bondItem','6');

insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7011,'INSERT_BOND','FILE_INSERT','PENDING_INSERT','PENDING_INSERT','PENDING_INSERT','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7012,'INSERT_BOND','FILE_INSERT','ND','PENDING_INSERT','PENDING_INSERT','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7013,'INSERT_BOND','REJECT_INSERT_FILE_MASTER','PENDING_INSERT','REJECTED','REJECTED','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7014,'INSERT_BOND','READ_FILE_INSERT','ND','ACTIVE','ACTIVE','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7015,'INSERT_BOND','APPROVE_INSERT_FILE_MASTER','PENDING_INSERT','ACTIVE','ACTIVE','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7016,'INSERT_BOND','CLOSE_REJECTED_FILE_MASTER','REJECTED','ACTIVE','ACTIVE','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7017,'INSERT_BOND','INSERT_FILE_MASTER','ND','PENDING_CREATE','PENDING_CREATE','1','1');

INSERT INTO CMS_STATEMATRIX_ACTION VALUES ('7011','7','Process','feed_bond_item.do?event=checker_process_create_insert&TrxId=',null);
INSERT INTO CMS_STATEMATRIX_ACTION VALUES ('7016','6','Close','feed_bond_item.do?event=maker_prepare_insert_close&TrxId=','feed_bond_item.do?event=to_track&TrxId=');

INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_BOND','feed_bond_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','ACTIVE','Approved','Bond File Upload',null,null);
INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_BOND','feed_bond_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','CLOSED','Closed','Bond File Upload',null,null);
INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_BOND','feed_bond_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','INSERT','Insert','Bond File Upload',null,null);
INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_BOND','feed_bond_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','PENDING_INSERT','Pending Insert','Bond File Upload',null,null);
INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_BOND','feed_bond_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','REJECTED','Rejected','Bond File Upload',null,null);

--End File Upload for Bond


---- File Upload for Stock
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200201','feed_stock_item','checker_process_create_insert','7');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200202','feed_stock_item','maker_rejected_delete_read','6');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200203','feed_stock_item','checker_process_create_insert','7');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200204','feed_stock_item','checker_approve_insert','7');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200205','feed_stock_item','checker_reject_insert','7');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200206','feed_stock_item','maker_prepare_insert_close','6');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200207','feed_stock_item','maker_confirm_insert_close','6');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200208','feed_stock_item','maker_rejected_delete_read','7');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200209','feed_stock_item','maker_event_upload_stockItem','6');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200210','feed_stock_item','maker_prepare_upload_stockItem','6');

insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7211,'INSERT_STOCK','FILE_INSERT','PENDING_INSERT','PENDING_INSERT','PENDING_INSERT','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7212,'INSERT_STOCK','FILE_INSERT','ND','PENDING_INSERT','PENDING_INSERT','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7213,'INSERT_STOCK','REJECT_INSERT_FILE_MASTER','PENDING_INSERT','REJECTED','REJECTED','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7214,'INSERT_STOCK','READ_FILE_INSERT','ND','ACTIVE','ACTIVE','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7215,'INSERT_STOCK','APPROVE_INSERT_FILE_MASTER','PENDING_INSERT','ACTIVE','ACTIVE','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7216,'INSERT_STOCK','CLOSE_REJECTED_FILE_MASTER','REJECTED','ACTIVE','ACTIVE','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7217,'INSERT_STOCK','INSERT_FILE_MASTER','ND','PENDING_CREATE','PENDING_CREATE','1','1');

INSERT INTO CMS_STATEMATRIX_ACTION VALUES ('7211','7','Process','feed_stock_item.do?event=checker_process_create_insert&TrxId=',null);
INSERT INTO CMS_STATEMATRIX_ACTION VALUES ('7216','6','Close','feed_stock_item.do?event=maker_prepare_insert_close&TrxId=','feed_stock_item.do?event=to_track&TrxId=');

INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_STOCK','feed_stock_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','ACTIVE','Approved','Stock File Upload',null,null);
INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_STOCK','feed_stock_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','CLOSED','Closed','Stock File Upload',null,null);
INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_STOCK','feed_stock_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','INSERT','Insert','Stock File Upload',null,null);
INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_STOCK','feed_stock_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','PENDING_INSERT','Pending Insert','Stock File Upload',null,null);
INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_STOCK','feed_stock_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','REJECTED','Rejected','Stock File Upload',null,null);

---NSE START
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7411,'INSERT_STOCK_NSE','FILE_INSERT','PENDING_INSERT','PENDING_INSERT','PENDING_INSERT','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7412,'INSERT_STOCK_NSE','FILE_INSERT','ND','PENDING_INSERT','PENDING_INSERT','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7413,'INSERT_STOCK_NSE','REJECT_INSERT_FILE_MASTER','PENDING_INSERT','REJECTED','REJECTED','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7414,'INSERT_STOCK_NSE','READ_FILE_INSERT','ND','ACTIVE','ACTIVE','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7415,'INSERT_STOCK_NSE','APPROVE_INSERT_FILE_MASTER','PENDING_INSERT','ACTIVE','ACTIVE','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7416,'INSERT_STOCK_NSE','CLOSE_REJECTED_FILE_MASTER','REJECTED','ACTIVE','ACTIVE','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7417,'INSERT_STOCK_NSE','INSERT_FILE_MASTER','ND','PENDING_CREATE','PENDING_CREATE','1','1');

INSERT INTO CMS_STATEMATRIX_ACTION VALUES ('7411','7','Process','feed_stock_item.do?event=checker_process_create_insert&TrxId=',null);
INSERT INTO CMS_STATEMATRIX_ACTION VALUES ('7416','6','Close','feed_stock_item.do?event=maker_prepare_insert_close&TrxId=','feed_stock_item.do?event=to_track&TrxId=');

INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_STOCK_NSE','feed_stock_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','ACTIVE','Approved','Stock File Upload',null,null);
INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_STOCK_NSE','feed_stock_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','CLOSED','Closed','Stock File Upload',null,null);
INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_STOCK_NSE','feed_stock_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','INSERT','Insert','Stock File Upload',null,null);
INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_STOCK_NSE','feed_stock_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','PENDING_INSERT','Pending Insert','Stock File Upload',null,null);
INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_STOCK_NSE','feed_stock_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','REJECTED','Rejected','Stock File Upload',null,null);


---NSE END

----------------------------------OTHERS----------------------------------
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7711,'INSERT_STOCK_OTHERS','FILE_INSERT','PENDING_INSERT','PENDING_INSERT','PENDING_INSERT','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7712,'INSERT_STOCK_OTHERS','FILE_INSERT','ND','PENDING_INSERT','PENDING_INSERT','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7713,'INSERT_STOCK_OTHERS','REJECT_INSERT_FILE_MASTER','PENDING_INSERT','REJECTED','REJECTED','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7714,'INSERT_STOCK_OTHERS','READ_FILE_INSERT','ND','ACTIVE','ACTIVE','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7715,'INSERT_STOCK_OTHERS','APPROVE_INSERT_FILE_MASTER','PENDING_INSERT','ACTIVE','ACTIVE','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7716,'INSERT_STOCK_OTHERS','CLOSE_REJECTED_FILE_MASTER','REJECTED','ACTIVE','ACTIVE','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7717,'INSERT_STOCK_OTHERS','INSERT_FILE_MASTER','ND','PENDING_CREATE','PENDING_CREATE','1','1');


INSERT INTO CMS_STATEMATRIX_ACTION VALUES ('7711','7','Process','feed_stock_item.do?event=checker_process_create_insert&TrxId=',null);
INSERT INTO CMS_STATEMATRIX_ACTION VALUES ('7716','6','Close','feed_stock_item.do?event=maker_prepare_insert_close&TrxId=','feed_stock_item.do?event=to_track&TrxId=');



INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_STOCK_OTHERS','feed_stock_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','ACTIVE','Approved','Stock File Upload',null,null);
INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_STOCK_OTHERS','feed_stock_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','CLOSED','Closed','Stock File Upload',null,null);
INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_STOCK_OTHERS','feed_stock_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','INSERT','Insert','Stock File Upload',null,null);
INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_STOCK_OTHERS','feed_stock_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','PENDING_INSERT','Pending Insert','Stock File Upload',null,null);
INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_STOCK_OTHERS','feed_stock_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','REJECTED','Rejected','Stock File Upload',null,null);

---------------------------OTHERS-----------------------------------------

--End File Upload for Stock



--File Upload Mutual Funds
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200301','feed_mutual_funds_item','checker_process_create_insert','7');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200302','feed_mutual_funds_item','maker_rejected_delete_read','6');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200303','feed_mutual_funds_item','checker_process_create_insert','7');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200304','feed_mutual_funds_item','checker_approve_insert','7');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200305','feed_mutual_funds_item','checker_reject_insert','7');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200306','feed_mutual_funds_item','maker_prepare_insert_close','6');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200307','feed_mutual_funds_item','maker_confirm_insert_close','6');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200308','feed_mutual_funds_item','maker_rejected_delete_read','7');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200309','feed_mutual_funds_item','maker_event_upload_mutualfundsItem','6');
INSERT INTO CMS_FUNCTION_ACCESS VALUES ('6200310','feed_mutual_funds_item','maker_prepare_upload_mutualfundsItem','6');

insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7311,'INSERT_MUTUAL_FUNDS','FILE_INSERT','PENDING_INSERT','PENDING_INSERT','PENDING_INSERT','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7312,'INSERT_MUTUAL_FUNDS','FILE_INSERT','ND','PENDING_INSERT','PENDING_INSERT','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7313,'INSERT_MUTUAL_FUNDS','REJECT_INSERT_FILE_MASTER','PENDING_INSERT','REJECTED','REJECTED','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7314,'INSERT_MUTUAL_FUNDS','READ_FILE_INSERT','ND','ACTIVE','ACTIVE','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7315,'INSERT_MUTUAL_FUNDS','APPROVE_INSERT_FILE_MASTER','PENDING_INSERT','ACTIVE','ACTIVE','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7316,'INSERT_MUTUAL_FUNDS','CLOSE_REJECTED_FILE_MASTER','REJECTED','ACTIVE','ACTIVE','1','1');
insert into TR_STATE_MATRIX ( STATEID, STATEINS, OPERATION, FROMSTATE, TOSTATE, USERSTATE,ENABLEIND, FRONTENDOP )
values (7317,'INSERT_MUTUAL_FUNDS','INSERT_FILE_MASTER','ND','PENDING_CREATE','PENDING_CREATE','1','1');

INSERT INTO CMS_STATEMATRIX_ACTION VALUES ('7311','7','Process','feed_mutual_funds_item.do?event=checker_process_create_insert&TrxId=',null);
INSERT INTO CMS_STATEMATRIX_ACTION VALUES ('7316','6','Close','feed_mutual_funds_item.do?event=maker_prepare_insert_close&TrxId=','feed_mutual_funds_item.do?event=to_track&TrxId=');

INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_MUTUAL_FUNDS','feed_mutual_funds_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','ACTIVE','Approved','Mutual Funds File Upload',null,null);
INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_MUTUAL_FUNDS','feed_mutual_funds_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','CLOSED','Closed','Mutual Funds File Upload',null,null);
INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_MUTUAL_FUNDS','feed_mutual_funds_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','INSERT','Insert','Mutual Funds File Upload',null,null);
INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_MUTUAL_FUNDS','feed_mutual_funds_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','PENDING_INSERT','Pending Insert','Mutual Funds File Upload',null,null);
INSERT INTO CMS_TRX_TOTRACK VALUES('INSERT_MUTUAL_FUNDS','feed_mutual_funds_item.do?event=maker_rejected_delete_read&toTrack=yes&TrxId=','REJECTED','Rejected','Mutual Funds File Upload',null,null);

--End File Upload Mutual Funds















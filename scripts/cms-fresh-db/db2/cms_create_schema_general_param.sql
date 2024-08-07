
--------------------------------
--- CMS_GENERAL_PARAM 
--------------------------------

CREATE TABLE ABCLIMS.CMS_GENERAL_PARAM
(
  PARAM_ID          NUMBER                      NOT NULL,
  PARAM_CODE        VARCHAR2(30 BYTE)           NOT NULL,
  PARAM_NAME        VARCHAR2(30 BYTE)           NOT NULL,
  PARAM_VALUE       NUMBER(38)                  NOT NULL,
  UI_VIEW           CHAR(1 BYTE)                NOT NULL,
  LAST_UPDATE_DATE  DATE,
  FEED_REF          NUMBER,
  FEED_GROUP_ID     NUMBER
)


--------------------------------
--- CMS_STAGE_GENERAL_PARAM 
--------------------------------
CREATE TABLE ABCLIMS.CMS_STAGE_GENERAL_PARAM
(
  PARAM_ID          NUMBER                      NOT NULL,
  PARAM_CODE        VARCHAR2(30 BYTE)           NOT NULL,
  PARAM_NAME        VARCHAR2(30 BYTE)           NOT NULL,
  PARAM_VALUE       NUMBER(38)                  NOT NULL,
  UI_VIEW           CHAR(1 BYTE)                NOT NULL,
  LAST_UPDATE_DATE  DATE,
  FEED_REF          NUMBER,
  FEED_GROUP_ID     NUMBER
)
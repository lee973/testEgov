CREATE TABLE COMTECOPSEQ
(
	TABLE_NAME            VARCHAR(20) NULL,
	NEXT_ID               NUMERIC(30) NULL,
	 PRIMARY KEY (TABLE_NAME)
)
;

CREATE UNIQUE INDEX COMTECOPSEQ_PK ON COMTECOPSEQ
(
	TABLE_NAME
)
;



CREATE TABLE COMTNEMPLYRSCRTYESTBS
(
	SCRTY_DTRMN_TRGET_ID  VARCHAR(20) NOT NULL,
	MBER_TY_CODE          CHAR(5) NULL,
	AUTHOR_CODE           VARCHAR(30) NOT NULL,
	 PRIMARY KEY (SCRTY_DTRMN_TRGET_ID)
)
;

CREATE UNIQUE INDEX COMTNEMPLYRSCRTYESTBS_PK ON COMTNEMPLYRSCRTYESTBS
(
	SCRTY_DTRMN_TRGET_ID
)
;
CREATE INDEX COMTNEMPLYRSCRTYESTBS_i04 ON COMTNEMPLYRSCRTYESTBS
(
	AUTHOR_CODE
)
;



CREATE TABLE COMTSWEBLOGSUMMARY
(
	OCCRRNC_DE            CHAR(20) NULL,
	URL                   VARCHAR(100) NULL,
	RDCNT                 NUMERIC(10) NULL,
	 PRIMARY KEY (OCCRRNC_DE,URL)
)
;

CREATE UNIQUE INDEX COMTSWEBLOGSUMMARY_PK ON COMTSWEBLOGSUMMARY
(
	OCCRRNC_DE,
	URL
)
;



CREATE TABLE COMTNRESTDE
(
	RESTDE_NO             NUMERIC(6) NOT NULL,
	RESTDE                CHAR(8) NULL,
	RESTDE_NM             VARCHAR(60) NULL,
	RESTDE_DC             VARCHAR(200) NULL,
	RESTDE_SE_CODE        VARCHAR(2) NULL,
	FRST_REGIST_PNTTM     DATETIME NULL,
	FRST_REGISTER_ID      VARCHAR(20) NULL,
	LAST_UPDT_PNTTM       DATETIME NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	 PRIMARY KEY (RESTDE_NO)
)
;

CREATE UNIQUE INDEX COMTNRESTDE_PK ON COMTNRESTDE
(
	RESTDE_NO
)
;



CREATE TABLE COMTCCMMNCLCODE
(
	CL_CODE               CHAR(3) NOT NULL,
	CL_CODE_NM            VARCHAR(60) NULL,
	CL_CODE_DC            VARCHAR(200) NULL,
	USE_AT                CHAR(1) NULL,
	FRST_REGIST_PNTTM     DATETIME NULL,
	FRST_REGISTER_ID      VARCHAR(20) NULL,
	LAST_UPDT_PNTTM       DATETIME NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	 PRIMARY KEY (CL_CODE)
)
;

CREATE UNIQUE INDEX COMTCCMMNCLCODE_PK ON COMTCCMMNCLCODE
(
	CL_CODE
)
;



CREATE TABLE COMTCCMMNCODE
(
	CODE_ID               VARCHAR(6) NOT NULL,
	CODE_ID_NM            VARCHAR(60) NULL,
	CODE_ID_DC            VARCHAR(200) NULL,
	USE_AT                CHAR(1) NULL,
	CL_CODE               CHAR(3) NULL,
	FRST_REGIST_PNTTM     DATETIME NULL,
	FRST_REGISTER_ID      VARCHAR(20) NULL,
	LAST_UPDT_PNTTM       DATETIME NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	 PRIMARY KEY (CODE_ID),
	FOREIGN KEY COMTCCMMNCODE_FK1 (CL_CODE) REFERENCES COMTCCMMNCLCODE(CL_CODE)
)
;

CREATE UNIQUE INDEX COMTCCMMNCODE_PK ON COMTCCMMNCODE
(
	CODE_ID
)
;
CREATE INDEX COMTCCMMNCODE_i01 ON COMTCCMMNCODE
(
	CL_CODE
)
;



CREATE TABLE COMTCCMMNDETAILCODE
(
	CODE_ID               VARCHAR(6) NOT NULL,
	CODE                  VARCHAR(15) NOT NULL,
	CODE_NM               VARCHAR(60) NULL,
	CODE_DC               VARCHAR(200) NULL,
	USE_AT                CHAR(1) NULL,
	FRST_REGIST_PNTTM     DATETIME NULL,
	FRST_REGISTER_ID      VARCHAR(20) NULL,
	LAST_UPDT_PNTTM       DATETIME NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	 PRIMARY KEY (CODE_ID,CODE),
	FOREIGN KEY COMTCCMMNDETAILCODE_FK1 (CODE_ID) REFERENCES COMTCCMMNCODE(CODE_ID)
)
;

CREATE UNIQUE INDEX COMTCCMMNDETAILCODE_PK ON COMTCCMMNDETAILCODE
(
	CODE_ID,
	CODE
)
;
CREATE INDEX COMTCCMMNDETAILCODE_i01 ON COMTCCMMNDETAILCODE
(
	CODE_ID
)
;



CREATE TABLE COMTNAUTHORGROUPINFO
(
	GROUP_ID              CHAR(20) NULL,
	GROUP_NM              VARCHAR(60) NOT NULL,
	GROUP_CREAT_DE        CHAR(20) NOT NULL,
	GROUP_DC              VARCHAR(100) NULL,
	 PRIMARY KEY (GROUP_ID)
)
;

CREATE UNIQUE INDEX COMTNAUTHORGROUPINFO_PK ON COMTNAUTHORGROUPINFO
(
	GROUP_ID
)
;



CREATE TABLE COMTNGNRLMBER
(
	MBER_ID               VARCHAR(20) NULL,
	PASSWORD              VARCHAR(200) NOT NULL,
	PASSWORD_HINT         VARCHAR(100) NULL,
	PASSWORD_CNSR         VARCHAR(100) NULL,
	IHIDNUM               VARCHAR(200) NULL,
	MBER_NM               VARCHAR(50) NOT NULL,
	ZIP                   VARCHAR(6) NOT NULL,
	ADRES                 VARCHAR(100) NOT NULL,
	AREA_NO               VARCHAR(4) NOT NULL,
	MBER_STTUS            VARCHAR(15) NULL,
	DETAIL_ADRES          VARCHAR(100) NULL,
	END_TELNO             VARCHAR(4) NOT NULL,
	MBTLNUM               VARCHAR(20) NOT NULL,
	GROUP_ID              CHAR(20) NULL,
	MBER_FXNUM            VARCHAR(20) NULL,
	MBER_EMAIL_ADRES      VARCHAR(50) NULL,
	MIDDLE_TELNO          VARCHAR(4) NOT NULL,
	SBSCRB_DE             DATETIME NULL,
	SEXDSTN_CODE          CHAR(1) NULL,
	ESNTL_ID              CHAR(20) NOT NULL,
	 PRIMARY KEY (MBER_ID),
	FOREIGN KEY COMTNGNRLMBER_FK1 (GROUP_ID) REFERENCES COMTNAUTHORGROUPINFO(GROUP_ID)
		ON DELETE SET NULL
)
;

CREATE UNIQUE INDEX COMTNGNRLMBER_PK ON COMTNGNRLMBER
(
	MBER_ID
)
;
CREATE INDEX COMTNGNRLMBER_i01 ON COMTNGNRLMBER
(
	GROUP_ID
)
;



CREATE TABLE COMTNORGNZTINFO
(
	ORGNZT_ID             CHAR(20) NULL,
	ORGNZT_NM             VARCHAR(20) NOT NULL,
	ORGNZT_DC             VARCHAR(100) NULL,
	 PRIMARY KEY (ORGNZT_ID)
)
;

CREATE UNIQUE INDEX COMTNORGNZTINFO_PK ON COMTNORGNZTINFO
(
	ORGNZT_ID
)
;



CREATE TABLE COMTNEMPLYRINFO
(
	EMPLYR_ID             VARCHAR(20) NOT NULL,
	ORGNZT_ID             CHAR(20) NULL,
	USER_NM               VARCHAR(60) NOT NULL,
	PASSWORD              VARCHAR(200) NOT NULL,
	EMPL_NO               VARCHAR(20) NULL,
	IHIDNUM               VARCHAR(200) NULL,
	SEXDSTN_CODE          CHAR(1) NULL,
	BRTHDY                CHAR(20) NULL,
	FXNUM                 VARCHAR(20) NULL,
	HOUSE_ADRES           VARCHAR(100) NOT NULL,
	PASSWORD_HINT         VARCHAR(100) NOT NULL,
	PASSWORD_CNSR         VARCHAR(100) NOT NULL,
	HOUSE_END_TELNO       VARCHAR(4) NOT NULL,
	AREA_NO               VARCHAR(4) NOT NULL,
	DETAIL_ADRES          VARCHAR(100) NULL,
	ZIP                   VARCHAR(6) NOT NULL,
	OFFM_TELNO            VARCHAR(20) NULL,
	MBTLNUM               VARCHAR(20) NULL,
	EMAIL_ADRES           VARCHAR(50) NULL,
	OFCPS_NM              VARCHAR(60) NULL,
	HOUSE_MIDDLE_TELNO    VARCHAR(4) NOT NULL,
	GROUP_ID              CHAR(20) NULL,
	PSTINST_CODE          CHAR(8) NULL,
	EMPLYR_STTUS_CODE     CHAR(1) NOT NULL,
	ESNTL_ID              CHAR(20) NOT NULL,
	CRTFC_DN_VALUE        VARCHAR(100) NULL,
	SBSCRB_DE             DATETIME NULL,
	 PRIMARY KEY (EMPLYR_ID),
	FOREIGN KEY COMTNEMPLYRINFO_FK2 (ORGNZT_ID) REFERENCES COMTNORGNZTINFO(ORGNZT_ID)
		ON DELETE SET NULL,
	FOREIGN KEY COMTNEMPLYRINFO_FK1 (GROUP_ID) REFERENCES COMTNAUTHORGROUPINFO(GROUP_ID)
		ON DELETE SET NULL
)
;

CREATE UNIQUE INDEX COMTNEMPLYRINFO_PK ON COMTNEMPLYRINFO
(
	EMPLYR_ID
)
;
CREATE INDEX COMTNEMPLYRINFO_i01 ON COMTNEMPLYRINFO
(
	ORGNZT_ID
)
;
CREATE INDEX COMTNEMPLYRINFO_i02 ON COMTNEMPLYRINFO
(
	GROUP_ID
)
;



CREATE TABLE COMTNENTRPRSMBER
(
	ENTRPRS_MBER_ID       VARCHAR(20) NULL,
	ENTRPRS_SE_CODE       CHAR(8) NULL,
	BIZRNO                VARCHAR(10) NULL,
	JURIRNO               VARCHAR(13) NULL,
	CMPNY_NM              VARCHAR(60) NOT NULL,
	CXFC                  VARCHAR(50) NULL,
	ZIP                   VARCHAR(6) NOT NULL,
	ADRES                 VARCHAR(100) NOT NULL,
	ENTRPRS_MIDDLE_TELNO  VARCHAR(4) NOT NULL,
	FXNUM                 VARCHAR(20) NULL,
	INDUTY_CODE           CHAR(1) NULL,
	APPLCNT_NM            VARCHAR(50) NOT NULL,
	APPLCNT_IHIDNUM       VARCHAR(200) NULL,
	SBSCRB_DE             DATETIME NULL,
	ENTRPRS_MBER_STTUS    VARCHAR(15) NULL,
	ENTRPRS_MBER_PASSWORD  VARCHAR(200) NULL,
	ENTRPRS_MBER_PASSWORD_HINT  VARCHAR(100) NOT NULL,
	ENTRPRS_MBER_PASSWORD_CNSR  VARCHAR(100) NOT NULL,
	GROUP_ID              CHAR(20) NULL,
	DETAIL_ADRES          VARCHAR(100) NULL,
	ENTRPRS_END_TELNO     VARCHAR(4) NOT NULL,
	AREA_NO               VARCHAR(4) NOT NULL,
	APPLCNT_EMAIL_ADRES   VARCHAR(50) NOT NULL,
	ESNTL_ID              CHAR(20) NOT NULL,
	 PRIMARY KEY (ENTRPRS_MBER_ID),
	FOREIGN KEY COMTNENTRPRSMBER_FK1 (GROUP_ID) REFERENCES COMTNAUTHORGROUPINFO(GROUP_ID)
		ON DELETE SET NULL
)
;

CREATE UNIQUE INDEX COMTNENTRPRSMBER_PK ON COMTNENTRPRSMBER
(
	ENTRPRS_MBER_ID
)
;
CREATE INDEX COMTNENTRPRSMBER_i01 ON COMTNENTRPRSMBER
(
	GROUP_ID
)
;





CREATE  VIEW COMVNUSERMASTER ( ESNTL_ID,USER_ID,PASSWORD,USER_NM,USER_ZIP,USER_ADRES,USER_EMAIL,GROUP_ID, USER_SE, ORGNZT_ID ) 
AS  
		SELECT ESNTL_ID, MBER_ID,PASSWORD,MBER_NM,ZIP,ADRES,MBER_EMAIL_ADRES,' ','GNR' AS USER_SE, ' ' ORGNZT_ID
		FROM COMTNGNRLMBER
		
	UNION ALL
		SELECT ESNTL_ID,EMPLYR_ID,PASSWORD,USER_NM,ZIP,HOUSE_ADRES,EMAIL_ADRES,GROUP_ID ,'USR' AS USER_SE, ORGNZT_ID
		FROM COMTNEMPLYRINFO
	UNION ALL
		SELECT ESNTL_ID,ENTRPRS_MBER_ID,ENTRPRS_MBER_PASSWORD,CMPNY_NM,ZIP,ADRES,APPLCNT_EMAIL_ADRES,' ' ,'ENT' AS USER_SE, ' ' ORGNZT_ID
		FROM COMTNENTRPRSMBER 
ORDER BY ESNTL_ID;


CREATE TABLE COMTNAUTHORINFO
(
	AUTHOR_CODE           VARCHAR(30) NULL,
	AUTHOR_NM             VARCHAR(60) NOT NULL,
	AUTHOR_DC             VARCHAR(200) NULL,
	AUTHOR_CREAT_DE       CHAR(20) NOT NULL,
	 PRIMARY KEY (AUTHOR_CODE)
)
;

CREATE UNIQUE INDEX COMTNAUTHORINFO_PK ON COMTNAUTHORINFO
(
	AUTHOR_CODE
)
;



CREATE TABLE COMTNPROGRMLIST
(
	PROGRM_FILE_NM        VARCHAR(60) NULL,
	PROGRM_STRE_PATH      VARCHAR(100) NOT NULL,
	PROGRM_KOREAN_NM      VARCHAR(60) NULL,
	PROGRM_DC             VARCHAR(200) NULL,
	URL                   VARCHAR(100) NOT NULL,
	 PRIMARY KEY (PROGRM_FILE_NM)
)
;

CREATE UNIQUE INDEX COMTNPROGRMLIST_PK ON COMTNPROGRMLIST
(
	PROGRM_FILE_NM
)
;



CREATE TABLE COMTHPROGRMCHANGEDTLS
(
	PROGRM_FILE_NM        VARCHAR(60) NOT NULL,
	REQUST_NO             NUMERIC(10) NULL,
	RQESTER_ID            VARCHAR(20) NOT NULL,
	CHANGE_REQUST_CN      VARCHAR(1000) NULL,
	REQUST_PROCESS_CN     MEDIUMTEXT NULL,
	OPETR_ID              VARCHAR(20) NULL,
	PROCESS_STTUS_CODE    VARCHAR(15) NOT NULL,
	PROCESS_DE            CHAR(20) NULL,
	RQESTDE               CHAR(20) NULL,
	REQUST_SJ             VARCHAR(60) NOT NULL,
	 PRIMARY KEY (PROGRM_FILE_NM,REQUST_NO),
	FOREIGN KEY COMTHPROGRMCHANGEDTLS_FK1 (PROGRM_FILE_NM) REFERENCES COMTNPROGRMLIST(PROGRM_FILE_NM)
		ON DELETE CASCADE
)
;

CREATE UNIQUE INDEX COMTHPROGRMCHANGEDTLS_PK ON COMTHPROGRMCHANGEDTLS
(
	PROGRM_FILE_NM,
	REQUST_NO
)
;
CREATE INDEX COMTHPROGRMCHANGEDTLS_i01 ON COMTHPROGRMCHANGEDTLS
(
	PROGRM_FILE_NM
)
;



CREATE TABLE COMTNMENUINFO
(
	MENU_NM               VARCHAR(60) NOT NULL,
	PROGRM_FILE_NM        VARCHAR(60) NOT NULL,
	MENU_NO               NUMERIC(20) NOT NULL,
	UPPER_MENU_NO         NUMERIC(20) NULL,
	MENU_ORDR             NUMERIC(5) NOT NULL,
	MENU_DC               VARCHAR(250) NULL,
	RELATE_IMAGE_PATH     VARCHAR(100) NULL,
	RELATE_IMAGE_NM       VARCHAR(60) NULL,
	 PRIMARY KEY (MENU_NO),
	FOREIGN KEY COMTNMENUINFO_FK2 (PROGRM_FILE_NM) REFERENCES COMTNPROGRMLIST(PROGRM_FILE_NM)
		ON DELETE CASCADE,
	FOREIGN KEY COMTNMENUINFO_FK1 (UPPER_MENU_NO) REFERENCES COMTNMENUINFO(MENU_NO)
		ON DELETE CASCADE
)
;

CREATE UNIQUE INDEX COMTNMENUINFO_PK ON COMTNMENUINFO
(
	MENU_NO
)
;
CREATE INDEX COMTNMENUINFO_i02 ON COMTNMENUINFO
(
	UPPER_MENU_NO
)
;



CREATE TABLE COMTNSITEMAP
(
	MAPNG_CREAT_ID        VARCHAR(30) NOT NULL,
	CREATR_ID             VARCHAR(20) NOT NULL,
	MAPNG_FILE_NM         VARCHAR(60) NOT NULL,
	MAPNG_FILE_PATH       VARCHAR(100) NOT NULL,
	 PRIMARY KEY (MAPNG_CREAT_ID)
)
;

CREATE UNIQUE INDEX COMTNSITEMAP_PK ON COMTNSITEMAP
(
	MAPNG_CREAT_ID
)
;



CREATE TABLE COMTNMENUCREATDTLS
(
	MENU_NO               NUMERIC(20) NOT NULL,
	AUTHOR_CODE           VARCHAR(30) NOT NULL,
	MAPNG_CREAT_ID        VARCHAR(30) NULL,
	 PRIMARY KEY (MENU_NO,AUTHOR_CODE),
	FOREIGN KEY COMTNMENUCREATDTLS_FK2 (MENU_NO) REFERENCES COMTNMENUINFO(MENU_NO)
		ON DELETE CASCADE,
	FOREIGN KEY COMTNMENUCREATDTLS_FK3 (MAPNG_CREAT_ID) REFERENCES COMTNSITEMAP(MAPNG_CREAT_ID)
		ON DELETE CASCADE,
	FOREIGN KEY COMTNMENUCREATDTLS_FK1 (AUTHOR_CODE) REFERENCES COMTNAUTHORINFO(AUTHOR_CODE)
)
;

CREATE UNIQUE INDEX COMTNMENUCREATDTLS_PK ON COMTNMENUCREATDTLS
(
	MENU_NO,
	AUTHOR_CODE
)
;
CREATE INDEX COMTNMENUCREATDTLS_i02 ON COMTNMENUCREATDTLS
(
	MENU_NO
)
;
CREATE INDEX COMTNMENUCREATDTLS_i03 ON COMTNMENUCREATDTLS
(
	MAPNG_CREAT_ID
)
;
CREATE INDEX COMTNMENUCREATDTLS_i04 ON COMTNMENUCREATDTLS
(
	AUTHOR_CODE
)
;



CREATE TABLE COMTNFILE
(
	ATCH_FILE_ID          CHAR(20) NOT NULL,
	CREAT_DT              DATETIME NOT NULL,
	USE_AT                CHAR(1) NULL,
	 PRIMARY KEY (ATCH_FILE_ID)
)
;

CREATE UNIQUE INDEX COMTNFILE_PK ON COMTNFILE
(
	ATCH_FILE_ID
)
;



CREATE TABLE COMTHEMAILDSPTCHMANAGE
(
	MSSAGE_ID             VARCHAR(20) NULL,
	EMAIL_CN              MEDIUMTEXT NULL,
	SNDR                  VARCHAR(50) NOT NULL,
	RCVER                 VARCHAR(50) NOT NULL,
	SJ                    VARCHAR(60) NOT NULL,
	SNDNG_RESULT_CODE     CHAR(1) NULL,
	DSPTCH_DT             CHAR(20) NOT NULL,
	ATCH_FILE_ID          CHAR(20) NULL,
	 PRIMARY KEY (MSSAGE_ID),
	FOREIGN KEY COMTHEMAILDSPTCHMANAGE_FK2 (ATCH_FILE_ID) REFERENCES COMTNFILE(ATCH_FILE_ID)
)
;

CREATE UNIQUE INDEX COMTHEMAILDSPTCHMANAGE_PK ON COMTHEMAILDSPTCHMANAGE
(
	MSSAGE_ID
)
;
CREATE INDEX COMTHEMAILDSPTCHMANAGE_i01 ON COMTHEMAILDSPTCHMANAGE
(
	SNDR
)
;
CREATE INDEX COMTHEMAILDSPTCHMANAGE_i02 ON COMTHEMAILDSPTCHMANAGE
(
	ATCH_FILE_ID
)
;




CREATE TABLE J_ATTACHFILE 
(
	FILE_ID VARCHAR(13) NOT NULL,
	FILE_SEQ INT NOT NULL,
	FILE_NAME VARCHAR(100) NOT NULL,
	FILE_SIZE INT,
	FILE_MASK VARCHAR(100),
	DOWNLOAD_COUNT INT,
	DOWNLOAD_EXPIRE_DATE VARCHAR(8),
	DOWNLOAD_LIMIT_COUNT INT,
	REG_DATE DATETIME,
	DELETE_YN VARCHAR(1),
PRIMARY KEY (FILE_ID, FILE_SEQ)
)
;

CREATE UNIQUE INDEX J_ATTACHFILE_PK ON J_ATTACHFILE
(
	FILE_ID, FILE_SEQ
)
;
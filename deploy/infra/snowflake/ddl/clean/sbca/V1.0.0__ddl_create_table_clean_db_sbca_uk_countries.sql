/*-- VARIABLES ENVIRONMENT and DATABASE --*/
SET v_env_name='{replace_with_v_env_name}';
SET v_data_engineer_role=concat('data_engineer_role',$v_env_name);
SET v_db_name=concat('clean_db',$v_env_name);

/*-- SCHEMA CONTEXT --*/
USE ROLE identifier($v_data_engineer_role);
USE DATABASE identifier($v_db_name);
USE SCHEMA sbca;

CREATE TABLE IF NOT EXISTS SBCA_UK_COUNTRIES (
	OP VARCHAR(1) NOT NULL COMMENT 'AWS DMS change data capture (CDC) value that indicates whether the row was inserted (I), updated (U), or deleted (D) at the source database for a CDC load to the target.',
	DMS_TIMESTAMP TIMESTAMP_NTZ(6) COMMENT 'AWS DMS timestamp for when the data was transferred from the source to the target by DMS for Full load.timestamp for the commit of that row in the source database for CDC load',
	ID NUMBER(11,0) NOT NULL COMMENT 'Source - autoincrement - ID',
	NAME VARCHAR(255) COMMENT 'Country name. Source default NULL.',
	CODE VARCHAR(2) NOT NULL COMMENT 'Country ISO2 code.',
	CREATED_AT TIMESTAMP_NTZ(0) NOT NULL COMMENT 'Date when the record was created.',
	UPDATED_AT TIMESTAMP_NTZ(0) NOT NULL COMMENT 'Date when the record was updated.',
	LOCALE VARCHAR(255) COMMENT 'Preferred language code. Source default NULL.',
	BASE_CURRENCY_ID NUMBER(11,0) COMMENT 'Source currency ID. Source default NULL.',
	IDENTIFIER VARCHAR(5) NOT NULL COMMENT 'The recommended country ISO2 code to use.',
	CDW_LAST_MODIFIED_TIMESTAMP TIMESTAMP_NTZ(3) NOT NULL COMMENT 'Timestamp when the record was modified in the Corporate Data Warehouse',
	CDW_CDC_FLAG VARCHAR(1) NOT NULL COMMENT 'Change Data Capture flag that indicates whether the row is new (N), has changed (C), or it was deleted (D) compared to the active record in the Corporate Data Warehouse',
	CDW_START_DATE TIMESTAMP_NTZ(0) NOT NULL COMMENT 'Timestamp from when the record is active in the Corporate Data Warehouse',
	CDW_END_DATE TIMESTAMP_NTZ(0) NOT NULL COMMENT 'Timestamp from when the record is inactive in the Corporate Data Warehouse; the active record will have the value 9999-12-31 00:00:00'
);

/*-- REMOVE VARIABLES ENVIRONMENT and DATABASE --*/
unset v_env_name;
unset v_db_name;
UNSET v_data_engineer_role;
/*-- VARIABLES ENVIRONMENT and DATABASE --*/

SET v_env_name='{replace_with_v_env_name}';
SET v_data_engineer_role=concat('data_engineer_role',$v_env_name);
SET v_db_name=concat('clean_db',$v_env_name);

USE ROLE identifier($v_data_engineer_role);
USE DATABASE identifier($v_db_name);

/*-- CREATE SCHEMA --*/
CREATE SCHEMA IF NOT EXISTS dnb;

UNSET v_env_name;
UNSET v_data_engineer_role;
UNSET v_db_name;
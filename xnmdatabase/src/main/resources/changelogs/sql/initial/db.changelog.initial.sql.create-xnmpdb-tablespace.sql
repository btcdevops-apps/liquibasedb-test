--liquibase formatted sql
---XMN DATAFILES--
CREATE BIGFILE TABLESPACE xnm_big_tbs_01
  DATAFILE '/opt/oracle/oradata/XE/XNMPDB/xnm_big_tbs_01.dat'
  SIZE 20M AUTOEXTEND ON;

CREATE UNDO TABLESPACE xnm_undo_tbs_01
   DATAFILE '/opt/oracle/oradata/XE/XNMPDB/xnm_undo_tbs_01.dbf'
   SIZE 10M AUTOEXTEND ON
   RETENTION GUARANTEE;

CREATE TEMPORARY TABLESPACE xnm_temp_tbs_01
   TEMPFILE '/opt/oracle/oradata/XE/XNMPDB/xnm_temp_tbs_01.dbf' SIZE 5M AUTOEXTEND ON;

---CREATE LIQUIBASE USER AND SCHEMAS---
create tablespace xnm_liqui_tbs_01 DATAFILE '/opt/oracle/oradata/XE/XNMPDB/xnm_liquibase_01.dbf' SIZE 20M AUTOEXTEND ON;
--Create schema for Liquibase tool
create user liquibase identified by liquibase default tablespace xnm_liqui_tbs_01 temporary tablespace "XNM_TEMP_TBS_01" account unlock;

ALTER USER liquibase QUOTA UNLIMITED ON SYSTEM;
ALTER USER liquibase QUOTA UNLIMITED ON SYSAUX;
ALTER USER liquibase QUOTA UNLIMITED ON xnm_liqui_tbs_01;

-------------------------------------------------------------------------------------
grant create session to liquibase;
grant create synonym to liquibase;
grant create table to liquibase;
grant create sequence to liquibase;

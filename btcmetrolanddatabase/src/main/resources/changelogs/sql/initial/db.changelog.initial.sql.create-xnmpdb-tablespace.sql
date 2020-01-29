--liquibase formatted sql
---XMN DATAFILES--
CREATE BIGFILE TABLESPACE xnm_big_tbs_01
  DATAFILE '/u01/app/oracle/oradata/ORCL18/xnmpdb/xnm_big_tbs_01.dat'
  SIZE 20M AUTOEXTEND ON;

CREATE UNDO TABLESPACE xnm_undo_tbs_01
   DATAFILE '/u01/app/oracle/oradata/ORCL18/xnmpdb/xnm_undo_tbs_01.dbf'
   SIZE 10M AUTOEXTEND ON
   RETENTION GUARANTEE;

CREATE TEMPORARY TABLESPACE xnm_temp_tbs_01
   TEMPFILE '/u01/app/oracle/oradata/ORCL18/xnmpdb/xnm_temp_tbs_01.dbf' SIZE 5M AUTOEXTEND ON;

---CREATE LIQUIBASE USER AND SCHEMAS---
create tablespace xnm_liqui_tbs_01 DATAFILE '/u01/app/oracle/oradata/ORCL18/xnmpdb/xnm_liquibase_01.dbf' SIZE 20M AUTOEXTEND ON;
--Create schema for Liquibase tool
create user liquibase identified by liquibase default tablespace xnm_liqui_tbs_01 temporary tablespace "XNM_TEMP_TBS_01" account unlock;


---EXECUTE FROM WITHIN XNMPDB SQL ($ORACLE_HOME/bin/sqlplus sys/Oracle18@localhost/xnmpdb as sysdba)--
ALTER USER liquibase QUOTA UNLIMITED ON SYSTEM;
ALTER USER liquibase QUOTA UNLIMITED ON SYSAUX;
ALTER USER liquibase QUOTA UNLIMITED ON xnm_liqui_tbs_01;

-------------------------------------------------------------------------------------
grant create session to liquibase;
grant create synonym to liquibase;
grant create table to liquibase;
grant create sequence to liquibase;

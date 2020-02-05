--liquibase formatted sql
---XMN DATAFILES--
CREATE BIGFILE TABLESPACE demodb_big_tbs_01
  DATAFILE '/u01/app/oracle/oradata/ORCL18/liquibasepdb/demodb_big_tbs_01.dat'
  SIZE 20M AUTOEXTEND ON;

CREATE UNDO TABLESPACE demodb_undo_tbs_01
   DATAFILE '/u01/app/oracle/oradata/ORCL18/liquibasepdb/demodb_undo_tbs_01.dbf'
   SIZE 10M AUTOEXTEND ON
   RETENTION GUARANTEE;

CREATE TEMPORARY TABLESPACE demodb_temp_tbs_01
   TEMPFILE '/u01/app/oracle/oradata/ORCL18/liquibasepdb/demodb_temp_tbs_01.dbf' SIZE 5M AUTOEXTEND ON;

---CREATE LIQUIBASE USER AND SCHEMAS---
create tablespace demodb_liqui_tbs_01 DATAFILE '/u01/app/oracle/oradata/ORCL18/liquibasepdb/demodb_liquibase_01.dbf' SIZE 20M AUTOEXTEND ON;
--Create schema for Liquibase tool
create user liquibase identified by liquibase default tablespace demodb_liqui_tbs_01 temporary tablespace "demodb_TEMP_TBS_01" account unlock;


---EXECUTE FROM WITHIN liquibasepdb SQL ($ORACLE_HOME/bin/sqlplus sys/Oracle18@localhost/liquibasepdb as sysdba)--
ALTER USER liquibase QUOTA UNLIMITED ON SYSTEM;
ALTER USER liquibase QUOTA UNLIMITED ON SYSAUX;
ALTER USER liquibase QUOTA UNLIMITED ON demodb_liqui_tbs_01;

-------------------------------------------------------------------------------------
grant create session to liquibase;
grant create synonym to liquibase;
grant create table to liquibase;
grant create sequence to liquibase;

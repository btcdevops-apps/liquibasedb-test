--liquibase formatted sql


create pluggable database liquibasepdb admin user liquibasepdb_admin identified by liquibasepdb_admin file_name_convert = ('/u01/app/oracle/oradata/ORCLCDB/pdbseed','/u01/app/oracle/oradata/ORCLCDB/liquibasepdb');
alter pluggable database liquibasepdb open read write;
select vp.name, vp.open_mode from v$pdbs vp;

sqlplus sys/oracle@localhost/liquibasepdb as sysdba;
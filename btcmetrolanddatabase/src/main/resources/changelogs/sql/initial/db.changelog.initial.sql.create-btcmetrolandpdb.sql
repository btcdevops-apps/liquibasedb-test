--liquibase formatted sql


create pluggable database btcmetrolandpdb admin user btcmetrolandpdb_admin identified by btcmetrolandpdb_admin file_name_convert = ('/u01/app/oracle/oradata/ORCLCDB/pdbseed','/u01/app/oracle/oradata/ORCLCDB/btcmetrolandpdb');
alter pluggable database btcmetrolandpdb open read write;
select vp.name, vp.open_mode from v$pdbs vp;

sqlplus sys/oracle@localhost/btcmetrolandpdb as sysdba;
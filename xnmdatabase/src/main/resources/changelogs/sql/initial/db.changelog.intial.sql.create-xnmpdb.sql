--liquibase formatted sql

create pluggable database xnmpdb admin user xnmpdb_admin identified by xnmpdb_admin file_name_convert = ('/opt/oracle/oradata/XE/pdbseed','/opt/oracle/oradata/XE/XNMPDB');

select vp.name, vp.open_mode from v$pdbs vp;

alter pluggable database xnmpdb open read write;
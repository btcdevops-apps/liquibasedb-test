--liquibase formatted sql


create pluggable database xnmpdb admin user xnmpdb_admin identified by xnmpdb_admin file_name_convert = ('/u01/app/oracle/oradata/ORCL18','/u01/app/oracle/oradata/ORCL18/xnmpdb');
select vp.name, vp.open_mode from v$pdbs vp;
alter pluggable database xnmpdb open read write;
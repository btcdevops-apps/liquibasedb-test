--liquibase formatted sql

-- USER SQL
ALTER USER "XNMPDB_ADMIN" DEFAULT TABLESPACE "XNM_BIG_TBS_01" TEMPORARY TABLESPACE "XNM_TEMP_TBS_01" ACCOUNT UNLOCK ;
-- QUOTAS

-- ROLES
ALTER USER "XNMPDB_ADMIN" DEFAULT ROLE "PDB_DBA";
-- SYSTEM PRIVILEGES

-- USER SQL
ALTER USER "XNMPDB_ADMIN"
DEFAULT TABLESPACE "XNM_BIG_TBS_01"
TEMPORARY TABLESPACE "XNM_TEMP_TBS_01"
ACCOUNT UNLOCK ;

-- QUOTAS
ALTER USER "XNMPDB_ADMIN" QUOTA UNLIMITED ON SYSTEM;
ALTER USER "XNMPDB_ADMIN" QUOTA UNLIMITED ON SYSAUX;
ALTER USER "XNMPDB_ADMIN" QUOTA UNLIMITED ON XNM_BIG_TBS_01;

-- ROLES
GRANT "DBA" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "DV_MONITOR" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "CTXAPP" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "DV_AUDIT_CLEANUP" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "EM_EXPRESS_ALL" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "WM_ADMIN_ROLE" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "OLAP_USER" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "OLAP_XS_ADMIN" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "DV_SECANALYST" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "RECOVERY_CATALOG_OWNER_VPD" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "XS_CACHE_ADMIN" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "GDS_CATALOG_SELECT" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "SCHEDULER_ADMIN" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "PROVISIONER" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "AUDIT_ADMIN" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "XDB_WEBSERVICES_OVER_HTTP" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "DV_REALM_RESOURCE" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "AQ_ADMINISTRATOR_ROLE" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "SYSUMF_ROLE" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "APPLICATION_TRACE_VIEWER" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "XDB_WEBSERVICES" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "DV_PUBLIC" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "LBAC_DBA" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "OPTIMIZER_PROCESSING_RATE" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "RECOVERY_CATALOG_USER" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "DV_DATAPUMP_NETWORK_LINK" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "GSMUSER_ROLE" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "GATHER_SYSTEM_STATISTICS" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "LOGSTDBY_ADMINISTRATOR" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "DBJAVASCRIPT" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "GSM_POOLADMIN_ROLE" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "DV_ADMIN" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "DV_POLICY_OWNER" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "HS_ADMIN_ROLE" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "XS_SESSION_ADMIN" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "DV_GOLDENGATE_ADMIN" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "IMP_FULL_DATABASE" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "DV_XSTREAM_ADMIN" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "DV_PATCH_ADMIN" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "GGSYS_ROLE" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "DATAPUMP_EXP_FULL_DATABASE" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "EJBCLIENT" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "HS_ADMIN_EXECUTE_ROLE" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "JMXSERVER" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "OLAP_DBA" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "ADM_PARALLEL_EXECUTE_TASK" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "JAVAIDPRIV" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "SELECT_CATALOG_ROLE" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "JAVADEBUGPRIV" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "CONNECT" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "DATAPUMP_IMP_FULL_DATABASE" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "SODA_APP" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "OEM_MONITOR" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "GSMADMIN_ROLE" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "AQ_USER_ROLE" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "JAVAUSERPRIV" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "XDB_SET_INVOKER" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "RECOVERY_CATALOG_OWNER" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "JAVA_ADMIN" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "DBFS_ROLE" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "RDFCTX_ADMIN" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "DV_GOLDENGATE_REDO_ACCESS" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "CDB_DBA" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "JAVASYSPRIV" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "HS_ADMIN_SELECT_ROLE" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "AUDIT_VIEWER" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "RESOURCE" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "DV_OWNER" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "XDB_WEBSERVICES_WITH_PUBLIC" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "EXECUTE_CATALOG_ROLE" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "DATAPATCH_ROLE" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "DV_ACCTMGR" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "DV_REALM_OWNER" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "EXP_FULL_DATABASE" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "DBMS_MDX_INTERNAL" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "DV_STREAMS_ADMIN" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "XS_NAMESPACE_ADMIN" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "ORDADMIN" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "AUTHENTICATEDUSER" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "CAPTURE_ADMIN" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "OEM_ADVISOR" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "XS_CONNECT" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "XDBADMIN" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT "EM_EXPRESS_BASIC" TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
ALTER USER "XNMPDB_ADMIN" DEFAULT ROLE "PDB_DBA";

-- SYSTEM PRIVILEGES
GRANT CREATE JOB TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY CONTEXT TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT UPDATE ANY CUBE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY ANALYTIC VIEW TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY TRIGGER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY SQL TRANSLATION PROFILE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT MANAGE ANY FILE GROUP TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER PUBLIC DATABASE LINK TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT MANAGE FILE GROUP TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY INDEX TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY SEQUENCE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER PROFILE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT INHERIT ANY PRIVILEGES TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT UNDER ANY TABLE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT KEEP SYSGUID TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ASSEMBLY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY LIBRARY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY EDITION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ROLE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE LIBRARY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ROLLBACK SEGMENT TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE TRIGGER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY PROCEDURE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ADMINISTER DATABASE TRIGGER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY MEASURE FOLDER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY PROCEDURE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY OUTLINE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY ANALYTIC VIEW TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT EXECUTE ANY INDEXTYPE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT USE ANY JOB RESOURCE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY DIRECTORY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY RULE SET TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT USE ANY SQL TRANSLATION PROFILE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY MINING MODEL TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DEBUG CONNECT SESSION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT LOGMINING TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY ATTRIBUTE DIMENSION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY MINING MODEL TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE LOCKDOWN PROFILE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER SESSION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE MATERIALIZED VIEW TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE PLUGGABLE DATABASE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY ANALYTIC VIEW TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT WRITE ANY ANALYTIC VIEW CACHE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT MERGE ANY VIEW TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY INDEX TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT READ ANY ANALYTIC VIEW CACHE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE DIMENSION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT EXECUTE ANY RULE SET TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE SQL TRANSLATION PROFILE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY MATERIALIZED VIEW TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT AUDIT SYSTEM TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE OPERATOR TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT MANAGE ANY QUEUE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY SQL PROFILE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT GRANT ANY OBJECT PRIVILEGE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE INDEXTYPE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT AUDIT ANY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT INHERIT ANY REMOTE PRIVILEGES TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT SYSKM TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DEBUG ANY PROCEDURE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY MEASURE FOLDER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY SEQUENCE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE MEASURE FOLDER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT UPDATE ANY CUBE BUILD PROCESS TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE VIEW TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER DATABASE LINK TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY ASSEMBLY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY SQL TRANSLATION PROFILE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY EVALUATION CONTEXT TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT SELECT ANY MINING MODEL TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DELETE ANY CUBE DIMENSION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY TABLE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY ATTRIBUTE DIMENSION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE SESSION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE RULE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT BECOME USER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT SELECT ANY CUBE BUILD PROCESS TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT SELECT ANY TABLE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT INSERT ANY MEASURE FOLDER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY SQL PROFILE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT FORCE ANY TRANSACTION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DELETE ANY TABLE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY SEQUENCE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT SELECT ANY CUBE DIMENSION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY EDITION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE EXTERNAL JOB TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT EM EXPRESS CONNECT TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY MATERIALIZED VIEW TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY CUBE BUILD PROCESS TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT FLASHBACK ANY TABLE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY RULE SET TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT BACKUP ANY TABLE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY CUBE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE CREDENTIAL TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE TABLE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT EXECUTE ANY LIBRARY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY OUTLINE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT EXECUTE ASSEMBLY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY HIERARCHY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANALYTIC VIEW TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY DIMENSION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY TABLE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ADMINISTER KEY MANAGEMENT TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY CLUSTER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT EXECUTE ANY CLASS TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY CUBE BUILD PROCESS TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY CREDENTIAL TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY DIMENSION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT SYSBACKUP TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY RULE SET TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT SELECT ANY SEQUENCE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT UNDER ANY TYPE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT MANAGE TABLESPACE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY OPERATOR TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY OPERATOR TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY HIERARCHY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT EXEMPT IDENTITY POLICY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE TYPE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE TABLESPACE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT SELECT ANY TRANSACTION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DELETE ANY MEASURE FOLDER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY CUBE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT LOCK ANY TABLE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE EVALUATION CONTEXT TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY TYPE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ADVISOR TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE PUBLIC DATABASE LINK TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ANALYZE ANY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ATTRIBUTE DIMENSION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY RULE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT INSERT ANY CUBE DIMENSION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ROLLBACK SEGMENT TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY JOB TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER USER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT QUERY REWRITE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT SELECT ANY DICTIONARY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE PUBLIC SYNONYM TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT GLOBAL QUERY REWRITE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY CUBE DIMENSION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY CUBE DIMENSION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY CLUSTER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY RULE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT UPDATE ANY CUBE DIMENSION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT SYSDBA TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ADMINISTER RESOURCE MANAGER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY SYNONYM TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY SYNONYM TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY MINING MODEL TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT EXECUTE ANY PROCEDURE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE SYNONYM TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT SET CONTAINER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT EXECUTE ANY PROGRAM TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT EXEMPT REDACTION POLICY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT EXECUTE ANY TYPE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ON COMMIT REFRESH TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DEBUG CONNECT ANY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE SEQUENCE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE HIERARCHY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT SELECT ANY MEASURE FOLDER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT COMMENT ANY MINING MODEL TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ADMINISTER SQL TUNING SET TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT SYSOPER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY INDEXTYPE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT KEEP DATE TIME TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY INDEX TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT RESTRICTED SESSION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT SYSDG TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DEQUEUE ANY QUEUE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ANALYZE ANY DICTIONARY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY INDEXTYPE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT TRANSLATE ANY SQL TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ADMINISTER ANY SQL TUNING SET TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE USER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT EXECUTE ANY OPERATOR TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE CUBE BUILD PROCESS TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE PROFILE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY ROLE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT UPDATE ANY TABLE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY LIBRARY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY VIEW TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY CLUSTER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT EXECUTE ANY RULE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER TABLESPACE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT UNDER ANY VIEW TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT EXECUTE ANY ASSEMBLY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT GRANT ANY PRIVILEGE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY TRIGGER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY VIEW TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER LOCKDOWN PROFILE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT EXPORT FULL DATABASE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY MEASURE FOLDER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY EVALUATION CONTEXT TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT TEXT DATASTORE ACCESS TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT FLASHBACK ARCHIVE ADMINISTER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT IMPORT FULL DATABASE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY OUTLINE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT COMMENT ANY TABLE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT READ ANY TABLE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE DATABASE LINK TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP PUBLIC SYNONYM TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP USER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CHANGE NOTIFICATION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE MINING MODEL TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT INSERT ANY TABLE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP LOCKDOWN PROFILE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP PROFILE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY MATERIALIZED VIEW TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE RULE SET TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT EXEMPT ACCESS POLICY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT MANAGE SCHEDULER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT READ ANY FILE GROUP TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT FORCE TRANSACTION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY CUBE BUILD PROCESS TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY TYPE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY PROCEDURE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY SQL TRANSLATION PROFILE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP PUBLIC DATABASE LINK TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY INDEXTYPE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY SQL PROFILE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER SYSTEM TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT UNLIMITED TABLESPACE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY ROLE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY DIMENSION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY CUBE DIMENSION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY CUBE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY TRIGGER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY ASSEMBLY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY TABLE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ADMINISTER SQL MANAGEMENT OBJECT TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY DIRECTORY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ENQUEUE ANY QUEUE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY EVALUATION CONTEXT TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY ASSEMBLY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY TYPE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT REDEFINE ANY TABLE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE CLUSTER TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY CONTEXT TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT EXECUTE ANY EVALUATION CONTEXT TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT RESUMABLE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY LIBRARY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP ANY EDITION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE PROCEDURE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER DATABASE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT SELECT ANY CUBE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT GRANT ANY ROLE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY RULE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE ANY ATTRIBUTE DIMENSION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE CUBE DIMENSION TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY OPERATOR TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT CREATE CUBE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER RESOURCE COST TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ANY HIERARCHY TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT DROP TABLESPACE TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT ALTER ROLLBACK SEGMENT TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
GRANT PURGE DBA_RECYCLEBIN TO "XNMPDB_ADMIN" WITH ADMIN OPTION;
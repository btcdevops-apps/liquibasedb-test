CREATE OR REPLACE PROCEDURE xnm_drop_preference(p_name in VARCHAR2) AS
BEGIN
    ctx_ddl.drop_preference(p_name);
END xnm_drop_preference;

/
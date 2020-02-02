CREATE OR REPLACE PROCEDURE xnm_drop_stoplist(p_name in VARCHAR2) IS
BEGIN
    ctx_ddl.drop_stoplist(p_name);
END xnm_drop_stoplist;
/
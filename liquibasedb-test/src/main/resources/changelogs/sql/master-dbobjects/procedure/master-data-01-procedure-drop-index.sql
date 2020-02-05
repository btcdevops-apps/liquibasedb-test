CREATE OR REPLACE PROCEDURE xnm_drop_index( p_name in VARCHAR2) IS
BEGIN
    EXECUTE IMMEDIATE 'drop index ' || p_name;
END xnm_drop_index;

/
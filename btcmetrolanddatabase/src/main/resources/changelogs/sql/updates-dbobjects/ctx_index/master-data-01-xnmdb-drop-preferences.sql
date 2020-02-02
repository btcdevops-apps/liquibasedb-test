begin
    ctx_ddl.drop_preference('phy_address_datastore');
    ctx_ddl.drop_preference('phy_address_wordlist');
    ctx_ddl.drop_preference('phy_address_lexer');
    ctx_ddl.drop_stoplist('phy_address_stoplist');
    EXCEPTION
    WHEN OTHERS THEN NULL;
end;
begin
    ctx_ddl.drop_preference('address_datastore');
    ctx_ddl.drop_preference('address_wordlist');
    ctx_ddl.drop_preference('address_lexer');
    ctx_ddl.drop_stoplist('address_stoplist');
    EXCEPTION
    WHEN OTHERS THEN NULL;
end;
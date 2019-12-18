begin
    EXECUTE IMMEDIATE 'create index btc_address_search_index on btc_global_address(ADDRESS_LINE_1)indextype is ctxsys.context parameters(''datastore address_datastore wordlist address_wordlist lexer address_lexer stoplist address_stoplist sync (on commit)'')';
end;

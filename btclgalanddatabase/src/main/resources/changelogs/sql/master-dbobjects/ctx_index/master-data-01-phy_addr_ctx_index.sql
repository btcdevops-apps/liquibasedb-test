begin
    EXECUTE IMMEDIATE 'create index phy_address_search_index on xnm_physical_address(XNM_ADDRESS_LINE_1)indextype is ctxsys.context parameters(''datastore phy_address_datastore wordlist phy_address_wordlist lexer phy_address_lexer stoplist phy_address_stoplist sync (on commit)'')';
end;

comment on table metro_text_info is 'rows for text labels and values for any row in other master tables e.g. description, title, contact number';
comment on column metro_text_info.owner_table_name is 'master table name e.g. METRO_ASSET_TYPE';
comment on column metro_text_info.owner_table_pk is 'the primary key id for the master table';
comment on column metro_text_info.text_label is 'the ui label value for the row';
comment on column metro_text_info.text_info is 'the ui value for the label';

comment on table metro_numeric_info is 'rows for numeric labels and values for any row in other master tables e.g. weight, height, volume';
comment on column metro_numeric_info.owner_table_name is 'master table name e.g. METRO_ASSET_TYPE';
comment on column metro_numeric_info.owner_table_pk is 'the primary key id for the master table';
comment on column metro_numeric_info.numeric_label is 'the ui label value for the row';
comment on column metro_numeric_info.numeric_value is 'the ui value for the label';

comment on table metro_customer is 'details of customers to be used in registrations and other forms of transactions';
comment on column metro_customer.current_address_id is 'fk to geoaddress services';

comment on table metro_cust_identity is 'stores identification records of customers, e.g. photos, scanned documents';

comment on table metro_service_type is 'lookup table of service types provided my metropolis management';
comment on column metro_service_type.service_type_name is 'registration, lease, rent, sale, construction, security etc';
comment on column metro_service_type.service_type_description is 'Official description of service type';

comment on table metro_services_catalogue is 'individual  services provided by metropolis management e.g. birth registration';
comment on column metro_services_catalogue.service_type_id is 'fk to metro_service_type';
comment on column metro_services_catalogue.service_owner_account is 'fk to metro_account';
comment on column metro_services_catalogue.service_name is 'notice of marriage, indegenship, birth/death notification, shop rent';

comment on table METRO_REGISTRATION_FORM is 'all data for registration services e.g. birth registration, indigene. . column prefix identifies form types';
comment on COLUMN METRO_REGISTRATION_FORM.SERVICE_ID is 'FK TO METRO_SERVICES_CATALOGUE.SERVICE_ID';
comment on COLUMN METRO_REGISTRATION_FORM.NOM_DELIVERED_BY is 'need to verify WHAT THIS MEANS WITH PRODUCT OWNER';

comment on table metro_form_customer_link is 'registrations for customers data';

comment on table METRO_ASSET_TYPE is 'lookup table of values e.g. car, truck, market, residential house, residential flat, commercial building, land, water source, market, school ';

comment on table metro_asset is 'buildings and other properties, cars';
comment on column metro_asset.asset_serial is 'unqiue service generated';
comment on column metro_asset.asset_name is 'descriptive name of asset where it is a shop in a block, a unique identifier of that shop';
comment on column metro_asset.asset_status is 'in use, sold, leased, demolished, vacated, unknown';
comment on column metro_asset.address_id is 'fk to geo services';

comment on table metro_asset_identity is 'stores all e-documentation of an asset e.g. photos, certiticates, plans, ';
comment on column metro_asset_identity.storage_url is 'web url to remote file storage such as amazon s3 bucket';

comment on table METRO_OWNERSHIP_TYPE is 'lookup table of types of ownership for metro assets, e.g. LEASE, SALE, MANAGE,OWNER';

comment on table metro_asset_ownership is 'asset ownership information';
comment on column metro_asset_ownership.asset_id is 'fk to metro_asset';
comment on column metro_asset_ownership.service_id is 'fk to metro_service_catalogue. this will match the ownership_type name or id';
comment on column metro_asset_ownership.ownership_type_id is 'fk to metro_ownership_type';
comment on column metro_asset_ownership.customer_id is 'fk to metro_customer';
comment on column metro_asset_ownership.asset_owner_id is 'fk to metro_account';
comment on column metro_asset_ownership.start_date is 'ownership due start date';
comment on column metro_asset_ownership.end_date is 'ownership enddate';
comment on column metro_asset_ownership.ownership_serial is 'service generated unique serial';
comment on column metro_asset_ownership.ownership_status is 'active, expired, future, pending';
comment on column metro_asset_ownership.previous_owner_account is 'fk to previous owner';
comment on column metro_asset_ownership.transfer_completed_on is 'date ownership request [lease,sale, rent] by customer was completed by asset owner team';
comment on column metro_asset_ownership.transfer_requested_on is 'date ownership request was requested by customer [lease,sale, rent]';
comment on column metro_asset_ownership.transfer_started_on is 'date back office started processing transaction';
comment on column metro_asset_ownership.transfer_approved_by is 'xnm userid of agent that completed transaction';
comment on column metro_asset_ownership.transfer_status is 'approved, declined, rejected, cancelled, void';
comment on column metro_asset_ownership.transaction_id is 'fk to master transfer table of transactions';

comment on table metro_account is 'metro manager will have an account and its metro_account_users are link with association.';
comment on column metro_account.account_serial is 'unique serial assigned by entity on create';

comment on table metro_account_user is 'all users and customers will have a record';

comment on table METRO_ACCOUNT_USER_ASSOC is 'links metro_account_user records to one or more metro_account[s]';

COMMENT ON TABLE METRO_TXNCART_HEADER IS 'MAINTAINS ALL TRANSACTION CONTAINERS';
COMMENT ON COLUMN METRO_TXNCART_HEADER.STAFF_KEY IS 'FK USER_ID';
COMMENT ON COLUMN METRO_TXNCART_HEADER.TXN_TOTAL IS 'TOTAL VALUE OF CART ITEMS';
COMMENT ON COLUMN METRO_TXNCART_HEADER.METRO_ENTITYKEY IS 'VH KEY, PARTNER KEY';
COMMENT ON COLUMN METRO_TXNCART_HEADER.METRO_ENTITYSERIAL IS 'VH, PARTNER PROFILE SERIAL';
COMMENT ON COLUMN METRO_TXNCART_HEADER.PAYMT_GATEWAY_TXN_REF IS 'POS Receipt Number,..';
COMMENT ON COLUMN METRO_TXNCART_HEADER.PAYMT_TYPE IS 'CASH, EPAY,POS';
COMMENT ON COLUMN METRO_TXNCART_HEADER.VERIFY_ENDPOINT IS 'WEBSERVICE ENDPOINT';

COMMENT ON TABLE METRO_TXNCART_ITEM IS 'CART LINE ITEMS';
COMMENT ON COLUMN METRO_TXNCART_ITEM.CATTITEM_ID IS 'PRIMARY KEY';
COMMENT ON COLUMN METRO_TXNCART_ITEM.SERVICE_ID IS 'FK TO SERVICE_TYPE_ID';
COMMENT ON COLUMN METRO_TXNCART_ITEM.SERVICE_TYPE_ID IS 'FK TO SERVICE_TYPE_ID';
COMMENT ON COLUMN METRO_TXNCART_ITEM.SERVICE_TYPE_CODE IS 'FK TO SERVICE_TYPE.SERVICE_TYPE_CODE';
COMMENT ON COLUMN METRO_TXNCART_ITEM.SERVICE_TYPE_NAME IS 'FK TO SERVICE_TYPE.SERVICE_TYPE_NAME';
COMMENT ON COLUMN METRO_TXNCART_ITEM.SERVICE_TYPE_DESCRIPTION IS 'FK TO SERVICE_TYPE.SERVICE_TYPE_DESCRIPTION';
COMMENT ON COLUMN METRO_TXNCART_ITEM.SOURCE_TBL_NAME IS 'NAME OF TABLE E.G. METRO_REGISTRATION_FORM';
COMMENT ON COLUMN METRO_TXNCART_ITEM.SOURCE_TBL_KEY IS 'TABLE PRIMARY KEY VALUE E.G. METRO_REGISTRATION_FORM.REGFORMID';
COMMENT ON COLUMN METRO_TXNCART_ITEM.ITEM_ISSUE_SERIAL IS 'SERIAL NUMBER OF ITEM ISSUED E.G BC SERIAL, TENENCY SERIAL NO ETC';

COMMENT ON COLUMN METRO_TXNCART_ITEM.CREATED_ON IS 'DATE AND TIME RECORD CREATED';
COMMENT ON COLUMN METRO_TXNCART_ITEM.POI_ID IS 'LOCATION ID OF TRANSACTION';
COMMENT ON COLUMN METRO_TXNCART_ITEM.ISSUEAGENT_KEY IS 'FK TO METRO_USER ISSUING AGENT STAFF KEY';

COMMENT ON COLUMN METRO_TXNCART_ITEM.TRANSACTION_CART_ID IS 'CART ID';
COMMENT ON COLUMN METRO_TXNCART_ITEM.TRANSACTION_PRICE IS 'SUBSCRITION PRICE';
COMMENT ON COLUMN METRO_TXNCART_ITEM.BASEPRICE_ID IS 'BASEPRICE KEY';
COMMENT ON COLUMN METRO_TXNCART_ITEM.SUBSCRIPTION_STATUS IS 'ACT,EXP,CANX';
COMMENT ON COLUMN METRO_TXNCART_ITEM.SUBSCRIPTION_EXPIRES_ON IS 'EXPIRY DATE OF SUBSCRIPTION';
COMMENT ON COLUMN METRO_TXNCART_ITEM.SUBSCRIPTION_VALIDFROM IS 'VALID FROM DATE OF SUBSCRIPTION';
COMMENT ON COLUMN METRO_TXNCART_ITEM.CUSTOMER_ID IS 'FK TO METRO_CUSTOMER';
COMMENT ON COLUMN METRO_TXNCART_ITEM.SERVICEPROVIDER_ID IS 'FK TO METRO_ACCOUNT';

COMMENT ON COLUMN METRO_TXNCART_ITEM.PRICE_CURRENCY IS 'ENDVI_PRODUCTKEY';
COMMENT ON COLUMN METRO_TXNCART_ITEM.PAYMT_WAIVED IS 'FLAG Y IF PAYMENT IS WAIVED';
COMMENT ON COLUMN METRO_TXNCART_ITEM.COMMENTS IS 'MANDATORY IF PAYMENT IS WAIVED';

COMMENT ON TABLE BASE_PRICE_MODEL IS 'CONFIGURATION FOR ALL SERVICE PRICES';
COMMENT ON COLUMN BASE_PRICE_MODEL.PRICE IS 'PRICE PER UNIT';
COMMENT ON COLUMN BASE_PRICE_MODEL.VAT IS 'VALUE ADDED TAX PERCENT TO APPLY';


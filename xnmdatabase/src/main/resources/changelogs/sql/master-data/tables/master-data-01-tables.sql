CREATE TABLE XNM_TEXT_INFO
(
  XNM_TEXT_INFO_ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 4999999999999 START WITH 4000000000000 NOT NULL
, XNM_OWNER_TABLE_NAME VARCHAR2(500) NOT NULL
, XNM_OWNER_TABLE_PK NUMBER NOT NULL
, TEXT_LABEL VARCHAR2(100) NOT NULL
, TEXT_INFO VARCHAR2(2000)
, CONSTRAINT XNM_TEXT_INFO_PK PRIMARY KEY
  (
    XNM_OWNER_TABLE_NAME
  , XNM_OWNER_TABLE_PK
  , TEXT_LABEL
  )
  ENABLE
);

CREATE TABLE XNM_NUMERIC_INFO(
    XNM_NUMERIC_INFO_ID NUMBER  GENERATED ALWAYS AS IDENTITY INCREMENT BY 4999999999999 START WITH 4000000000000 NOT NULL,
    XNM_OWNER_TABLE_NAME VARCHAR2(500),
    XNM_OWNER_TABLE_PK NUMBER,
    NUMERIC_LABEL VARCHAR2(100),
    NUMERIC_VALUE NUMBER,
    CONSTRAINT XNM_NUMERIC_INFO_PK PRIMARY KEY (
        XNM_OWNER_TABLE_NAME
      , XNM_OWNER_TABLE_PK
      , NUMERIC_LABEL
      ) ENABLE
);
CREATE TABLE XNM_ACCOUNT
(
  XNM_ACCOUNT_ID NUMBER
, XNM_ACCOUNT_TYPE VARCHAR2(30)
, XNM_ACCOUNT_SERIAL VARCHAR2(100)
, XNM_ACCOUNT_CREATEDTIMESTAMP TIMESTAMP DEFAULT SYSTIMESTAMP
, XNM_ACCOUNT_CREATEDBY VARCHAR2(100)
, XNM_ACCOUNT_LASTUPDATED TIMESTAMP
, XNM_ACCOUNT_LASTUPDATEDBY VARCHAR2(100)
, XNM_ACCOUNT_REGISTERED_ON TIMESTAMP DEFAULT SYSTIMESTAMP
, ACCOUNT_STATUS VARCHAR2(20) DEFAULT 'ACTIVE'
, DEFAULT_TIMEZONE VARCHAR2(20)
, ACCOUNT_COUNTRY VARCHAR2(70)
, ACCOUNT_STATE VARCHAR2(70)
, ACCOUNT_CITY VARCHAR2(70)
, ACCOUNT_TOWN VARCHAR2(70)
, PRI_ACCOUNT_DOMAIN VARCHAR2(80)
, CONSTRAINT XNM_ACCOUNT_PK PRIMARY KEY
  (
    XNM_ACCOUNT_ID
  )
  ENABLE
);

CREATE TABLE XNM_USER
(
  XNM_PROFILE_ID NUMBER
, XNM_PROFILE_TYPE VARCHAR2(30)
, XNM_PROFILE_DN VARCHAR2(100) NOT NULL
, XNM_PERSON_TTTLE VARCHAR2(5)
, XNM_PROFILE_FIRSTNAME VARCHAR2(100)
, XNM_PROFILE_MIDDLENAME VARCHAR2(100)
, XNM_PROFILE_LASTNAME VARCHAR2(100)
, XNM_PROFILE_BUSINESSNAME VARCHAR2(100)
, XNM_PROFILE_CREATEDTIMESTAMP TIMESTAMP DEFAULT SYSTIMESTAMP
, XNM_PROFILE_CREATEDBY VARCHAR2(100)
, XNM_PROFILE_LASTUPDATED TIMESTAMP
, XNM_PROFILE_LASTUPDATEDBY VARCHAR2(100)
, XNM_ASSOC_ACCOUNT_ID NUMBER
, XNM_PROFILE_STATUS VARCHAR2(20) DEFAULT 'ACTIVE'
, DEFAULT_TIMEZONE VARCHAR2(20)
, CURRENT_COUNTRY VARCHAR2(70)
, CURRENT_STATE VARCHAR2(70)
, CURRENT_CITY VARCHAR2(70)
, CURRENT_TOWN VARCHAR2(70)
, CONSTRAINT XNM_USER_PROFILE_PK PRIMARY KEY(XNM_PROFILE_ID)ENABLE
);


CREATE TABLE XNM_USER_VERIFICATION(
    VERIFICATION_ID NUMBER,
    XNM_PROFILE_ID NUMBER,
    XNM_ACCOUNT_ID NUMBER,
    TOKEN VARCHAR2(400) NOT NULL,
    REQUESTED_BY VARCHAR2(200) NOT NULL,
    CREATED_TIMESTAMP TIMESTAMP DEFAULT SYSTIMESTAMP,
    CREATED_BY VARCHAR2(200),
    LASTUPDATED_ON TIMESTAMP,
    LASTUPDATED_BY VARCHAR2(100),
    TOKEN_VERIFIED_ON TIMESTAMP,
    VERIFIED_FLAG CHAR(1) DEFAULT 'N',
    CONSTRAINT XNM_VERIFICATION_PK PRIMARY KEY(VERIFICATION_ID) ENABLE
);

CREATE TABLE XNM_USER_ACCOUNT_ASSOC
(
    XNM_ASSOCIATION_ID NUMBER,
    XNM_ACCOUNT_ID NUMBER,
    XNM_PROFILE_ID NUMBER,
    XNM_ASSOCIATION_STATUS VARCHAR2(30) DEFAULT 'ACTIVE',
    CREATED_TIMESTAMP TIMESTAMP DEFAULT SYSTIMESTAMP,
    CREATED_BY VARCHAR2(200),
    LAST_UPDATEDTIMESTAMP TIMESTAMP,
    LAST_UPDATEDBY VARCHAR2(200),
    CONSTRAINT XNM_ASSOCIATION_PK PRIMARY KEY (XNM_ASSOCIATION_ID) ENABLE
);

CREATE TABLE XNM_INVENTORY(
    XNM_INVENTORY_ID NUMBER,
    XNM_INVENTORY_ACCOUNTPROFILEID NUMBER,
    INVENTORY_ITEM_ID NUMBER,
    INVENTORY_PRODUCT_ID NUMBER,
    INVENTORY_TYPE VARCHAR2(20),
    INVENTORY_SUBTYPE VARCHAR2(20),
    INVENTORY_BATCH_SERIAL VARCHAR2(120),
    CREATED_ON TIMESTAMP DEFAULT SYSTIMESTAMP,
    CREATED_BY VARCHAR2(200),
    LAST_UPDATEDTIMESTAMP TIMESTAMP,
    LAST_UPDATEDBY VARCHAR2(200),
    ADDED_ON TIMESTAMP,
    ADDED_BY VARCHAR2(200),
    UNITS_ADDED NUMBER,
    ESTIMATED_UNITS_AVAILABLE NUMBER,
    EXPIRES_ON TIMESTAMP,
    CONSUMABLE_FLAG CHAR(1) DEFAULT('N'),
    PERISHABLE_FLAG CHAR(1) DEFAULT('N'),
    ORGANIC_FLAG CHAR(1) DEFAULT('N'),
    SERVICE_FLAG CHAR(1) DEFAULT('N'),
    PRODUCT_FLAG CHAR(1) DEFAULT('N'),
    INVENTORY_STATUS VARCHAR2(10) DEFAULT('PENDING'),
    COMMENTS VARCHAR2(1000),
    CONSTRAINT XNM_INVENTORY_PK PRIMARY KEY (XNM_INVENTORY_ID) ENABLE
);

CREATE TABLE XNM_INVENTORY_STORAGE(
    INVENTORY_STORAGE_ID NUMBER,
    XNM_INVENTORY_ID NUMBER,
    STORAGE_TYPE_NAME VARCHAR2(150),
    MOVE_IN_DATE TIMESTAMP,
    MOVE_OUT_DATE TIMESTAMP,
    MOVE_IN_LOCATION_ID NUMBER,
    CREATED_ON TIMESTAMP DEFAULT SYSTIMESTAMP,
    CREATED_BY VARCHAR2(200),
    LAST_UPDATEDTIMESTAMP TIMESTAMP,
    LAST_UPDATEDBY VARCHAR2(200),
    MAINTAINED_BY NUMBER,
    EXPECTED_STORE_TEMP_MX NUMBER(5,2),
    EXPECTED_STORE_TEMP_MN NUMBER(5,2),
    TEMPERATURE_UNIT CHAR(1) DEFAULT('C'),
    EXPECTED_STORE_HUMIDITY_MX NUMBER(5,2),
    EXPECTED_STORE_HUMIDITY_MN NUMBER(5,2),
    HUMIDITY_UNITS VARCHAR2(50) DEFAULT('PERCENT'),
    NATURALLIGHT_FLAG CHAR(1),
    ORGANIC_STORE_FLAG CHAR(1) DEFAULT('N'),
    PERISHABLE_STORE_FLAG CHAR(1) DEFAULT('N'),
    PERISHABLE_CONTENT_FLAG CHAR(1) DEFAULT('N'),
    SHELF_LIFE_CAL_DAYS NUMBER DEFAULT(7),
    ADDED_BY VARCHAR2(200),
    ADDED_ON TIMESTAMP,
    MOVE_OUT_BY VARCHAR2(200),
    MOVE_IN_BY VARCHAR2(200),
    STORAGE_STATUS VARCHAR2(10),
    STORAGE_VERIFIED_BY_ADMIN CHAR(1) DEFAULT('N'),
    STORAGE_VERIFIED_TIMESTAMP TIMESTAMP,
    STORAGE_VERIFIED_BY VARCHAR2(100),
    CONSTRAINT INVENTORY_STORAGE_PK PRIMARY KEY (INVENTORY_STORAGE_ID) ENABLE
);

CREATE TABLE INVENTORY_WAREHOUSE(
    INVENTORY_WAREHOUSE_ID NUMBER,
    XNM_INVENTORY_ID NUMBER,
    INVENTORY_STORAGE_ID NUMBER,
    MOVE_IN_DATE TIMESTAMP,
    MOVE_OUT_DATE TIMESTAMP,
    MOVE_IN_BY VARCHAR2(200),
    MOVE_OUT_BY VARCHAR2(200),
    CREATED_ON TIMESTAMP DEFAULT SYSTIMESTAMP,
    CREATED_BY VARCHAR2(200),
    LAST_UPDATED_TIMESTMAP TIMESTAMP,
    LAST_UPDATED_BY VARCHAR2(200),
    WAREHOUSE_STATUS VARCHAR2(10),
    CONSTRAINT INVENTORY_WAREHOUSE_PK PRIMARY KEY(INVENTORY_WAREHOUSE_ID) ENABLE
);

CREATE TABLE INVENTORY_STOCK_LEVEL(
    INVENTORY_STOCKLEVEL_ID NUMBER,
    INVENTORY_ID NUMBER,
    INVENTORY_STORAGE_ID NUMBER,
    INVENTORY_WAREHOUSE_ID NUMBER,
    ORIGINAL_STOCKLEVEL NUMBER,
    ESTIMATED_STOCKLEVEL_UNITS NUMBER,
    LAST_ORDER_STOCKUNITS NUMBER,
    UNIT_MEASURE VARCHAR2(20),
    LAST_ORDER_ID NUMBER,
    CREATED_ON TIMESTAMP DEFAULT SYSTIMESTAMP,
    CREATED_BY VARCHAR2(200),
    LAST_UPDATED_TIMESTAMP TIMESTAMP,
    LAST_UPDATED_BY VARCHAR2(200),
    ADDED_ON TIMESTAMP,
    ADDED_BY VARCHAR2(200),
    PREVIOUS_STOCKLEVEL_ID NUMBER,
    CONSTRAINT INVENTORY_STOCKLEVEL_PK PRIMARY KEY(INVENTORY_STOCKLEVEL_ID) ENABLE
);

CREATE TABLE PRODUCT_GENERIC_INFO (
    PRODUCT_ID NUMBER,
    PRODUCT_OWNERACCOUNT_ID NUMBER,
    IS_PUBLIC_FLAG CHAR(1) DEFAULT ('Y'),
    ADDED_BY VARCHAR2(200),
    ADDED_ON TIMESTAMP,
    CREATED_ON TIMESTAMP DEFAULT SYSTIMESTAMP,
    CREATED_BY VARCHAR2(200),
    LAST_UPDATED_BY VARCHAR2(200),
    LAST_UPDATED_TIMESTAMP TIMESTAMP,
    PRODUCT_STATUS VARCHAR2(10),
    PRODUCT_SERIAL VARCHAR2(50),
    CONSTRAINT PRODUCT_GENERIC_INFO_PK PRIMARY KEY (PRODUCT_ID) ENABLE
);

CREATE TABLE INVENTORY_ITEM(
    INVENTORY_ITEM_ID NUMBER,
    PRODUCT_ID NUMBER,
    CREATED_ON TIMESTAMP DEFAULT SYSTIMESTAMP,
    CREATED_BY VARCHAR2(200),
    LAST_UPDATED_BY VARCHAR2(200),
    LAST_UPDATED_TIMESTAMP TIMESTAMP,
    INVENTORY_ITEM_STATUS VARCHAR2(20),
    ITEMTYPE_SERIALNO VARCHAR2(200),
    ADDED_ON TIMESTAMP,
    ADDED_BY VARCHAR2(200),
    INVENTORY_OWNER NUMBER,
    CONSTRAINT INVENTORY_ITEM_PK PRIMARY KEY (INVENTORY_ITEM_ID) ENABLE
);
CREATE TABLE XNM_AGREEMENT(
    AGREEMENT_ID NUMBER,
    ACCOUNT_ID NUMBER,
    PROFILE_ID NUMBER,
    CREATED_ON TIMESTAMP DEFAULT SYSTIMESTAMP,
    CREATED_BY VARCHAR2(200),
    LAST_UPDATED_BY VARCHAR2(200),
    LAST_UPDATED_TIMESTAMP TIMESTAMP,
    AGREEMENT_APPROVED_FLAG CHAR(1) DEFAULT('N'),
    AGREEMENT_STATUS VARCHAR2(10),
    AGREEMENT_APPROVED_ON TIMESTAMP,
    HAS_BROKER_FLAG CHAR(1) DEFAULT('N'),
    CONSTRAINT XNM_AGREEMENT_PK PRIMARY KEY (AGREEMENT_ID) ENABLE
);
CREATE TABLE INVENTORY_ITEM_TRADER(
    INVENTORY_ITEM_TRADER_ID NUMBER,
    INVENTORY_ITEM_ID NUMBER,
    TRADER_PROFILE_ID NUMBER,
    TRADE_AS VARCHAR2(50),
    QUOTA NUMBER,
    ADDED_ON TIMESTAMP,
    ADDED_BY VARCHAR2(200),
    CREATED_ON TIMESTAMP DEFAULT SYSTIMESTAMP,
    CREATED_BY VARCHAR2(200),
    LAST_UPDATED_BY VARCHAR2(200),
    LAST_UPDATED_TIMESTAMP TIMESTAMP,
    TRADER_REQUESTED_BY NUMBER,
    TRADER_APPROVED_BY NUMBER,
    TRADER_APPROVED_ON TIMESTAMP,
    TRADER_APPROVED_FLAG CHAR(1) DEFAULT('P'),
    TRADING_REQUEST_STATUS VARCHAR2(20) DEFAULT('PENDING'),
    TRADING_STATUS VARCHAR2(10),
    TRADING_AGREEMENT_ID NUMBER,
    CONSTRAINT INVENTORY_ITEM_TRADER_PK PRIMARY KEY (INVENTORY_ITEM_TRADER_ID) ENABLE
);


CREATE TABLE INVENTORY_TRADE_PRICEMODEL(
    PRICE_MODEL_ID NUMBER,
    INVENTORY_ITEM NUMBER,
    INVENTORY_ITEM_TRADER NUMBER,
    UNIT_PRICE NUMBER,
    QUANTITY_PER_UNIT NUMBER,
    DISCOUNT_PERCENTAGE NUMBER DEFAULT(0),
    VALID_FROM TIMESTAMP,
    VALID_TO TIMESTAMP,
    ON_EXPIRE_CLONEMODEL_ACTIVE NUMBER,
    PRICE_MODEL_STATUS VARCHAR2(10),
    CONSTRAINT INVENTORY_TRADE_PRICEMODEL_PK PRIMARY KEY (PRICE_MODEL_ID) ENABLE
);


CREATE TABLE XNM_PHYSICAL_ADDRESS(
    XNM_ADDRESS_ID NUMBER,
    ADDRESS_SERIALNO VARCHAR2(500),
    XNM_ADDRESS_LINE_1 VARCHAR2(150),
    XNM_ADDRESS_LINE_2 VARCHAR2(150),
    XNM_ADDRESS_LINE_3 VARCHAR2(50),
    XNM_ADDRESS_POSTCODE VARCHAR2(30),
    XNM_ADDRESS_COUNTRY VARCHAR2(50),
    XNM_ADDRESS_STATE VARCHAR2(50),
    XNM_ADDRESS_CITY VARCHAR2(50),
    XNM_ADDRESS_TOWN VARCHAR2(50),
    ADDRESS_VERIFIED CHAR(1) DEFAULT('N'),
    NEW_VERSION_REF NUMBER,
    CREATED_ON TIMESTAMP,
    CREATED_BY VARCHAR2(100),
    LAST_UPDATEDBY VARCHAR2(100),
    LAST_UPDATETIMESTAMP TIMESTAMP,
    CONSTRAINT XNM_PHYSICAL_ADDRESS_PK PRIMARY KEY(XNM_ADDRESS_ID) ENABLE
);
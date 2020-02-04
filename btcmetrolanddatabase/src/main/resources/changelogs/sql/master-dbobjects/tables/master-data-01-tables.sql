CREATE TABLE METRO_TEXT_INFO(
  TEXT_INFO_ID NUMBER
, OWNER_TABLE_NAME VARCHAR2(500) NOT NULL
, OWNER_TABLE_PK NUMBER NOT NULL
, TEXT_LABEL VARCHAR2(100) NOT NULL
, TEXT_INFO VARCHAR2(2000)
, CONSTRAINT METRO_TEXT_INFO_PK PRIMARY KEY
  (
    OWNER_TABLE_NAME
  , OWNER_TABLE_PK
  , TEXT_LABEL
  )
  ENABLE
);

CREATE TABLE METRO_NUMERIC_INFO(
    NUMERIC_INFO_ID NUMBER,
    OWNER_TABLE_NAME VARCHAR2(500),
    OWNER_TABLE_PK NUMBER,
    NUMERIC_LABEL VARCHAR2(100),
    NUMERIC_VALUE NUMBER,
    CONSTRAINT METRO_NUMERIC_INFO_PK PRIMARY KEY (
        OWNER_TABLE_NAME
      , OWNER_TABLE_PK
      , NUMERIC_LABEL
      ) ENABLE
);

CREATE TABLE METRO_LOCATION(
    LOCATION_ID NUMBER,
    LOCATION_CODE VARCHAR2(30),
    LOCATION_NAME VARCHAR2(500),
    ADDRESS_ID NUMBER,
    MANAGER_ID NUMBER,
    CREATED_ON TIMESTAMP,
    CREATED_BY NUMBER,
    LAST_MODIFIED_ON TIMESTAMP,
    LAST_MODIFIED_BY NUMBER,
    CONSTRAINT METRO_LOCATION_PK PRIMARY KEY (LOCATION_ID) ENABLE
);

CREATE TABLE METRO_CUSTOMER(
    CUSTOMER_ID NUMBER,
    CUSTOMER_TYPE VARCHAR2(20),
    IS_CURRENT CHAR(1) DEFAULT ('Y'),
    BUSINESS_NAME VARCHAR2(50),
    PREVIOUS_PROFILE_ID NUMBER,
    PERSON_TITLE VARCHAR2(50),
    FIRST_NAME VARCHAR2(50),
    LAST_NAME VARCHAR2(50),
    OTHER_NAME VARCHAR2(50),
    GENDER     CHAR(1),
    DOB DATE,
    CURRENT_ADDRESS_ID NUMBER,
    CREATED_ON TIMESTAMP,
    CREATED_BY NUMBER,
    LAST_MODIFIED_ON TIMESTAMP,
    LAST_MODIFIED_BY NUMBER,
    CONSTRAINT METRO_CUSTOMER_PK PRIMARY KEY (CUSTOMER_ID) ENABLE
);

CREATE TABLE METRO_CUST_IDENTITY(
    IDENTIFIER_ID NUMBER,
    CUSTOMER_ID NUMBER,
    IDENTIFICATION_TYPE VARCHAR2(300),
    BASE64_COPY CLOB,
    STORAGE_URL VARCHAR2(2000),
    CREATED_ON TIMESTAMP,
    CREATED_BY NUMBER,
    LAST_MODIFIED_ON TIMESTAMP,
    LAST_MODIFIED_BY NUMBER,
    CONSTRAINT METRO_CUST_IDENTITY_PK PRIMARY KEY (IDENTIFIER_ID) ENABLE
);

CREATE TABLE METRO_SERVICE_TYPE(
    SERVICE_TYPE_ID NUMBER,
    SERVICE_TYPE_NAME VARCHAR2(150) NOT NULL,
    SERVICE_TYPE_DESCRIPTION VARCHAR2(500),
    SERVICE_FILTER_CODE VARCHAR2(30),
    SERVICE_TYPE_STATUS VARCHAR2(30) DEFAULT ('NEW'),
    IS_ACTIVE_FLAG CHAR(1) DEFAULT('N'),
    CREATED_ON TIMESTAMP,
    CREATED_BY NUMBER,
    LAST_MODIFIED_ON TIMESTAMP,
    LAST_MODIFIED_BY NUMBER,
    CONSTRAINT METRO_SERVICE_TYPE_PK PRIMARY KEY (SERVICE_TYPE_ID) ENABLE
);

CREATE TABLE METRO_SERVICES_CATALOGUE(
    SERVICE_ID NUMBER,
    SERVICE_SERIAL VARCHAR2(300),
    SERVICE_TYPE_ID NUMBER,
    SERVICE_FILTER_CODE VARCHAR2(30),
    SERVICE_OWNER_ACCOUNT NUMBER,
    SERVICE_NAME VARCHAR2(300),
    SERVICE_STATUS VARCHAR2(20),
    START_DATE TIMESTAMP,
    END_DATE TIMESTAMP,
    CREATED_ON TIMESTAMP,
    CREATED_BY NUMBER,
    LAST_MODIFIED_ON TIMESTAMP,
    LAST_MODIFIED_BY NUMBER,
    CONSTRAINT METRO_SERVICES_CAT_PK PRIMARY KEY (SERVICE_ID) ENABLE
);

CREATE TABLE METRO_REGISTRATION_FORM(
    REG_FORM_ID NUMBER,
    SERVICE_ID NUMBER,
    REGFORM_SERIAL VARCHAR2(300),
    CERT_CUSTOM_SERIAL VARCHAR2(300),
    NOM_DELIVERED_BY VARCHAR2(400),
    NOM_DATEOFMARRIAGE DATE,
    NOM_NATIONALREGNO VARCHAR2(150),
    BC_PLACEOFBIRTH VARCHAR2(150),
    DC_PLACEOFDEATH VARCHAR2(150),
    DC_CAUSEOFILLNS VARCHAR2(200),
    TRANSACTION_ID NUMBER,
    CREATED_ON TIMESTAMP,
    CREATED_BY NUMBER,
    LAST_MODIFIED_ON TIMESTAMP,
    LAST_MODIFIED_BY NUMBER,
    CONSTRAINT METRO_REGFORM_PK PRIMARY KEY (REG_FORM_ID) ENABLE
);

CREATE TABLE METRO_FORM_CUSTOMER_LINK(
    FORM_ASSOCIATION_ID NUMBER,
    REG_FORM_ID NUMBER,
    CUSTOMER_ID NUMBER,
    CUST_PARTY_AS_A VARCHAR2(30),
    CUST_CURRENT_ADDRESS VARCHAR2(150),
    CUST_ADDRESS_ID NUMBER,
    CREATED_ON TIMESTAMP,
    CREATED_BY NUMBER,
    LAST_MODIFIED_ON TIMESTAMP,
    LAST_MODIFIED_BY NUMBER,
    CONSTRAINT METRO_CUST_FORM_ASSOC_PK PRIMARY KEY (FORM_ASSOCIATION_ID) ENABLE
);

CREATE TABLE METRO_ASSET_TYPE(
    ASSET_TYPE_ID NUMBER,
    ASSET_TYPE_NAME VARCHAR2(200),
    ASSET_TYPE_SERIAL VARCHAR2(300),
    TYPE_CODE VARCHAR2(30),
    DESCRIPTION VARCHAR2(500),
    CREATED_ON TIMESTAMP,
    CREATED_BY NUMBER,
    LAST_MODIFIED_ON TIMESTAMP,
    LAST_MODIFIED_BY NUMBER,
    CONSTRAINT METRO_ASSET_TYPE_PK PRIMARY KEY (ASSET_TYPE_ID) ENABLE
);

CREATE TABLE METRO_ASSET(
    ASSET_ID NUMBER,
    SERVICE_ID NUMBER,
    SERVICE_TYPE_ID NUMBER,
    ASSET_SERIAL VARCHAR2(300),
    PLOT_ASSET_TYPE_ID NUMBER,
    ADDRESS_ID NUMBER NOT NULL,
    ASSET_TAG VARCHAR2(500),
    ASSET_INTERNAL_ID VARCHAR2(500),
    REGISTERED_ON TIMESTAMP,
    REGISTERED_BY VARCHAR2(200),
    REGISTRAR_ACCOUNT NUMBER,
    ASSET_STATUS VARCHAR2(100) DEFAULT ('UNKNOWN'),
    ASSET_NAME VARCHAR2(100),
    ASSET_DESCRIPTION VARCHAR2(500),
    CREATED_ON TIMESTAMP,
    CREATED_BY NUMBER,
    LAST_MODIFIED_ON TIMESTAMP,
    LAST_MODIFIED_BY NUMBER,
    CONSTRAINT METRO_ASSET_PK PRIMARY KEY (ASSET_ID) ENABLE
);

CREATE TABLE METRO_ASSET_IDENTITY(
    ASSET_IDENTIFIER_ID NUMBER,
    ASSET_ID NUMBER,
    IDENTIFICATION_TYPE VARCHAR2(300),
    BASE64_COPY CLOB,
    STORAGE_URL VARCHAR2(2000),
    CREATED_ON TIMESTAMP,
    CREATED_BY NUMBER,
    LAST_MODIFIED_ON TIMESTAMP,
    LAST_MODIFIED_BY NUMBER,
    CONSTRAINT METRO_ASSET_IDENTITY_PK PRIMARY KEY (ASSET_IDENTIFIER_ID) ENABLE
);

CREATE TABLE METRO_OWNERSHIP_TYPE(
    OWNERSHIP_TYPE_ID NUMBER,
    OWNERSHIP_TYPE VARCHAR2(50),
    TYPE_DESCRIPTION VARCHAR2(500),
    CREATED_ON TIMESTAMP DEFAULT SYSTIMESTAMP,
    CREATED_BY NUMBER,
    LAST_MODIFIED_ON TIMESTAMP,
    LAST_MODIFIED_BY NUMBER,
    CONSTRAINT METRO_OWNERSHIP_TYPE_PK PRIMARY KEY (OWNERSHIP_TYPE_ID) ENABLE
);

CREATE TABLE METRO_ASSET_OWNERSHIP(
    OWNERSHIP_PK NUMBER,
    OWNERSHIP_TYPE_ID NUMBER,
    ASSET_ID NUMBER,
    SERVICE_ID NUMBER,
    CUSTOMER_ID NUMBER,
    ASSET_OWNER_ID NUMBER,
    START_DATE TIMESTAMP,
    END_DATE TIMESTAMP,
    OWNERSHIP_SERIAL VARCHAR2(300),
    OWNERSHIP_STATUS VARCHAR2(10),
    PREVIOUS_OWNER_ACCOUNT NUMBER,
    TRANSFER_COMPLETED_ON TIMESTAMP,
    TRANSFER_REQUESTED_ON TIMESTAMP,
    TRANSFER_STARTED_ON TIMESTAMP,
    TRANSFER_APPROVED_BY NUMBER,
    TRANSFER_STATUS VARCHAR2(50),
    TRANSACTION_ID NUMBER,
    CREATED_ON TIMESTAMP,
    CREATED_BY NUMBER,
    LAST_MODIFIED_ON TIMESTAMP,
    LAST_MODIFIED_BY NUMBER,
    CONSTRAINT METRO_PLOT_OWNERSHIP_PK PRIMARY KEY (OWNERSHIP_PK) ENABLE
);

CREATE TABLE METRO_ACCOUNT(
  ACCOUNT_ID NUMBER
, ACCOUNT_NAME VARCHAR2(500)
, ACCOUNT_TYPE VARCHAR2(30)
, ACCOUNT_SERIAL VARCHAR2(100)
, CREATED_ON TIMESTAMP DEFAULT SYSTIMESTAMP
, CREATED_BY NUMBER
, LAST_MODIFIED_ON TIMESTAMP
, LAST_MODIFIED_BY VARCHAR2(100)
, REGISTERED_ON TIMESTAMP DEFAULT SYSTIMESTAMP
, ACCOUNT_STATUS VARCHAR2(20) DEFAULT 'ACTIVE'
, DEFAULT_TIMEZONE VARCHAR2(20)
, ACCOUNT_COUNTRY VARCHAR2(70)
, ACCOUNT_STATE VARCHAR2(70)
, ACCOUNT_CITY VARCHAR2(70)
, ACCOUNT_TOWN VARCHAR2(70)
, PRI_ACCOUNT_DOMAIN VARCHAR2(80)
, CONSTRAINT METRO_ACCOUNT_PK PRIMARY KEY
  (
    ACCOUNT_ID
  )
  ENABLE
);

CREATE TABLE METRO_ACCOUNT_USER(
  PROFILE_ID NUMBER
, PROFILE_TYPE VARCHAR2(30)
, PROFILE_DN VARCHAR2(100) NOT NULL
, PERSON_TITLE VARCHAR2(5)
, PROFILE_FIRSTNAME VARCHAR2(100)
, PROFILE_MIDDLENAME VARCHAR2(100)
, PROFILE_LASTNAME VARCHAR2(100)
, PROFILE_BUSINESSNAME VARCHAR2(100)
, CREATED_ON TIMESTAMP DEFAULT SYSTIMESTAMP
, CREATED_BY NUMBER
, LAST_MODIFIED_ON TIMESTAMP
, LAST_MODIFIED_BY VARCHAR2(100)
, ASSOC_ACCOUNT_ID NUMBER
, PROFILE_STATUS VARCHAR2(20) DEFAULT 'ACTIVE'
, DEFAULT_TIMEZONE VARCHAR2(20)
, CURRENT_COUNTRY VARCHAR2(70)
, CURRENT_STATE VARCHAR2(70)
, CURRENT_CITY VARCHAR2(70)
, CURRENT_TOWN VARCHAR2(70)
, ASSIGNED_LOCATION_ID NUMBER
, CONSTRAINT METRO_ACCOUNT_USER_PROFILE_PK PRIMARY KEY(PROFILE_ID)ENABLE
);

CREATE TABLE METRO_ACCOUNT_USER_ASSOC(
    ASSOCIATION_ID NUMBER,
    ACCOUNT_ID NUMBER,
    PROFILE_ID NUMBER,
    ASSOCIATION_SERIAL VARCHAR2(300),
    ASSOCIATION_STATUS VARCHAR2(30) DEFAULT 'ACTIVE',
    CREATED_ON TIMESTAMP DEFAULT SYSTIMESTAMP,
    CREATED_BY NUMBER,
    LAST_MODIFIED_ON TIMESTAMP,
    LAST_MODIFIED_BY NUMBER,
    CONSTRAINT METRO_ACCOUNT_USER_ASSOC_PK PRIMARY KEY (ASSOCIATION_ID) ENABLE
);

CREATE TABLE METRO_TXNCART_ITEM(
    CATTITEM_ID NUMBER,
	TRANSACTION_CART_ID NUMBER,
	SERVICE_ID NUMBER,
	SERVICE_TYPE_ID NUMBER,
	SERVICE_TYPE_CODE VARCHAR2(30),
	SOURCE_TBL_NAME VARCHAR2(150),
	SOURCE_TBL_KEY NUMBER,
	SERVICE_TYPE_NAME VARCHAR2(300),
	SERVICE_TYPE_DESCRIPTION VARCHAR2(500),
	CREATED_ON TIMESTAMP (6) DEFAULT SYSTIMESTAMP,
	ITEM_ISSUE_SERIAL VARCHAR2(40),
	POI_ID NUMBER,
	ISSUEAGENT_KEY NUMBER NOT NULL ENABLE,
	TRANSACTION_PRICE NUMBER(9,2),
	INVOICE_ID NUMBER,
	BASEPRICE_ID NUMBER,
	SUBSCRIPTION_STATUS VARCHAR2(10), 
	SUBSCRIPTION_EXPIRES_ON TIMESTAMP,
	SUBSCRIPTION_VALIDFROM TIMESTAMP,
	CUSTOMER_ID NUMBER,
	SERVICEPROVIDER_ID NUMBER,
	PRICE_CURRENCY VARCHAR2(10),
	PAYMT_WAIVED CHAR(1) DEFAULT 'N', 
	COMMENTS VARCHAR2(500), 
	CONSTRAINT METRO_TXNCART_ITEM_PK PRIMARY KEY (CATTITEM_ID) ENABLE
);

CREATE TABLE METRO_TXNCART_HEADER(
    TXN_CART_ID NUMBER,
	TXN_SERIAL VARCHAR2(100),
	TXN_ITEMS_COUNT NUMBER,
	STAFF_KEY NUMBER,
	POIKEY NUMBER,
	POI_NAME VARCHAR2(200),
	POI_CODE VARCHAR2(30),
	CREATED_BY NUMBER,
	CREATED_ON TIMESTAMP DEFAULT SYSTIMESTAMP,
	UPDATED_BY NUMBER,
	UPDATED_ON TIMESTAMP,
	TXN_TOTAL NUMBER,
	TXN_UPDATE_LOGS VARCHAR2(500),
	TXN_FEE NUMBER,
	TXN_VERIFIED CHAR(1) DEFAULT 'N',
	METRO_ENTITYKEY NUMBER,
	METRO_ENTITYSERIAL VARCHAR2(25),
	PAYMT_GATEWAY_STATUS VARCHAR2(20),
	PAYMT_GATEWAY_TXN_REF VARCHAR2(50),
	PAYMT_TYPE VARCHAR2(20),
	VERIFY_ENDPOINT VARCHAR2(600),
	VERIFIED_ON TIMESTAMP,
	VERIFIED_BY NUMBER,
	ENDPOINT_RESPONSE_CODE VARCHAR2(10),
	ENDPOINT_RESPONSE_TEXT VARCHAR2(100),
	COMMENTS VARCHAR2(4000),
	SMS_EXPALRT_FOR_ITEMS CHAR(1) DEFAULT 'Y',
	EMAIL_EXPALRT_FOR_ITEMS CHAR(1) DEFAULT 'Y',
	CONSTRAINT METRO_TXNCART_HEADER_PK PRIMARY KEY (TXN_CART_ID) ENABLE
);

CREATE TABLE BASE_PRICE_MODEL(
    PRICE_IDX NUMBER,
	PRICE_MODEL_NAME VARCHAR2(500),
    SERVICE_TYPE_ID NUMBER,
    SERVICE_ID NUMBER,
    ASSET_TYPE_ID NUMBER,
    ASSET_OWNERSHIP_TYPEID NUMBER,
	PRICE NUMBER(9,2) NOT NULL ENABLE,
	CURRENCY VARCHAR2(5) NOT NULL ENABLE,
	STATUS VARCHAR2(10) NOT NULL ENABLE,
	CREATED_ON TIMESTAMP DEFAULT SYSTIMESTAMP,
	CREATED_BY NUMBER,
	MODIFIED_ON DATE,
	MODIFIED_BY NUMBER,
	END_DATE DATE DEFAULT NULL,
	VALID_FROM DATE DEFAULT SYSDATE,
	OFFICIAL_NOTES VARCHAR2(2000),
	VAT NUMBER(3,2) DEFAULT 0 NOT NULL ENABLE,
	PARAM_1 VARCHAR2(20),
	PARAM_2 VARCHAR2(20),
	PARAM_3 VARCHAR2(20),
	PARAM_4 VARCHAR2(20),
	PARAM_5 VARCHAR2(20),
	CONSTRAINT BASE_PRICE_MODEL_PK PRIMARY KEY (PRICE_IDX) ENABLE
   );
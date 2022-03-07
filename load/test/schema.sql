CREATE TABLE IF NOT EXISTS RTA_JN (ID INTEGER PRIMARY KEY, IP TEXT, BATCH_ID TEXT, STATUS INTEGER,TEMP_TABLE_NAME TEXT,CREATED DATETIME,UPDATED DATETIME);
CREATE TABLE IF NOT EXISTS INVENTORY (PRODUCT_ID INTEGER, NAME TEXT, QUANTITY INTEGER,PRICE FLOAT,UPDATED DATETIME, PRIMARY KEY (`PRODUCT_ID`,`NAME` ));
DELETE FROM  RTA_JN;
DELETE FROM  INVENTORY;
DELETE FROM  INVENTORY_127001_10000000000;
DELETE FROM  INVENTORY_127001_10000000001;
DELETE FROM  INVENTORY_127001_10000000002;
-- PROFILE
- політика використання ресурсів
- політика роботи з паролями


-- SCHEMA = USER + TABLE or/and other OBJECTS + OBJECT PRIVILEGES

CREATE USER "TEST" PROFILE "DEFAULT"
IDENTIFIED BY "1"
DEFAULT TABLESPACE "USER_DATA"
TEMPORARY TABLESPACE "TEMP_DATA"
ACCOUNT UNLOCK;

-- Quota on default tablespace (required to create tables, insert data)
ALTER USER "TEST" QUOTA UNLIMITED ON "USER_DATA";

GRANT CONNECT TO "TEST";
GRANT RESOURCE TO "TEST";




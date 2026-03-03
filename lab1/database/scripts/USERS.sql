-- PROFILE
- політика використання ресурсів
- політика роботи з паролями


-- SCHEMA = USER + TABLE or/and other OBJECTS + OBJECT PRIVILEGES

CREATE USER "TEST" PROFILE "DEFAULT" 
IDENTIFIED BY "1" 
DEFAULT TABLESPACE "USER_DATA" 
TEMPORARY TABLESPACE "TEMP_DATA" 
ACCOUNT UNLOCK;

GRANT connect TO "TEST" WITH ADMIN OPTION; // create session
GRANT resource to "TEST" with admin option;




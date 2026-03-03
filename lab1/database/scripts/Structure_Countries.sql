-- Create table
create table COUNTRIES
(
  country_id   CHAR(2),
  country_name VARCHAR2(40),
  region_id    NUMBER,
  constraint COUNTRY_C_ID_PK primary key (COUNTRY_ID)
)
-- Add comments to the table 
comment on table COUNTRIES
  is 'country table. Contains 25 rows. References with locations table.';
-- Add comments to the columns 
comment on column COUNTRIES.country_id
  is 'Primary key of countries table.';
comment on column COUNTRIES.country_name
  is 'Country name';
comment on column COUNTRIES.region_id
  is 'Region ID for the country. Foreign key to region_id column in the departments table.';
-- Create/Recreate primary, unique and foreign key constraints 
alter table COUNTRIES
  add constraint COUNTR_REG_FK foreign key (REGION_ID)
  references REGIONS (REGION_ID);
-- Create/Recreate check constraints 
alter table COUNTRIES
  add constraint COUNTRY_ID_NN
  check ("COUNTRY_ID" IS NOT NULL);
  
  
  

-- Create table
create table REGIONS
(
  region_id   NUMBER,
  region_name VARCHAR2(25)
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table REGIONS
  add constraint REG_ID_PK primary key (REGION_ID);
alter index REG_ID_PK nologging;
-- Create/Recreate check constraints 
alter table REGIONS
  add constraint REGION_ID_NN
  check ("REGION_ID" IS NOT NULL);

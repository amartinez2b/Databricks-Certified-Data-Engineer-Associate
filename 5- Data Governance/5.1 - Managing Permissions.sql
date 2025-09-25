CREATE DATABASE IF NOT EXISTS hive_metastore.hr_db
LOCATION 'dbfs:/mnt/demo/hr_db.db';

CREATE TABLE hive_metastore.hr_db.employees (id INT, name STRING, salary DOUBLE, city STRING);

INSERT INTO hive_metastore.hr_db.employees
VALUES (1, "Anna", 2500, "Ecuador"),
       (2, "Thomas", 3000, "London"),
       (3, "Bilal", 3500, "Ecuador"),
       (4, "Maya", 2000, "Ecuador"),
       (5, "Sophie", 2500, "London"),
       (6, "Adam", 3500, "London"),
       (7, "Ali", 3000, "Ecuador");

CREATE VIEW hive_metastore.hr_db.paris_emplyees_vw
AS SELECT * FROM hive_metastore.hr_db.employees WHERE city = 'Ecuador';

------------------------------------------------------

GRANT SELECT, MODIFY, READ_METADATA, CREATE ON SCHEMA hive_metastore.hr_db TO hr_team;

GRANT USAGE ON SCHEMA hive_metastore.hr_db TO hr_team;

GRANT SELECT ON VIEW hive_metastore.hr_db.paris_emplyees_vw TO `agustin.martinez@bigdataybi.com`;

SHOW GRANTS ON SCHEMA hive_metastore.hr_db;

SHOW GRANTS ON VIEW hive_metastore.hr_db.paris_emplyees_vw;

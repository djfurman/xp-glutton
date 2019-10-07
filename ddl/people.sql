CREATE database "pressure_test";
CREATE role pressure_test_batch_role WITH LOGIN;
GRANT CONNECT ON database "pressure_test" TO pressure_test_batch_role;
CREATE USER pressure_test_user WITH inherit IN role pressure_test_batch_role;
-- Use an alter statement to create the user's password

CREATE TABLE if NOT EXISTS people (
    id uuid PRIMARY key,
    given_name varchar(255),
    middle_name varchar(255),
    surname varchar(255),
    date_of_birth date,
    tax_id varchar(25),
    tax_id_type varchar(25),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE index birth_data ON people (date_of_birth);

GRANT SELECT, INSERT, UPDATE ON TABLE people TO pressure_test_batch_role; 

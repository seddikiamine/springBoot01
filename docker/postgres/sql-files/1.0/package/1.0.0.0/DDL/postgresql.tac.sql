-- ENUMS
CREATE TYPE schedule_change_type AS ENUM
  ('MODIFICATION', 'REMOVAL');

CREATE TYPE departure_arrival_enum AS ENUM
  ('DEPARTURE', 'ARRIVAL', 'NONE');

CREATE TYPE train_type_enum AS ENUM
  ('RAIL', 'ROAD');

-- TABLES
CREATE TABLE IF NOT EXISTS train_dates
(
  company_code varchar(10) NOT NULL,
  id SERIAL,
  train_number varchar(10) NOT NULL,
  train_type train_type_enum NOT NULL,
  travel_date date NOT NULL,
  CONSTRAINT train_dates_pkey PRIMARY KEY (id)
) TABLESPACE appl_data;

CREATE TABLE IF NOT EXISTS schedule_changes
(
  id SERIAL,
  fk_train_dates_id integer NOT NULL,
  station varchar(5) NOT NULL,
  previous_schedule timestamp without time zone NOT NULL,
  new_schedule timestamp without time zone,
  file_date timestamp without time zone NOT NULL,
  departure_arrival departure_arrival_enum NOT NULL,
  type schedule_change_type NOT NULL,
  CONSTRAINT schedule_changes_pkey PRIMARY KEY (id),
  CONSTRAINT fk_train_dates_id FOREIGN KEY (fk_train_dates_id)
    REFERENCES train_dates (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
) TABLESPACE appl_data;

CREATE TABLE IF NOT EXISTS passengers
(
  id SERIAL,
  fk_train_dates_id integer NOT NULL,
  order_id varchar(10) NOT NULL,
  passenger_id varchar(50) NOT NULL,
  CONSTRAINT passengers_pkey PRIMARY KEY (id),
  CONSTRAINT fk_train_dates_id FOREIGN KEY (fk_train_dates_id)
    REFERENCES train_dates (id) MATCH SIMPLE
    ON UPDATE CASCADE
    ON DELETE CASCADE
) TABLESPACE appl_data;

-- CONSTRAINTS
ALTER TABLE train_dates
  ADD CONSTRAINT uk_train_dates UNIQUE (train_number, company_code, train_type, travel_date)
    USING INDEX TABLESPACE appl_data;

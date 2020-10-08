-- ENUMS
CREATE TYPE communication_wave_type_enum AS ENUM
  ('MAIL', 'APP', 'SMS');

-- TABLES
CREATE TABLE IF NOT EXISTS communication_waves
(
    id SERIAL,
    fk_train_dates_id integer NOT NULL,
    type communication_wave_type_enum,
    date date NOT NULL,
    CONSTRAINT communication_wave_pkey PRIMARY KEY (id),
    CONSTRAINT fk_train_dates_id FOREIGN KEY (fk_train_dates_id)
        REFERENCES train_dates (id) MATCH SIMPLE
        ON DELETE CASCADE
) TABLESPACE appl_data;

CREATE TABLE IF NOT EXISTS passengers_communication_waves
(
    id SERIAL,
    fk_passengers_id integer NOT NULL,
    fk_communication_waves_id integer NOT NULL,
    done boolean,
    CONSTRAINT passengers_communication_waves_pkey PRIMARY KEY (id),
    CONSTRAINT fk_passengers_id FOREIGN KEY (fk_passengers_id)
        REFERENCES passengers (id) MATCH SIMPLE
        ON DELETE CASCADE,
    CONSTRAINT fk_communication_waves_id FOREIGN KEY (fk_communication_waves_id)
        REFERENCES communication_waves (id) MATCH SIMPLE
        ON DELETE CASCADE
) TABLESPACE appl_data;

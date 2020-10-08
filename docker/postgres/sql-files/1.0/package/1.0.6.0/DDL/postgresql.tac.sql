-- TABLES
CREATE TABLE IF NOT EXISTS train_dates_notify_front
(
    id SERIAL,
    fk_train_dates_id integer NOT NULL,
    date timestamp without time zone NOT NULL,
    CONSTRAINT fk_train_dates_id FOREIGN KEY (fk_train_dates_id)
        REFERENCES train_dates (id) MATCH SIMPLE
        ON DELETE CASCADE
) TABLESPACE appl_data;

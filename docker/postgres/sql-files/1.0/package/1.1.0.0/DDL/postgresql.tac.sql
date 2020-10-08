ALTER TABLE train_dates DROP CONSTRAINT uk_train_dates;
ALTER TABLE train_dates ADD CONSTRAINT uk_train_dates UNIQUE (train_number, travel_date);

ALTER TABLE train_dates DROP COLUMN IF EXISTS train_type;
ALTER TABLE train_dates DROP COLUMN IF EXISTS company_code;
DROP TYPE train_type_enum;




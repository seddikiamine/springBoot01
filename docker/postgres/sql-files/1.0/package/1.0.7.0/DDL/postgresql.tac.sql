ALTER TABLE train_dates DROP CONSTRAINT uk_train_dates;
ALTER TABLE train_dates ADD CONSTRAINT uk_train_dates UNIQUE (train_number, company_code, travel_date);


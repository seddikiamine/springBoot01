CREATE TYPE communication_state_enum AS ENUM ('START','STOP');

ALTER TABLE train_dates ADD COLUMN "communication_state" communication_state_enum DEFAULT 'START';

ALTER TABLE schedule_changes ALTER COLUMN "previous_schedule" DROP NOT NULL;

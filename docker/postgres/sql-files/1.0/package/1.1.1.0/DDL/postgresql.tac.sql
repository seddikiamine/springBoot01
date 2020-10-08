ALTER TYPE communication_wave_type_enum RENAME TO communication_wave_media_enum;

ALTER TABLE communication_waves RENAME COLUMN "type" TO "media";

CREATE TYPE communication_wave_type_enum AS ENUM ('SCHEDULED', 'TRIGGERED');

ALTER TABLE communication_waves ADD COLUMN "type" communication_wave_type_enum DEFAULT 'SCHEDULED';

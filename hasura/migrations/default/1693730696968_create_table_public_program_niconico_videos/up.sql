CREATE TABLE "public"."program_niconico_videos" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "program_id" uuid NOT NULL, "niconico_video_id" uuid NOT NULL, "person_id" uuid, PRIMARY KEY ("id") , FOREIGN KEY ("program_id") REFERENCES "public"."programs"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("niconico_video_id") REFERENCES "public"."niconico_videos"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("person_id") REFERENCES "public"."persons"("id") ON UPDATE set null ON DELETE set null, UNIQUE ("program_id", "niconico_video_id"));
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_program_niconico_videos_updated_at"
BEFORE UPDATE ON "public"."program_niconico_videos"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_program_niconico_videos_updated_at" ON "public"."program_niconico_videos"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

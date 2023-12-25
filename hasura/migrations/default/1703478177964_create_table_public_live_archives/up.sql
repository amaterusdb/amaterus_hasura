CREATE TABLE "public"."live_archives" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "person_id" uuid NOT NULL, "start_time" timestamptz, "end_time" timestamptz, "youtube_live_id" uuid, "youtube_video_id" uuid, "niconico_live_id" uuid, PRIMARY KEY ("id") , FOREIGN KEY ("youtube_live_id") REFERENCES "public"."youtube_lives"("id") ON UPDATE set null ON DELETE set null, FOREIGN KEY ("youtube_video_id") REFERENCES "public"."youtube_videos"("id") ON UPDATE set null ON DELETE set null, FOREIGN KEY ("niconico_live_id") REFERENCES "public"."niconico_lives"("id") ON UPDATE set null ON DELETE set null, UNIQUE ("person_id", "youtube_live_id"), UNIQUE ("person_id", "youtube_video_id"), UNIQUE ("person_id", "niconico_live_id"), CONSTRAINT "at_least_one_live_required" CHECK (youtube_live_id IS NOT NULL OR youtube_video_id IS NOT NULL OR niconico_live_id IS NOT NULL));
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
CREATE TRIGGER "set_public_live_archives_updated_at"
BEFORE UPDATE ON "public"."live_archives"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_live_archives_updated_at" ON "public"."live_archives"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

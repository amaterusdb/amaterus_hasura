CREATE TABLE "public"."youtube_videos" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "remote_youtube_video_id" text NOT NULL, "title" text NOT NULL, "post_time" timestamptz NOT NULL, "youtube_channel_id" uuid NOT NULL, "is_premiere" boolean NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("youtube_channel_id") REFERENCES "public"."youtube_channels"("id") ON UPDATE cascade ON DELETE cascade, UNIQUE ("remote_youtube_video_id"));
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
CREATE TRIGGER "set_public_youtube_videos_updated_at"
BEFORE UPDATE ON "public"."youtube_videos"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_youtube_videos_updated_at" ON "public"."youtube_videos"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

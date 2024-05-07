CREATE TABLE "public"."crawler__youtube_channel_video_configs" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "remote_youtube_channel_id" text NOT NULL, "remote_youtube_video_id" text NOT NULL, "auto_update_enabled" Text NOT NULL DEFAULT true, "auto_updated_at" timestamptz, "comment" Text NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("remote_youtube_channel_id") REFERENCES "public"."youtube_channels"("remote_youtube_channel_id") ON UPDATE no action ON DELETE no action, FOREIGN KEY ("remote_youtube_video_id") REFERENCES "public"."youtube_videos"("remote_youtube_video_id") ON UPDATE no action ON DELETE no action, UNIQUE ("remote_youtube_channel_id", "remote_youtube_video_id"), UNIQUE ("remote_youtube_video_id"));
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
CREATE TRIGGER "set_public_crawler__youtube_channel_video_configs_updated_at"
BEFORE UPDATE ON "public"."crawler__youtube_channel_video_configs"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_crawler__youtube_channel_video_configs_updated_at" ON "public"."crawler__youtube_channel_video_configs"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

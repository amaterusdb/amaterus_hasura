CREATE TABLE "public"."crawler__youtube_channel_video_update_task__ytch_video_logs" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "remote_youtube_channel_id" text NOT NULL, "remote_youtube_video_id" text NOT NULL, "fetched_at" timestamptz NOT NULL, "upload_status" text NOT NULL, "live_broadcast_content" text NOT NULL, "has_live_streaming_details" boolean NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("remote_youtube_channel_id") REFERENCES "public"."youtube_channels"("remote_youtube_channel_id") ON UPDATE no action ON DELETE no action, FOREIGN KEY ("remote_youtube_video_id") REFERENCES "public"."youtube_videos"("remote_youtube_video_id") ON UPDATE no action ON DELETE no action, UNIQUE ("remote_youtube_channel_id", "remote_youtube_video_id", "fetched_at"));
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
CREATE TRIGGER "set_public_crawler__youtube_channel_video_update_task__ytch_video_logs_updated_at"
BEFORE UPDATE ON "public"."crawler__youtube_channel_video_update_task__ytch_video_logs"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_crawler__youtube_channel_video_update_task__ytch_video_logs_updated_at" ON "public"."crawler__youtube_channel_video_update_task__ytch_video_logs"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
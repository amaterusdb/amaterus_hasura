CREATE TABLE "public"."storage__youtube_channel_icons" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "remote_youtube_channel_id" text NOT NULL, "remote_icon_url" text NOT NULL, "auto_download_enabled" boolean NOT NULL DEFAULT true, "is_downloaded" boolean NOT NULL DEFAULT false, "downloaded_at" timestamptz, "object_key" text, "object_sha256_digest" text, PRIMARY KEY ("id") , FOREIGN KEY ("remote_youtube_channel_id") REFERENCES "public"."youtube_channels"("remote_youtube_channel_id") ON UPDATE no action ON DELETE no action, UNIQUE ("remote_youtube_channel_id"), CONSTRAINT "STORAGE_YTCHICONS_DOWNLOADED" CHECK (NOT is_downloaded OR (downloaded_at IS NOT NULL AND object_key IS NOT NULL AND object_sha256_digest IS NOT NULL)));
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
CREATE TRIGGER "set_public_storage__youtube_channel_icons_updated_at"
BEFORE UPDATE ON "public"."storage__youtube_channel_icons"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_storage__youtube_channel_icons_updated_at" ON "public"."storage__youtube_channel_icons"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

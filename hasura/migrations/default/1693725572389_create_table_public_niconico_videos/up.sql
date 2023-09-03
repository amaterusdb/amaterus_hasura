CREATE TABLE "public"."niconico_videos" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "remote_niconico_content_id" Text NOT NULL, "title" text NOT NULL, "niconico_account_id" uuid NOT NULL, "start_time" timestamptz NOT NULL, "thumbnail_url" text NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("niconico_account_id") REFERENCES "public"."niconico_accounts"("id") ON UPDATE cascade ON DELETE cascade, UNIQUE ("remote_niconico_content_id"));
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
CREATE TRIGGER "set_public_niconico_videos_updated_at"
BEFORE UPDATE ON "public"."niconico_videos"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_niconico_videos_updated_at" ON "public"."niconico_videos"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE "public"."member_youtube_channels" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "member_id" uuid NOT NULL, "channel_id" text NOT NULL, "channel_handle" text, "name" text, PRIMARY KEY ("id") , FOREIGN KEY ("member_id") REFERENCES "public"."members"("id") ON UPDATE cascade ON DELETE cascade);
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
CREATE TRIGGER "set_public_member_youtube_channels_updated_at"
BEFORE UPDATE ON "public"."member_youtube_channels"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_member_youtube_channels_updated_at" ON "public"."member_youtube_channels"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE "public"."niconico_channels" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "remote_niconico_channel_id" text NOT NULL, "screen_name" text NOT NULL, "name" text NOT NULL, PRIMARY KEY ("id") , UNIQUE ("remote_niconico_channel_id"), UNIQUE ("screen_name"));
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
CREATE TRIGGER "set_public_niconico_channels_updated_at"
BEFORE UPDATE ON "public"."niconico_channels"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_niconico_channels_updated_at" ON "public"."niconico_channels"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

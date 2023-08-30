CREATE TABLE "public"."fallguys_custom_rounds" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "name" text NOT NULL, "share_code" text NOT NULL, "in_game_creator_name" text, "person_id" uuid, PRIMARY KEY ("id") , FOREIGN KEY ("person_id") REFERENCES "public"."persons"("id") ON UPDATE set null ON DELETE set null, UNIQUE ("share_code"));
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
CREATE TRIGGER "set_public_fallguys_custom_rounds_updated_at"
BEFORE UPDATE ON "public"."fallguys_custom_rounds"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_fallguys_custom_rounds_updated_at" ON "public"."fallguys_custom_rounds"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE "public"."fallguys_matches" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "program_id" uuid NOT NULL, "start_time" timestamptz NOT NULL, "end_time" timestamptz, "is_aborted" boolean, "index" integer, PRIMARY KEY ("id") , FOREIGN KEY ("program_id") REFERENCES "public"."programs"("id") ON UPDATE cascade ON DELETE cascade, UNIQUE ("program_id", "index"));
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
CREATE TRIGGER "set_public_fallguys_matches_updated_at"
BEFORE UPDATE ON "public"."fallguys_matches"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_fallguys_matches_updated_at" ON "public"."fallguys_matches"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

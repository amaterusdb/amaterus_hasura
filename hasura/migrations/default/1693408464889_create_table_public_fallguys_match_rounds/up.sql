CREATE TABLE "public"."fallguys_match_rounds" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "fallguys_match_id" uuid NOT NULL, "start_time" timestamptz NOT NULL, "end_time" timestamptz, "is_aborted" boolean, "index" integer, "fallguys_round_id" uuid, "fallguys_custom_round_id" uuid, PRIMARY KEY ("id") , FOREIGN KEY ("fallguys_match_id") REFERENCES "public"."fallguys_matches"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("fallguys_round_id") REFERENCES "public"."fallguys_rounds"("id") ON UPDATE set null ON DELETE set null, FOREIGN KEY ("fallguys_custom_round_id") REFERENCES "public"."fallguys_custom_rounds"("id") ON UPDATE cascade ON DELETE cascade, UNIQUE ("fallguys_match_id", "index"));
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
CREATE TRIGGER "set_public_fallguys_match_rounds_updated_at"
BEFORE UPDATE ON "public"."fallguys_match_rounds"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_fallguys_match_rounds_updated_at" ON "public"."fallguys_match_rounds"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

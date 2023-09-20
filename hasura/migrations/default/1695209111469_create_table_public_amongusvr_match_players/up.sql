CREATE TABLE "public"."amongusvr_match_players" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "amongusvr_match_id" uuid NOT NULL, "nickname" text NOT NULL, "person_id" uuid, PRIMARY KEY ("id") , FOREIGN KEY ("person_id") REFERENCES "public"."persons"("id") ON UPDATE set null ON DELETE set null, FOREIGN KEY ("amongusvr_match_id") REFERENCES "public"."amongusvr_matches"("id") ON UPDATE cascade ON DELETE cascade, UNIQUE ("amongusvr_match_id", "nickname"), UNIQUE ("amongusvr_match_id", "person_id"));
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
CREATE TRIGGER "set_public_amongusvr_match_players_updated_at"
BEFORE UPDATE ON "public"."amongusvr_match_players"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_amongusvr_match_players_updated_at" ON "public"."amongusvr_match_players"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE "public"."amongus_match_players" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "match_id" uuid NOT NULL, "nickname" text NOT NULL, "person_id" uuid, PRIMARY KEY ("id") , FOREIGN KEY ("match_id") REFERENCES "public"."matches"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("person_id") REFERENCES "public"."persons"("id") ON UPDATE set null ON DELETE set null, UNIQUE ("match_id", "person_id"), UNIQUE ("match_id", "nickname"));
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
CREATE TRIGGER "set_public_amongus_match_players_updated_at"
BEFORE UPDATE ON "public"."amongus_match_players"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_amongus_match_players_updated_at" ON "public"."amongus_match_players"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

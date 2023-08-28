CREATE TABLE "public"."mariokart8deluxe_race_players" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "mariokart8deluxe_race_id" uuid NOT NULL, "nickname" text NOT NULL, "person_id" uuid, "index" integer, PRIMARY KEY ("id") , UNIQUE ("mariokart8deluxe_race_id", "nickname"), UNIQUE ("mariokart8deluxe_race_id", "person_id"), UNIQUE ("mariokart8deluxe_race_id", "index"));
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
CREATE TRIGGER "set_public_mariokart8deluxe_race_players_updated_at"
BEFORE UPDATE ON "public"."mariokart8deluxe_race_players"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_mariokart8deluxe_race_players_updated_at" ON "public"."mariokart8deluxe_race_players"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

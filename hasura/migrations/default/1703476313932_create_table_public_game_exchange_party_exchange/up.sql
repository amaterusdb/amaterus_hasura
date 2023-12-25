CREATE TABLE "public"."game_exchange_party_exchange" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "game_exchange_party_id" uuid NOT NULL, "from_person_id" uuid NOT NULL, "to_person_id" uuid NOT NULL, "game_id" uuid NOT NULL, "exchange_time" timestamptz NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("game_exchange_party_id") REFERENCES "public"."game_exchange_parties"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("from_person_id") REFERENCES "public"."persons"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("to_person_id") REFERENCES "public"."persons"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("game_id") REFERENCES "public"."games"("id") ON UPDATE cascade ON DELETE cascade, UNIQUE ("game_exchange_party_id", "from_person_id", "to_person_id", "game_id"));
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
CREATE TRIGGER "set_public_game_exchange_party_exchange_updated_at"
BEFORE UPDATE ON "public"."game_exchange_party_exchange"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_game_exchange_party_exchange_updated_at" ON "public"."game_exchange_party_exchange"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

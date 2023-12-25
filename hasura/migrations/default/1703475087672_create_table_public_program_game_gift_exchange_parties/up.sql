CREATE TABLE "public"."program_game_gift_exchange_parties" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "program_id" uuid NOT NULL, "game_gift_exchange_party_id" uuid NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("program_id") REFERENCES "public"."programs"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("game_gift_exchange_party_id") REFERENCES "public"."game_gift_exchange_parties"("id") ON UPDATE cascade ON DELETE cascade, UNIQUE ("program_id", "game_gift_exchange_party_id"));
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
CREATE TRIGGER "set_public_program_game_gift_exchange_parties_updated_at"
BEFORE UPDATE ON "public"."program_game_gift_exchange_parties"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_program_game_gift_exchange_parties_updated_at" ON "public"."program_game_gift_exchange_parties"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

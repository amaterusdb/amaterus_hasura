CREATE TABLE "public"."v2_person_twitter_accounts" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "person_id" uuid NOT NULL, "twitter_account_id" uuid NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("person_id") REFERENCES "public"."persons"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("twitter_account_id") REFERENCES "public"."twitter_accounts"("id") ON UPDATE cascade ON DELETE cascade, UNIQUE ("person_id", "twitter_account_id"));
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
CREATE TRIGGER "set_public_v2_person_twitter_accounts_updated_at"
BEFORE UPDATE ON "public"."v2_person_twitter_accounts"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_v2_person_twitter_accounts_updated_at" ON "public"."v2_person_twitter_accounts"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

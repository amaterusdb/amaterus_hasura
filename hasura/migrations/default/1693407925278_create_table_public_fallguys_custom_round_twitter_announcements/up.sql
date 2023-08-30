CREATE TABLE "public"."fallguys_custom_round_twitter_announcements" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "fallguys_custom_round_id" uuid NOT NULL, "twitter_tweet_id" uuid NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("fallguys_custom_round_id") REFERENCES "public"."fallguys_custom_rounds"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("twitter_tweet_id") REFERENCES "public"."twitter_tweets"("id") ON UPDATE cascade ON DELETE cascade, UNIQUE ("fallguys_custom_round_id", "twitter_tweet_id"));
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
CREATE TRIGGER "set_public_fallguys_custom_round_twitter_announcements_updated_at"
BEFORE UPDATE ON "public"."fallguys_custom_round_twitter_announcements"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_fallguys_custom_round_twitter_announcements_updated_at" ON "public"."fallguys_custom_round_twitter_announcements"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE "public"."twitter_tweets" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "remote_tweet_id" Text NOT NULL, "twitter_account_id" uuid NOT NULL, "tweet_time" timestamptz NOT NULL, "tweet_embed_html" text NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("twitter_account_id") REFERENCES "public"."twitter_accounts"("id") ON UPDATE cascade ON DELETE cascade, UNIQUE ("remote_tweet_id"));
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
CREATE TRIGGER "set_public_twitter_tweets_updated_at"
BEFORE UPDATE ON "public"."twitter_tweets"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_twitter_tweets_updated_at" ON "public"."twitter_tweets"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE "public"."twitter_tweet_images" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "tweet_id" uuid NOT NULL, "index" integer NOT NULL, "url" text NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("tweet_id") REFERENCES "public"."twitter_tweets"("id") ON UPDATE cascade ON DELETE cascade, UNIQUE ("tweet_id", "index"));
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
CREATE TRIGGER "set_public_twitter_tweet_images_updated_at"
BEFORE UPDATE ON "public"."twitter_tweet_images"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_twitter_tweet_images_updated_at" ON "public"."twitter_tweet_images"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

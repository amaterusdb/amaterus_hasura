CREATE TABLE "public"."program_twitter_announcements" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "program_id" uuid NOT NULL, "twitter_tweet_id" uuid NOT NULL, "twitter_tweet_image_id" uuid, PRIMARY KEY ("id") , FOREIGN KEY ("program_id") REFERENCES "public"."programs"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("twitter_tweet_id") REFERENCES "public"."twitter_tweets"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("twitter_tweet_image_id") REFERENCES "public"."twitter_tweet_images"("id") ON UPDATE cascade ON DELETE cascade, UNIQUE ("program_id", "twitter_tweet_id"), UNIQUE ("program_id", "twitter_tweet_image_id"));
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
CREATE TRIGGER "set_public_program_twitter_announcements_updated_at"
BEFORE UPDATE ON "public"."program_twitter_announcements"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_program_twitter_announcements_updated_at" ON "public"."program_twitter_announcements"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

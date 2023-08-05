CREATE TABLE "public"."room_twitter_announcements" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "room_id" uuid NOT NULL, "tweet_id" int8 NOT NULL, "tweet_text" text, "twitter_screen_name" text, "twitter_user_id" timestamptz, "tweet_time" timestamptz, "tweet_image_index" integer, "tweet_image_url" text, PRIMARY KEY ("id") , FOREIGN KEY ("room_id") REFERENCES "public"."rooms"("id") ON UPDATE cascade ON DELETE cascade, UNIQUE ("room_id", "tweet_id"));
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
CREATE TRIGGER "set_public_room_twitter_announcements_updated_at"
BEFORE UPDATE ON "public"."room_twitter_announcements"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_room_twitter_announcements_updated_at" ON "public"."room_twitter_announcements"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

alter table "public"."program_twitter_announcements" drop constraint "program_twitter_announcements_program_id_twitter_tweet_id_key";
alter table "public"."program_twitter_announcements" add constraint "program_twitter_announcements_program_id_twitter_tweet_id_twitter_tweet_image_id_key" unique ("program_id", "twitter_tweet_id", "twitter_tweet_image_id");

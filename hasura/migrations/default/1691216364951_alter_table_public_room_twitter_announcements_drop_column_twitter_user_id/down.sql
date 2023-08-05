alter table "public"."room_twitter_announcements" alter column "twitter_user_id" drop not null;
alter table "public"."room_twitter_announcements" add column "twitter_user_id" timestamptz;

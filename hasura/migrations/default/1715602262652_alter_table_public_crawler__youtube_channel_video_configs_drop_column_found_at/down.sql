alter table "public"."crawler__youtube_channel_video_configs" alter column "found_at" drop not null;
alter table "public"."crawler__youtube_channel_video_configs" add column "found_at" timestamptz;

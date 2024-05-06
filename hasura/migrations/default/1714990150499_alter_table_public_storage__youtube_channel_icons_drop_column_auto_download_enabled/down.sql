alter table "public"."storage__youtube_channel_icons" alter column "auto_download_enabled" set default true;
alter table "public"."storage__youtube_channel_icons" alter column "auto_download_enabled" drop not null;
alter table "public"."storage__youtube_channel_icons" add column "auto_download_enabled" bool;

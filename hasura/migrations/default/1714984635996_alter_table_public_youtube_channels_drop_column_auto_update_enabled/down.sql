alter table "public"."youtube_channels" alter column "auto_update_enabled" set default true;
alter table "public"."youtube_channels" alter column "auto_update_enabled" drop not null;
alter table "public"."youtube_channels" add column "auto_update_enabled" bool;

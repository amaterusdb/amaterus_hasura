alter table "public"."youtube_channels" alter column "auto_updated_at" drop not null;
alter table "public"."youtube_channels" add column "auto_updated_at" timestamptz;

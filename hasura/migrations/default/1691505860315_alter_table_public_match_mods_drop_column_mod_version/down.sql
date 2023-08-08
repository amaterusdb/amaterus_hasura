alter table "public"."match_mods" alter column "mod_version" drop not null;
alter table "public"."match_mods" add column "mod_version" text;

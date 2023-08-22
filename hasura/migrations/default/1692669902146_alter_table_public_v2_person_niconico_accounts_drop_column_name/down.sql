alter table "public"."v2_person_niconico_accounts" alter column "name" drop not null;
alter table "public"."v2_person_niconico_accounts" add column "name" text;

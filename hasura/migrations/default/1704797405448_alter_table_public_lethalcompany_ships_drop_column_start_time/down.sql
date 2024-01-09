alter table "public"."lethalcompany_ships" alter column "start_time" drop not null;
alter table "public"."lethalcompany_ships" add column "start_time" text;

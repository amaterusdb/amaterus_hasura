alter table "public"."lethalcompany_ships" alter column "end_time" drop not null;
alter table "public"."lethalcompany_ships" add column "end_time" uuid;

alter table "public"."mariokart8deluxe_race_players" alter column "rank" drop not null;
alter table "public"."mariokart8deluxe_race_players" add column "rank" int4;

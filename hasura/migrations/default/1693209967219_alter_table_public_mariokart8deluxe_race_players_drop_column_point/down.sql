alter table "public"."mariokart8deluxe_race_players" alter column "point" drop not null;
alter table "public"."mariokart8deluxe_race_players" add column "point" int4;

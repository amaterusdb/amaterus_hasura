alter table "public"."mariokart8deluxe_battle_match_players" alter column "point" drop not null;
alter table "public"."mariokart8deluxe_battle_match_players" add column "point" int4;

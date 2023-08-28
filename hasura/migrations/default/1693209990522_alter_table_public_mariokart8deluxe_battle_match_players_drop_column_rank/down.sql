alter table "public"."mariokart8deluxe_battle_match_players" alter column "rank" drop not null;
alter table "public"."mariokart8deluxe_battle_match_players" add column "rank" int4;

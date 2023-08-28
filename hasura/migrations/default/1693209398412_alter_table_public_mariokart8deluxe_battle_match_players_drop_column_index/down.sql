alter table "public"."mariokart8deluxe_battle_match_players" add constraint "mariokart8deluxe_battle_match_mariokart8deluxe_battle_matc_key2" unique (mariokart8deluxe_battle_match_id, index);
alter table "public"."mariokart8deluxe_battle_match_players" alter column "index" drop not null;
alter table "public"."mariokart8deluxe_battle_match_players" add column "index" int4;

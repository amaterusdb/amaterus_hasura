alter table "public"."mariokart8deluxe_race_players" add constraint "mariokart8deluxe_race_players_mariokart8deluxe_race_id_inde_key" unique (mariokart8deluxe_race_id, index);
alter table "public"."mariokart8deluxe_race_players" alter column "index" drop not null;
alter table "public"."mariokart8deluxe_race_players" add column "index" int4;

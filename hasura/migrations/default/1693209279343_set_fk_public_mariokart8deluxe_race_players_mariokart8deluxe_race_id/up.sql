alter table "public"."mariokart8deluxe_race_players"
  add constraint "mariokart8deluxe_race_players_mariokart8deluxe_race_id_fkey"
  foreign key ("mariokart8deluxe_race_id")
  references "public"."mariokart8deluxe_races"
  ("id") on update cascade on delete cascade;

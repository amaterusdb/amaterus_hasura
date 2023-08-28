alter table "public"."mariokart8deluxe_race_players"
  add constraint "mariokart8deluxe_race_players_person_id_fkey"
  foreign key ("person_id")
  references "public"."persons"
  ("id") on update set null on delete set null;

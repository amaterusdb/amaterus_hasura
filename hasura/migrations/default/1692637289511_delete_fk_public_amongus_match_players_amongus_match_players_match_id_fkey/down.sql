alter table "public"."amongus_match_players"
  add constraint "amongus_match_players_match_id_fkey"
  foreign key ("amongus_match_id")
  references "public"."matches"
  ("id") on update cascade on delete cascade;

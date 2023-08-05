alter table "public"."match_players"
  add constraint "match_players_match_id_fkey"
  foreign key ("match_id")
  references "public"."matches"
  ("id") on update cascade on delete cascade;

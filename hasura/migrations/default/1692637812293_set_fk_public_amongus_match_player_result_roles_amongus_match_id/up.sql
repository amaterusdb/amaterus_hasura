alter table "public"."amongus_match_player_result_roles"
  add constraint "amongus_match_player_result_roles_amongus_match_id_fkey"
  foreign key ("amongus_match_id")
  references "public"."amongus_matches"
  ("id") on update cascade on delete cascade;

alter table "public"."amongus_match_player_result_roles"
  add constraint "match_result_player_roles_match_id_fkey"
  foreign key ("amongus_match_id")
  references "public"."matches"
  ("id") on update cascade on delete cascade;

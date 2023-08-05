alter table "public"."match_players" add constraint "match_players_match_id_person_id_key" unique ("match_id", "person_id");

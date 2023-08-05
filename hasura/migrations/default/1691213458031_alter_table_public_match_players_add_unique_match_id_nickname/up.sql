alter table "public"."match_players" add constraint "match_players_match_id_nickname_key" unique ("match_id", "nickname");

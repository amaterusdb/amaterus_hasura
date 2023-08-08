alter table "public"."match_players"
  add constraint "match_players_result_player_role_id_fkey"
  foreign key (result_player_role_id)
  references "public"."player_roles"
  (id) on update set null on delete set null;
alter table "public"."match_players" alter column "result_player_role_id" drop not null;
alter table "public"."match_players" add column "result_player_role_id" uuid;

comment on column "public"."amongus_match_player_result_roles"."player_role_name" is E'リザルト画面でのプレイヤー役職';
alter table "public"."amongus_match_player_result_roles" alter column "player_role_name" drop not null;
alter table "public"."amongus_match_player_result_roles" add column "player_role_name" text;

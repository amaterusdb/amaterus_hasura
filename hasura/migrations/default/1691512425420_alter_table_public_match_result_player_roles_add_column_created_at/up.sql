alter table "public"."match_result_player_roles" add column "created_at" timestamptz
 not null default now();

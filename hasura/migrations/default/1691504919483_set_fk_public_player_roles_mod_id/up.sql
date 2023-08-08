alter table "public"."player_roles"
  add constraint "player_roles_mod_id_fkey"
  foreign key ("mod_id")
  references "public"."mods"
  ("id") on update set null on delete set null;

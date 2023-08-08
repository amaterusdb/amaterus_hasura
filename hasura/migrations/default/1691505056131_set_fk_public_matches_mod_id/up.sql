alter table "public"."matches"
  add constraint "matches_mod_id_fkey"
  foreign key ("mod_id")
  references "public"."mods"
  ("id") on update set null on delete set null;

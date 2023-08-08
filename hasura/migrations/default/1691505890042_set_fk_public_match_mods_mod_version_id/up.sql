alter table "public"."match_mods"
  add constraint "match_mods_mod_version_id_fkey"
  foreign key ("mod_version_id")
  references "public"."mod_versions"
  ("id") on update set null on delete set null;

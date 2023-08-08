alter table "public"."matches"
  add constraint "matches_vanilla_version_id_fkey"
  foreign key ("vanilla_version_id")
  references "public"."vanilla_versions"
  ("id") on update set null on delete set null;

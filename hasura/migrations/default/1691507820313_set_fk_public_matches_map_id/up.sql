alter table "public"."matches"
  add constraint "matches_map_id_fkey"
  foreign key ("map_id")
  references "public"."maps"
  ("id") on update set null on delete set null;

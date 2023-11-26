alter table "public"."amongus_matches" drop constraint "room_amongus_matches_amongus_map_id_fkey",
  add constraint "amongus_matches_amongus_map_id_fkey"
  foreign key ("amongus_map_id")
  references "public"."amongus_maps"
  ("id") on update set null on delete set null;

alter table "public"."amongus_matches" drop constraint "amongus_matches_amongus_map_id_fkey",
  add constraint "room_amongus_matches_amongus_map_id_fkey"
  foreign key ("amongus_map_id")
  references "public"."amongus_maps"
  ("id") on update cascade on delete cascade;

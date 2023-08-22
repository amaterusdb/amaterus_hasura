alter table "public"."amongus_matches"
  add constraint "room_amongus_matches_room_id_fkey"
  foreign key ("program_id")
  references "public"."rooms"
  ("id") on update cascade on delete cascade;

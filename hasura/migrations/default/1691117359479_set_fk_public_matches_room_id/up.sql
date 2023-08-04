alter table "public"."matches"
  add constraint "matches_room_id_fkey"
  foreign key ("room_id")
  references "public"."rooms"
  ("id") on update set null on delete set null;

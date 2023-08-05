alter table "public"."room_persons" add constraint "room_persons_room_id_person_id_key" unique ("room_id", "person_id");

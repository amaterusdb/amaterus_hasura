alter table "public"."program_youtube_lives"
  add constraint "program_youtube_lives_person_id_fkey"
  foreign key ("person_id")
  references "public"."persons"
  ("id") on update set null on delete set null;

alter table "public"."program_live_archives"
  add constraint "program_live_archives_niconico_live_id_fkey"
  foreign key ("niconico_live_id")
  references "public"."niconico_lives"
  ("id") on update cascade on delete cascade;

alter table "public"."program_twitter_announcements"
  add constraint "program_twitter_announcements_person_id_fkey"
  foreign key ("person_id")
  references "public"."persons"
  ("id") on update set null on delete set null;

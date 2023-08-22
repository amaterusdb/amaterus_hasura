alter table "public"."amongus_matches"
  add constraint "amongus_matches_program_id_fkey"
  foreign key ("program_id")
  references "public"."programs"
  ("id") on update cascade on delete cascade;

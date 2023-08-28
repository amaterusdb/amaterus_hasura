alter table "public"."mariokart8deluxe_courses"
  add constraint "mariokart8deluxe_courses_console_id_fkey"
  foreign key ("console_id")
  references "public"."mariokart8deluxe_consoles"
  ("id") on update set null on delete set null;

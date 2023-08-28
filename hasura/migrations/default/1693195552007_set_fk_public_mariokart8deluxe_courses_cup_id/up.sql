alter table "public"."mariokart8deluxe_courses"
  add constraint "mariokart8deluxe_courses_cup_id_fkey"
  foreign key ("cup_id")
  references "public"."mariokart8deluxe_cups"
  ("id") on update restrict on delete restrict;

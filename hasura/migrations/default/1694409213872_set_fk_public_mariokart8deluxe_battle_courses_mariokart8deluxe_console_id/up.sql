alter table "public"."mariokart8deluxe_battle_courses"
  add constraint "mariokart8deluxe_battle_courses_mariokart8deluxe_console_id_"
  foreign key ("mariokart8deluxe_console_id")
  references "public"."mariokart8deluxe_consoles"
  ("id") on update set null on delete set null;

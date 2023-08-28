alter table "public"."mariokart8deluxe_courses" add constraint "mariokart8deluxe_courses_console_name_name_key" unique (name, console_name);
alter table "public"."mariokart8deluxe_courses" alter column "console_name" drop not null;
alter table "public"."mariokart8deluxe_courses" add column "console_name" text;

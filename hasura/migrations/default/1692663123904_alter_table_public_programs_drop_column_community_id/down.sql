alter table "public"."programs"
  add constraint "programs_community_id_fkey"
  foreign key (community_id)
  references "public"."communities"
  (id) on update cascade on delete cascade;
alter table "public"."programs" alter column "community_id" drop not null;
alter table "public"."programs" add column "community_id" uuid;

comment on column "public"."matches"."map_id" is E'試合';
alter table "public"."matches"
  add constraint "matches_map_id_fkey"
  foreign key (map_id)
  references "public"."amongus_maps"
  (id) on update set null on delete set null;
alter table "public"."matches" alter column "map_id" drop not null;
alter table "public"."matches" add column "map_id" uuid;

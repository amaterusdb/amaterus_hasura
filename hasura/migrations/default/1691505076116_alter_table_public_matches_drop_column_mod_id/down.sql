comment on column "public"."matches"."mod_id" is E'試合';
alter table "public"."matches"
  add constraint "matches_mod_id_fkey"
  foreign key (mod_id)
  references "public"."mods"
  (id) on update set null on delete set null;
alter table "public"."matches" alter column "mod_id" drop not null;
alter table "public"."matches" add column "mod_id" uuid;

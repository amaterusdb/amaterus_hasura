comment on column "public"."matches"."vanilla_version_id" is E'試合';
alter table "public"."matches"
  add constraint "matches_vanilla_version_id_fkey"
  foreign key (vanilla_version_id)
  references "public"."amongus_vanilla_versions"
  (id) on update set null on delete set null;
alter table "public"."matches" alter column "vanilla_version_id" drop not null;
alter table "public"."matches" add column "vanilla_version_id" uuid;

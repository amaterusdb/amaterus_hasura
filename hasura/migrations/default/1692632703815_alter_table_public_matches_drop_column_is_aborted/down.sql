comment on column "public"."matches"."is_aborted" is E'試合';
alter table "public"."matches" alter column "is_aborted" drop not null;
alter table "public"."matches" add column "is_aborted" bool;

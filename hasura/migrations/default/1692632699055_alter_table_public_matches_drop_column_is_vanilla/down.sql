comment on column "public"."matches"."is_vanilla" is E'試合';
alter table "public"."matches" alter column "is_vanilla" drop not null;
alter table "public"."matches" add column "is_vanilla" bool;

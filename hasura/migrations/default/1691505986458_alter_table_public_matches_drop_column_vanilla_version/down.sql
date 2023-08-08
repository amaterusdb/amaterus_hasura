comment on column "public"."matches"."vanilla_version" is E'試合';
alter table "public"."matches" alter column "vanilla_version" drop not null;
alter table "public"."matches" add column "vanilla_version" text;

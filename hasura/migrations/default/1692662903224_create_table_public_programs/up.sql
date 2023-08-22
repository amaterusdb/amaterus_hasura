CREATE TABLE "public"."programs" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "community_id" uuid NOT NULL, "game_id" uuid, "title" text NOT NULL, "start_time" timestamptz NOT NULL, "end_time" timestamptz NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("community_id") REFERENCES "public"."communities"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("game_id") REFERENCES "public"."games"("id") ON UPDATE set null ON DELETE set null);
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_programs_updated_at"
BEFORE UPDATE ON "public"."programs"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_programs_updated_at" ON "public"."programs"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

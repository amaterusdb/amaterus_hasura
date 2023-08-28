CREATE TABLE "public"."mariokart8deluxe_races" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "program_id" uuid NOT NULL, "start_time" timestamptz NOT NULL, "end_time" timestamptz, "is_aborted" boolean, "mariokart8deluxe_course_id" uuid, "index" integer, PRIMARY KEY ("id") , FOREIGN KEY ("program_id") REFERENCES "public"."programs"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("mariokart8deluxe_course_id") REFERENCES "public"."mariokart8deluxe_courses"("id") ON UPDATE set null ON DELETE set null, UNIQUE ("program_id", "index"));
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
CREATE TRIGGER "set_public_mariokart8deluxe_races_updated_at"
BEFORE UPDATE ON "public"."mariokart8deluxe_races"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_mariokart8deluxe_races_updated_at" ON "public"."mariokart8deluxe_races"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

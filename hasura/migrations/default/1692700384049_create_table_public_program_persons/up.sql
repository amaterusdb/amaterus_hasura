CREATE TABLE "public"."program_persons" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "program_id" uuid NOT NULL, "person_id" uuid NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("person_id") REFERENCES "public"."persons"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("program_id") REFERENCES "public"."programs"("id") ON UPDATE cascade ON DELETE cascade, UNIQUE ("program_id", "person_id"));
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
CREATE TRIGGER "set_public_program_persons_updated_at"
BEFORE UPDATE ON "public"."program_persons"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_program_persons_updated_at" ON "public"."program_persons"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

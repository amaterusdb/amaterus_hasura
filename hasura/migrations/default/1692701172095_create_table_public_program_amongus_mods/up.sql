CREATE TABLE "public"."program_amongus_mods" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "program_id" uuid NOT NULL, "amongus_mod_id" uuid NOT NULL, "amongus_mod_version_id" uuid, PRIMARY KEY ("id") , FOREIGN KEY ("program_id") REFERENCES "public"."programs"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("amongus_mod_id") REFERENCES "public"."amongus_mods"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("amongus_mod_version_id") REFERENCES "public"."amongus_mod_versions"("id") ON UPDATE set null ON DELETE set null, UNIQUE ("program_id", "amongus_mod_id"), UNIQUE ("program_id", "amongus_mod_id", "amongus_mod_version_id"));
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
CREATE TRIGGER "set_public_program_amongus_mods_updated_at"
BEFORE UPDATE ON "public"."program_amongus_mods"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_program_amongus_mods_updated_at" ON "public"."program_amongus_mods"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

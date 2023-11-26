CREATE TABLE "public"."amongus_hidenseek_match_mods" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "amongus_hidenseek_match_id" uuid NOT NULL, "amongus_mod_id" uuid NOT NULL, "amongus_mod_version_id" uuid, PRIMARY KEY ("id") , FOREIGN KEY ("amongus_hidenseek_match_id") REFERENCES "public"."amongus_hidenseek_matches"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("amongus_mod_id") REFERENCES "public"."amongus_mods"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("amongus_mod_version_id") REFERENCES "public"."amongus_mod_versions"("id") ON UPDATE set null ON DELETE set null, UNIQUE ("amongus_hidenseek_match_id", "amongus_mod_id"));
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
CREATE TRIGGER "set_public_amongus_hidenseek_match_mods_updated_at"
BEFORE UPDATE ON "public"."amongus_hidenseek_match_mods"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_amongus_hidenseek_match_mods_updated_at" ON "public"."amongus_hidenseek_match_mods"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

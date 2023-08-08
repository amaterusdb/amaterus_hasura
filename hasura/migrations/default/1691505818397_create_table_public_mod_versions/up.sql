CREATE TABLE "public"."mod_versions" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "mod_id" uuid NOT NULL, "version" text NOT NULL, "github_url" text, PRIMARY KEY ("id") , FOREIGN KEY ("mod_id") REFERENCES "public"."mods"("id") ON UPDATE cascade ON DELETE cascade, UNIQUE ("mod_id", "version"));
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
CREATE TRIGGER "set_public_mod_versions_updated_at"
BEFORE UPDATE ON "public"."mod_versions"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_mod_versions_updated_at" ON "public"."mod_versions"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE "public"."room_mods" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "room_id" uuid NOT NULL, "mod_id" uuid NOT NULL, "mod_version_id" uuid NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("room_id") REFERENCES "public"."rooms"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("mod_id") REFERENCES "public"."mods"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("mod_version_id") REFERENCES "public"."mod_versions"("id") ON UPDATE cascade ON DELETE cascade);
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
CREATE TRIGGER "set_public_room_mods_updated_at"
BEFORE UPDATE ON "public"."room_mods"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_room_mods_updated_at" ON "public"."room_mods"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

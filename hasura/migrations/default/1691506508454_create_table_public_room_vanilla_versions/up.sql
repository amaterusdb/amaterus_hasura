CREATE TABLE "public"."room_vanilla_versions" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "room_id" uuid NOT NULL, "vanilla_version_id" uuid NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("room_id") REFERENCES "public"."rooms"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("vanilla_version_id") REFERENCES "public"."vanilla_versions"("id") ON UPDATE cascade ON DELETE cascade);
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
CREATE TRIGGER "set_public_room_vanilla_versions_updated_at"
BEFORE UPDATE ON "public"."room_vanilla_versions"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_room_vanilla_versions_updated_at" ON "public"."room_vanilla_versions"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

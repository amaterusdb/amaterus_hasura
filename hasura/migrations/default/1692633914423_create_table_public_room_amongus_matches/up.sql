CREATE TABLE "public"."room_amongus_matches" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "room_id" uuid NOT NULL, "start_time" timestamptz NOT NULL, "end_time" timestamptz, "is_aborted" boolean, "is_vanilla" boolean, "amongus_vanilla_version_id" uuid, "amongus_map_id" uuid, "index" integer, PRIMARY KEY ("id") , FOREIGN KEY ("room_id") REFERENCES "public"."rooms"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("amongus_vanilla_version_id") REFERENCES "public"."amongus_vanilla_versions"("id") ON UPDATE set null ON DELETE set null, FOREIGN KEY ("amongus_map_id") REFERENCES "public"."amongus_maps"("id") ON UPDATE cascade ON DELETE cascade, UNIQUE ("room_id", "index"));
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
CREATE TRIGGER "set_public_room_amongus_matches_updated_at"
BEFORE UPDATE ON "public"."room_amongus_matches"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_room_amongus_matches_updated_at" ON "public"."room_amongus_matches"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

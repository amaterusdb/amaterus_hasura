CREATE TABLE "public"."lethalcompany_ship_days" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "lethalcompany_ship_id" uuid NOT NULL, "day_number" integer NOT NULL, "sub_day_number" integer NOT NULL, "lethalcompany_map_id" uuid, "lethalcompany_weather_id" uuid, PRIMARY KEY ("id") , FOREIGN KEY ("lethalcompany_ship_id") REFERENCES "public"."lethalcompany_ships"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("lethalcompany_map_id") REFERENCES "public"."lethalcompany_maps"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("lethalcompany_weather_id") REFERENCES "public"."lethalcompany_weathers"("id") ON UPDATE cascade ON DELETE cascade, UNIQUE ("lethalcompany_ship_id", "day_number", "sub_day_number"));
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
CREATE TRIGGER "set_public_lethalcompany_ship_days_updated_at"
BEFORE UPDATE ON "public"."lethalcompany_ship_days"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_lethalcompany_ship_days_updated_at" ON "public"."lethalcompany_ship_days"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

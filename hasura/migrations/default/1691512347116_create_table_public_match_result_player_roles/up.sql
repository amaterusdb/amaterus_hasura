CREATE TABLE "public"."match_result_player_roles" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "match_id" uuid NOT NULL, "person_id" uuid NOT NULL, "player_role_id" uuid NOT NULL, "player_role_order_index" integer NOT NULL, "player_role_name" text, PRIMARY KEY ("id") , FOREIGN KEY ("match_id") REFERENCES "public"."matches"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("person_id") REFERENCES "public"."persons"("id") ON UPDATE cascade ON DELETE cascade, FOREIGN KEY ("player_role_id") REFERENCES "public"."player_roles"("id") ON UPDATE cascade ON DELETE cascade, UNIQUE ("match_id", "person_id", "player_role_id"), UNIQUE ("match_id", "person_id", "player_role_order_index"));
CREATE EXTENSION IF NOT EXISTS pgcrypto;

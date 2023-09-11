alter table "public"."mariokart8deluxe_races"
  add constraint "mariokart8deluxe_races_mariokart8deluxe_race_rule_id_fkey"
  foreign key ("mariokart8deluxe_race_rule_id")
  references "public"."mariokart8deluxe_race_rules"
  ("id") on update set null on delete set null;

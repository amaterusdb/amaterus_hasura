alter table "public"."person_twitter_accounts" add constraint "person_twitter_accounts_person_id_twitter_screen_name_key" unique ("person_id", "twitter_screen_name");

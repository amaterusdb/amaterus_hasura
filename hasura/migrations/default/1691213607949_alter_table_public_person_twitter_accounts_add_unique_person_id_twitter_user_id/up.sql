alter table "public"."person_twitter_accounts" add constraint "person_twitter_accounts_person_id_twitter_user_id_key" unique ("person_id", "twitter_user_id");

alter table "public"."person_niconico_accounts" add constraint "person_niconico_accounts_person_id_niconico_account_id_key" unique ("person_id", "niconico_account_id");

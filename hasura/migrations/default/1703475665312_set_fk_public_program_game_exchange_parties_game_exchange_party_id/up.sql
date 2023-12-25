alter table "public"."program_game_exchange_parties" drop constraint "program_game_gift_exchange_par_game_gift_exchange_party_id_fkey",
  add constraint "program_game_exchange_parties_game_exchange_party_id_fkey"
  foreign key ("game_exchange_party_id")
  references "public"."game_exchange_parties"
  ("id") on update cascade on delete cascade;

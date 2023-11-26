alter table "public"."program_live_archives" add constraint "program_live_archives_program_id_niconico_live_id_key" unique ("program_id", "niconico_live_id");

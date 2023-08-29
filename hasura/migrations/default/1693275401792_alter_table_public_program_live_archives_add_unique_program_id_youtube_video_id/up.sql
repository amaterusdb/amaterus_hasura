alter table "public"."program_live_archives" add constraint "program_live_archives_program_id_youtube_video_id_key" unique ("program_id", "youtube_video_id");

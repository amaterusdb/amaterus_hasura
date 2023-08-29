alter table "public"."program_live_archives"
  add constraint "program_live_archives_youtube_video_id_fkey"
  foreign key ("youtube_video_id")
  references "public"."youtube_videos"
  ("id") on update cascade on delete cascade;

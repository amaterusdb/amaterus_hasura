alter table "public"."room_youtube_lives" add constraint "room_youtube_lives_room_id_person_id_youtube_video_id_key" unique ("room_id", "person_id", "youtube_video_id");

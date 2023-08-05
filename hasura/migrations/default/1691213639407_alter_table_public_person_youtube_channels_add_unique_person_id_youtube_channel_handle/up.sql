alter table "public"."person_youtube_channels" add constraint "person_youtube_channels_person_id_youtube_channel_handle_key" unique ("person_id", "youtube_channel_handle");

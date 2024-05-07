CREATE  INDEX "crawler__youtube_channel_video_co_remote_youtube_channel_id_key" on
  "public"."crawler__youtube_channel_video_configs" using btree ("remote_youtube_channel_id");

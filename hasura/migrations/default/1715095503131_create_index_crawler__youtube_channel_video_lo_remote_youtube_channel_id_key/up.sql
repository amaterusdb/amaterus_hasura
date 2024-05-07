CREATE  INDEX "crawler__youtube_channel_video_lo_remote_youtube_channel_id_key" on
  "public"."crawler__youtube_channel_video_logs" using btree ("remote_youtube_channel_id");

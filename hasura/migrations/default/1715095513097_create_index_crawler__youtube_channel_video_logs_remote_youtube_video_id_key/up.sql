CREATE  INDEX "crawler__youtube_channel_video_logs_remote_youtube_video_id_key" on
  "public"."crawler__youtube_channel_video_logs" using btree ("remote_youtube_video_id");

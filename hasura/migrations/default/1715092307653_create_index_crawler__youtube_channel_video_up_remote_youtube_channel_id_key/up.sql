CREATE  INDEX "crawler__youtube_channel_video_up_remote_youtube_channel_id_key" on
  "public"."crawler__youtube_channel_video_update_task__ytch_video_logs" using btree ("remote_youtube_channel_id");

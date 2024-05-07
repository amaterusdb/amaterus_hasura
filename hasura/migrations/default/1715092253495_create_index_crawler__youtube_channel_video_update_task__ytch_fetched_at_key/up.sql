CREATE  INDEX "crawler__youtube_channel_video_update_task__ytch_fetched_at_key" on
  "public"."crawler__youtube_channel_video_update_task__ytch_video_logs" using btree ("fetched_at");

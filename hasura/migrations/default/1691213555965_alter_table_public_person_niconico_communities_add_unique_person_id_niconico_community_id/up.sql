alter table "public"."person_niconico_communities" add constraint "person_niconico_communities_person_id_niconico_community_id_key" unique ("person_id", "niconico_community_id");

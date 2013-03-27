# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130325123056) do

  create_table "field_histories", :force => true do |t|
    t.string   "value"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "field_histories", ["user_id"], :name => "index_field_histories_on_user_id"

  create_table "games", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "games_projects", :id => false, :force => true do |t|
    t.integer "project_id", :null => false
    t.integer "game_id",    :null => false
  end

  add_index "games_projects", ["project_id", "game_id"], :name => "index_games_projects_on_project_id_and_game_id", :unique => true

  create_table "project_users", :force => true do |t|
    t.string   "proj_role"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "client"
    t.string   "project_type"
    t.string   "highrise"
    t.string   "skydrive"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.string   "basecamp"
    t.string   "participant_count"
    t.string   "game"
    t.text     "groups_division"
    t.string   "number_of_rooms"
    t.string   "date_of_game"
    t.string   "hour_duration"
    t.string   "localization"
    t.string   "contacts_client"
    t.string   "contacts_hotel"
    t.text     "transport_details"
    t.text     "accomodation"
    t.text     "target_agreed_with_customer"
    t.text     "other_expectations"
    t.string   "subject"
    t.text     "profile_of_participants"
    t.string   "contact_person_on_client_side"
    t.string   "host_of_the_meeting"
    t.text     "other_information"
    t.string   "leading_head_coach"
    t.string   "second_coach"
    t.string   "cpd_trainee"
    t.text     "assistants"
    t.text     "agenda_of_meeting"
    t.text     "responsibilities_division"
    t.text     "after_game_summary"
    t.text     "invitation_for_participants"
    t.text     "purpose_and_other_expectations"
    t.text     "participants_short_description_in_groups"
    t.text     "course_of_training"
    t.text     "on_fly_findings_and_suggestions"
    t.text     "project_evaluation"
    t.text     "proposals_for_sales_potential"
    t.text     "merytoryka"
    t.text     "conduct_and_summary_of_game"
    t.text     "notes_on_materials"
    t.text     "notes_on_organization"
    t.integer  "name_history_id"
    t.integer  "client_history_id"
    t.integer  "project_type_history_id"
    t.integer  "highrise_history_id"
    t.integer  "skydrive_history_id"
    t.integer  "basecamp_history_id"
    t.integer  "participant_count_history_id"
    t.integer  "game_history_id"
    t.integer  "groups_division_history_id"
    t.integer  "number_of_rooms_history_id"
    t.integer  "date_of_game_history_id"
    t.integer  "hour_duration_history_id"
    t.integer  "localization_history_id"
    t.integer  "contacts_client_history_id"
    t.integer  "contacts_hotel_history_id"
    t.integer  "transport_details_history_id"
    t.integer  "accomodation_history_id"
    t.integer  "target_agreed_with_customer_history_id"
    t.integer  "other_expectations_history_id"
    t.integer  "subject_history_id"
    t.integer  "profile_of_participants_history_id"
    t.integer  "contact_person_on_client_side_history_id"
    t.integer  "host_of_the_meeting_history_id"
    t.integer  "other_information_history_id"
    t.integer  "leading_head_coach_history_id"
    t.integer  "second_coach_history_id"
    t.integer  "cpd_trainee_history_id"
    t.integer  "assistants_history_id"
    t.integer  "agenda_of_meeting_history_id"
    t.integer  "responsibilities_division_history_id"
    t.integer  "after_game_summary_history_id"
    t.integer  "invitation_for_participants_history_id"
    t.integer  "purpose_and_other_expectations_history_id"
    t.integer  "participants_short_description_in_groups_history_id"
    t.integer  "course_of_training_history_id"
    t.integer  "on_fly_findings_and_suggestions_history_id"
    t.integer  "project_evaluation_history_id"
    t.integer  "proposals_for_sales_potential_history_id"
    t.integer  "merytoryka_history_id"
    t.integer  "conduct_and_summary_of_game_history_id"
    t.integer  "notes_on_materials_history_id"
    t.integer  "notes_on_organization_history_id"
    t.string   "numer_ks"
    t.integer  "numer_ks_history_id"
    t.integer  "user_roles_id"
    t.integer  "name_author"
    t.integer  "client_author"
    t.integer  "project_type_author"
    t.integer  "highrise_author"
    t.integer  "skydrive_author"
    t.integer  "basecamp_author"
    t.integer  "participant_count_author"
    t.integer  "game_author"
    t.integer  "groups_division_author"
    t.integer  "number_of_rooms_author"
    t.integer  "date_of_game_author"
    t.integer  "hour_duration_author"
    t.integer  "localization_author"
    t.integer  "contacts_client_author"
    t.integer  "contacts_hotel_author"
    t.integer  "transport_details_author"
    t.integer  "accomodation_author"
    t.integer  "target_agreed_with_customer_author"
    t.integer  "other_expectations_author"
    t.integer  "subject_author"
    t.integer  "profile_of_participants_author"
    t.integer  "contact_person_on_client_side_author"
    t.integer  "host_of_the_meeting_author"
    t.integer  "other_information_author"
    t.integer  "leading_head_coach_author"
    t.integer  "second_coach_author"
    t.integer  "cpd_trainee_author"
    t.integer  "assistants_author"
    t.integer  "agenda_of_meeting_author"
    t.integer  "responsibilities_division_author"
    t.integer  "after_game_summary_author"
    t.integer  "invitation_for_participants_author"
    t.integer  "purpose_and_other_expectations_author"
    t.integer  "participants_short_description_in_groups_author"
    t.integer  "course_of_training_author"
    t.integer  "on_fly_findings_and_suggestions_author"
    t.integer  "project_evaluation_author"
    t.integer  "proposals_for_sales_potential_author"
    t.integer  "merytoryka_author"
    t.integer  "conduct_and_summary_of_game_author"
    t.integer  "notes_on_materials_author"
    t.integer  "notes_on_organization_author"
    t.integer  "numer_ks_author"
  end

  add_index "projects", ["accomodation_history_id"], :name => "fk_accomodation_history_id_histories"
  add_index "projects", ["after_game_summary_history_id"], :name => "fk_after_game_summary_history_id_histories"
  add_index "projects", ["agenda_of_meeting_history_id"], :name => "fk_agenda_of_meeting_history_id_histories"
  add_index "projects", ["assistants_history_id"], :name => "fk_assistants_history_id_histories"
  add_index "projects", ["basecamp_history_id"], :name => "fk_basecamp_history_id_histories"
  add_index "projects", ["client_history_id"], :name => "fk_client_history_id_histories"
  add_index "projects", ["conduct_and_summary_of_game_history_id"], :name => "fk_conduct_and_summary_of_game_history_id_histories"
  add_index "projects", ["contact_person_on_client_side_history_id"], :name => "fk_contact_person_on_client_side_history_id_histories"
  add_index "projects", ["contacts_client_history_id"], :name => "fk_contacts_client_history_id_histories"
  add_index "projects", ["contacts_hotel_history_id"], :name => "fk_contacts_hotel_history_id_histories"
  add_index "projects", ["course_of_training_history_id"], :name => "fk_course_of_training_history_id_histories"
  add_index "projects", ["cpd_trainee_history_id"], :name => "fk_cpd_trainee_history_id_histories"
  add_index "projects", ["date_of_game_history_id"], :name => "fk_date_of_game_history_id_histories"
  add_index "projects", ["game_history_id"], :name => "fk_game_history_id_histories"
  add_index "projects", ["groups_division_history_id"], :name => "fk_groups_division_history_id_histories"
  add_index "projects", ["highrise_history_id"], :name => "fk_highrise_history_id_histories"
  add_index "projects", ["host_of_the_meeting_history_id"], :name => "fk_host_of_the_meeting_history_id_histories"
  add_index "projects", ["hour_duration_history_id"], :name => "fk_hour_duration_history_id_histories"
  add_index "projects", ["invitation_for_participants_history_id"], :name => "fk_invitation_for_participants_history_id_histories"
  add_index "projects", ["leading_head_coach_history_id"], :name => "fk_leading_head_coach_history_id_histories"
  add_index "projects", ["localization_history_id"], :name => "fk_localization_history_id_histories"
  add_index "projects", ["merytoryka_history_id"], :name => "fk_merytoryka_history_id_histories"
  add_index "projects", ["name_history_id"], :name => "fk_name_history_id_histories"
  add_index "projects", ["notes_on_materials_history_id"], :name => "fk_notes_on_materials_history_id_histories"
  add_index "projects", ["notes_on_organization_history_id"], :name => "fk_notes_on_organization_history_id_histories"
  add_index "projects", ["number_of_rooms_history_id"], :name => "fk_number_of_rooms_history_id_histories"
  add_index "projects", ["numer_ks_history_id"], :name => "fk_numer_ks_history_id_histories"
  add_index "projects", ["on_fly_findings_and_suggestions_history_id"], :name => "fk_on_fly_findings_and_suggestions_history_id_histories"
  add_index "projects", ["other_expectations_history_id"], :name => "fk_other_expectations_history_id_histories"
  add_index "projects", ["other_information_history_id"], :name => "fk_other_information_history_id_histories"
  add_index "projects", ["participant_count_history_id"], :name => "fk_participant_count_history_id_histories"
  add_index "projects", ["participants_short_description_in_groups_history_id"], :name => "fk_participants_short_description_in_groups_history_id_histories"
  add_index "projects", ["profile_of_participants_history_id"], :name => "fk_profile_of_participants_history_id_histories"
  add_index "projects", ["project_evaluation_history_id"], :name => "fk_project_evaluation_history_id_histories"
  add_index "projects", ["project_type_history_id"], :name => "fk_project_type_history_id_histories"
  add_index "projects", ["proposals_for_sales_potential_history_id"], :name => "fk_proposals_for_sales_potential_history_id_histories"
  add_index "projects", ["purpose_and_other_expectations_history_id"], :name => "fk_purpose_and_other_expectations_history_id_histories"
  add_index "projects", ["responsibilities_division_history_id"], :name => "fk_responsibilities_division_history_id_histories"
  add_index "projects", ["second_coach_history_id"], :name => "fk_second_coach_history_id_histories"
  add_index "projects", ["skydrive_history_id"], :name => "fk_skydrive_history_id_histories"
  add_index "projects", ["subject_history_id"], :name => "fk_subject_history_id_histories"
  add_index "projects", ["target_agreed_with_customer_history_id"], :name => "fk_target_agreed_with_customer_history_id_histories"
  add_index "projects", ["transport_details_history_id"], :name => "fk_transport_details_history_id_histories"

  create_table "user_project_roles", :force => true do |t|
    t.string   "proj_role"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "role"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "name"
    t.integer  "user_roles_id"
  end

  create_table "welcomes", :force => true do |t|
    t.string   "name"
    t.string   "client"
    t.string   "type"
    t.string   "highrise"
    t.string   "skydrive"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end

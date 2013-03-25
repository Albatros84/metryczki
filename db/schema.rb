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
    t.string   "name_author"
    t.string   "client_author"
    t.string   "project_type_author"
    t.string   "highrise_author"
    t.string   "skydrive_author"
    t.string   "basecamp_author"
    t.string   "participant_count_author"
    t.string   "game_author"
    t.string   "groups_division_author"
    t.string   "number_of_rooms_author"
    t.string   "date_of_game_author"
    t.string   "hour_duration_author"
    t.string   "localization_author"
    t.string   "contacts_client_author"
    t.string   "contacts_hotel_author"
    t.string   "transport_details_author"
    t.string   "accomodation_author"
    t.string   "target_agreed_with_customer_author"
    t.string   "other_expectations_author"
    t.string   "subject_author"
    t.string   "proftile_of_participants_author"
    t.string   "contact_person_on_client_side_author"
    t.string   "host_of_the_meeting_author"
    t.string   "other_information_author"
    t.string   "leading_head_coach_author"
    t.string   "second_coach_author"
    t.string   "cpd_trainee_author"
    t.string   "assistants_author"
    t.string   "agenda_of_meeting_author"
    t.string   "responsibilities_division_author"
    t.string   "after_game_summary_author"
    t.string   "invitation_for_participants_author"
    t.string   "purpose_and_other_expectations_author"
    t.string   "participants_short_description_in_groups_author"
    t.string   "course_of_training_author"
    t.string   "on_fly_findings_and_suggestions_author"
    t.string   "project_evaluation_author"
    t.string   "proposals_for_sales_potential_author"
    t.string   "merytoryka_author"
    t.string   "conduct_and_summary_of_game_author"
    t.string   "notes_on_materials_author"
    t.string   "notes_on_organization_author"
    t.string   "numer_ks_author"
  end

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

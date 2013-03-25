#!/usr/local/bin/ruby
# coding: utf-8
class Project < ActiveRecord::Base
   
  has_many :project_users
  has_many :users, :through=>:project_users
  
  has_many :field_histories
  has_many :users, :through=>:field_histories
  has_and_belongs_to_many :games, order: :name
  validates :numer_ks, :numericality => { :only_integer => true }
  validates :numer_ks, :length=>{:maximum => 4}, :allow_blank => true, :allow_nil=>:true
  
  attr_accessible :client, :highrise, :name, :project_type, :skydrive, :basecamp,
  :participant_count, :game, :groups_division, :number_of_rooms, :date_of_game, :hour_duration,
  :localization, :contacts_client, :contacts_hotel, :transport_details, :accomodation,
  :target_agreed_with_customer, :other_expectations, :subject, :profile_of_participants,
  :contact_person_on_client_side, :host_of_the_meeting, :other_information, :leading_head_coach,
  :second_coach, :cpd_trainee, :assistants, :agenda_of_meeting, :responsibilities_division,
  :after_game_summary, :invitation_for_participants, :purpose_and_other_expectations,:participants_short_description_in_groups,
  :course_of_training, :on_fly_findings_and_suggestions, :project_evaluation, :proposals_for_sales_potential,
  :merytoryka, :conduct_and_summary_of_game, :notes_on_materials, :notes_on_organization, :game_ids, :numer_ks, :user_roles_id
  
  attr_accessible :responsibilities_division_author
    
  validates_presence_of :name, :on => :create
  validates_presence_of :client, :on => :create
  validates_presence_of :project_type, :on => :create
  
  validates :client, :highrise, :skydrive, :basecamp, :name, :project_type, :length => { :maximum => 240 }
  validates :game, :number_of_rooms, :date_of_game, :hour_duration, :localization, :contacts_client, :contacts_hotel, :length => { :maximum => 240 }
  validates :subject, :contact_person_on_client_side, :host_of_the_meeting, :leading_head_coach, :length => { :maximum => 240 }
  validates :second_coach, :cpd_trainee, :length=>{:maximum=>240}
  
  validates :client_author, :highrise_author, :name_author, :project_type_author, :skydrive_author, :basecamp_author,
  :participant_count_author, :game_author, :groups_division_author, :number_of_rooms_author, :date_of_game_author, :hour_duration_author,
  :localization_author, :contacts_client_author, :contacts_hotel_author, :transport_details_author, :accomodation_author,
  :target_agreed_with_customer_author, :other_expectations_author, :subject_author, :profile_of_participants,
  :contact_person_on_client_side_author, :host_of_the_meeting_author, :other_information_author, :leading_head_coach_author,
  :second_coach_author, :cpd_trainee_author, :assistants_author, :agenda_of_meeting_author, :responsibilities_division_author,
  :after_game_summary_author, :invitation_for_participants_author, :purpose_and_other_expectations_author, :participants_short_description_in_groups_author,
  :course_of_training_author, :on_fly_findings_and_suggestions_author, :project_evaluation_author, :proposals_for_sales_potential_author, 
  :merytoryka_author, :conduct_and_summary_of_game_author, :notes_on_materials_author, :notes_on_organization_author, :numer_ks_author, :length=>{ :maximum=> 240 }
   
  validates_format_of :highrise, :with => URI::regexp(%w(http https)) 
  validates_format_of :skydrive, :with => URI::regexp(%w(http https)), :allow_blank=>true, :allow_nil=>true
  validates_format_of :basecamp, :with => URI::regexp(%w(http https)), :allow_blank=>true, :allow_nil=>true

end

    
    
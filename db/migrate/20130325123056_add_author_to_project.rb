class AddAuthorToProject < ActiveRecord::Migration
  Fields=[:name_author, :client_author,:project_type_author,:highrise_author,:skydrive_author,
        :basecamp_author , :participant_count_author,:game_author,:groups_division_author,
        :number_of_rooms_author,:date_of_game_author,:hour_duration_author,
        :localization_author,:contacts_client_author,:contacts_hotel_author,
        :transport_details_author,:accomodation_author,:target_agreed_with_customer_author,
        :other_expectations_author,:subject_author,:proftile_of_participants_author,
        :contact_person_on_client_side_author,:host_of_the_meeting_author,
        :other_information_author,:leading_head_coach_author,:second_coach_author,
        :cpd_trainee_author,:assistants_author,:agenda_of_meeting_author,
        :responsibilities_division_author,:after_game_summary_author,:invitation_for_participants_author,
        :purpose_and_other_expectations_author,:participants_short_description_in_groups_author,
        :course_of_training_author,:on_fly_findings_and_suggestions_author,
        :project_evaluation_author,:proposals_for_sales_potential_author,:merytoryka_author,
        :conduct_and_summary_of_game_author,:notes_on_materials_author,:notes_on_organization_author, :numer_ks_author]
  
  def self.up         
    add_col(Fields) 
  end
      
  def self.down       
    rem_col(Fields)                            
  end
  
  def add_col(fields)
   fields.each do |a|
    a=":"+a.to_s
   str="add_column :projects, "
   str2=", :string"
   exec=str+a+str2
   eval(exec)
   end
 end
 
 def rem_col(fields)
   fields.each do |a|
   a=":"+a.to_s
   str="remove_column :projects, "

   exec=str+a
   eval(exec)
   end
 end
end

class AddNameHistoryIdToProject < ActiveRecord::Migration
  Fields=[:name_history_id, :client_history_id,:project_type_history_id,:highrise_history_id,:skydrive_history_id,
        :basecamp_history_id, :participant_count_history_id,:game_history_id,:groups_division_history_id,
        :number_of_rooms_history_id,:date_of_game_history_id,:hour_duration_history_id,
        :localization_history_id,:contacts_client_history_id,:contacts_hotel_history_id,
        :transport_details_history_id,:accomodation_history_id,:target_agreed_with_customer_history_id,
        :other_expectations_history_id,:subject_history_id,:profile_of_participants_history_id,
        :contact_person_on_client_side_history_id,:host_of_the_meeting_history_id,
        :other_information_history_id,:leading_head_coach_history_id,:second_coach_history_id,
        :cpd_trainee_history_id,:assistants_history_id,:agenda_of_meeting_history_id,
        :responsibilities_division_history_id,:after_game_summary_history_id,:invitation_for_participants_history_id,
        :purpose_and_other_expectations_history_id,:participants_short_description_in_groups_history_id,
        :course_of_training_history_id,:on_fly_findings_and_suggestions_history_id,
        :project_evaluation_history_id,:proposals_for_sales_potential_history_id,:merytoryka_history_id,
        :conduct_and_summary_of_game_history_id,:notes_on_materials_history_id,:notes_on_organization_history_id]
  
  def self.up         
    add_col(Fields) 
    do_sql(Fields)
  end
      
  def self.down       
    undo_sql(Fields)
    rem_col(Fields)                            
  end
      
      
      
    def do_sql(arr)    
    arr.each do |a|
      fk="fk_"+a.to_s+"_histories" 
      a="("+a.to_s+")"                       
      str= <<-SQL
      ALTER TABLE projects ADD CONSTRAINT       
      SQL
      str1=<<-SQL
          FOREIGN KEY 
      SQL
      str2=a
      str3=<<-SQL
        REFERENCES field_histories(id)
      SQL
     query=str+fk+str1+str2+str3
     query.gsub!("/n","")
       execute query     
      end            
  end
  
  def undo_sql(arr)
   arr.each do |a|
      fk="fk_"+a.to_s+"_histories" 
      a="("+a.to_s+")"                       
      str= <<-SQL
      ALTER TABLE projects DROP FOREIGN KEY       
      SQL
    
     query=str+fk
     query.gsub!("/n","")
       execute query     
      end  
  end  
  
  def add_col(fields)
   fields.each do |a|
    a=":"+a.to_s
   str="add_column :projects, "
   str2=", :integer"
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
       

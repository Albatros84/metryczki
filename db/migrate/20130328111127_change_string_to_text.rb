class ChangeStringToText < ActiveRecord::Migration
 
  def change
    change_column :projects, :client, :text
    change_column :projects, :highrise, :text
    change_column :projects, :skydrive, :text
    change_column :projects, :basecamp, :text
    change_column :projects, :name, :text
    change_column :projects, :project_type, :text
    change_column :projects, :game, :text
    change_column :projects, :number_of_rooms, :text
    change_column :projects, :date_of_game, :text
    change_column :projects, :hour_duration, :text
    change_column :projects, :localization, :text
    change_column :projects, :contacts_client, :text
    change_column :projects, :contacts_hotel, :text
    change_column :projects, :subject, :text
    change_column :projects, :contact_person_on_client_side, :text
    change_column :projects, :host_of_the_meeting, :text
    change_column :projects, :leading_head_coach, :text
    change_column :projects, :second_coach, :text
    change_column :projects, :cpd_trainee, :text
  end
  
#zmiana typu powyższych kolumn z typu string na text
#TODO usunięcie walidacji varchar255 z modelu
end


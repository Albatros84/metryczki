#!/usr/local/bin/ruby
# coding: utf-8
class ProjectsController < ApplicationController
  before_filter :require_login
   Arr=[:name_history_id, :client_history_id,:project_type_history_id,:highrise_history_id,:skydrive_history_id,
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
        :conduct_and_summary_of_game_history_id,:notes_on_materials_history_id,:notes_on_organization_history_id, :numer_ks_history_id]
    
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all(:order => "updated_at DESC")   
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end
  
  
    def myupdate   
        @user_project=ProjectUser.new
         selected_user = params[:users]
         @user_project.proj_role = params[:proj_role]
         @user_project.project_id=params[:project_id]
         @user_project.user_id=selected_user
         @user_project.save
      
      
      #set_project_users      
      #@field_hist_arr=Hash.new
      #@users_from_history=Hash.new 
      @user_project_roles=Hash.new
      #@user_ids=Array.new
      #@user_names=Array.new
      #@project = Project.find(params[:project_id])
      #@users_from_history=User.all
      @user_project_roles=ProjectUser.find_all_by_project_id(@user_project.project_id)
      #**********
      #@user_project_roles=Hash.new
     # @users=Hash.new
     # @user_project_roles=ProjectUser.all   
      #@users=User.all    
      
         # unless @user_project_roles.empty?
          # @user_project_roles.each do |upr|
          # @user_ids<<upr.user_id
           # end
        # end         
           # @user_ids.each do |id|
            # unless id.nil?
                # @user_names<<User.find(id)        
            # end
           # end
     #***** powyżej jest przeniesione z show       
      
      respond_to do |format|  
        format.js
      end
   end
  
   def set_project_users       
         @user_project=ProjectUser.new
         selected_user = params[:users]
         @user_project.proj_role = params[:proj_role]
         @user_project.project_id=params[:project_id]
         @user_project.user_id=selected_user
         @user_project.save
   end
    
  # GET /projects/1
  # GET /projects/1.json
   
  def color
    @users_from_history=User.all
  end
  
  def show  
    @field_hist_arr=Hash.new
    @users_from_history=Hash.new 
    @user_project_roles=Hash.new
    @user_ids=Array.new
    @user_names=Array.new
    @project = Project.find(params[:id])
    @users_from_history=User.all
    @user_project_roles=ProjectUser.find_all_by_project_id(@project.id)
    #**********
    @users=Hash.new  
    @users=User.all 
    #*************************
     unless @user_project_roles.empty?
        @user_project_roles.each do |upr|
        @user_ids<<upr.user_id
         end
      end
         
         @user_ids.each do |id|
          unless id.nil?
              @user_names<<User.find(id)        
          end
         end
                     
           unless FieldHistory.minimum("id")==nil
        FieldHistory.minimum("id").upto(FieldHistory.maximum("id")){|i|  
          @field_hist_arr[i]=FieldHistory.find(i)    
          }       
           end
    #tu są userzy z idekami takimi jakie mamy field_histories    
    #potrzebujemy tu dostępu do usera, ale jego user_id wyciągamy z field_histories
    #po to żeby wyciągnąć rolę z usera        
               
    respond_to do |format|
      format.html    # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new
    #******partial
     @user_project_roles=Hash.new
     @users=Hash.new
     @user_project_roles=ProjectUser.find_all_by_project_id(@project.id)  
     @users=User.all 

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    #******partial
    @user_project_roles=Hash.new
    @user_names=Hash.new
    @user_project_roles=ProjectUser.all   
    @users=User.all 
    @field_hist_arr=Hash.new
    @users_from_history=Hash.new 
    @user_ids=Array.new
    @user_names=Array.new
    @project = Project.find(params[:id])
    @users_from_history=User.all
    @user_project_roles=ProjectUser.find_all_by_project_id(@project.id)
    #**********
    @user_project_roles=Hash.new
    @users=Hash.new
    @user_project_roles=ProjectUser.all   
    @users=User.all 
    #*************************
     unless @user_project_roles.empty?
        @user_project_roles.each do |upr|
        @user_ids<<upr.user_id
         end
      end
         
         @user_ids.each do |id|
          unless id.nil?
              @user_names<<User.find(id)        
          end
         end
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    params[:project][:game_ids] ||= []
    respond_to do |format|
      if @project.save
       # @user_project=ProjectUser.new
       # selected_user = params[:users]
       # @user_project.proj_role = params[:proj_role]
       # @user_project.project_id=@project.id
       # @user_project.user_id=selected_user
       # @user_project.save     
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  
 

  # PUT /projects/1
  # PUT /projects/1.json
  def update
     @project = Project.find(params[:id])
     params[:project][:game_ids] ||= []
  #******************************
     old_project = Project.find(params[:id])
     id=old_project.id
     params[:project][:game_ids] ||= []
     respond_to do |format|
       if @project.update_attributes(params[:project])
         
         remember_changes params[:project], old_project, id
         format.html { redirect_to projects_url, notice: 'Project was successfully updated.' }                          
          format.js
         format.js { render js: @project, status: :created, location: @project }               
       else
         format.html { render action: "edit" }
         format.json { render json: @project.errors, status: :unprocessable_entity }
       end
    end
  end
  
  def remember_changes(new_array ,old_project,project_id)
    new_array.each do |key,new_value|
      next if key == "game_ids"
      if new_value != old_project[key]
       # raise "#{key}"
          user=current_user
          @field_history = FieldHistory.new
          @field_history.user_id=user.id
          @field_history.value = old_project[key]          
          @field_history.save
          project_instance=Project.find_by_id(project_id)
          proj=String.new          
          proj="project_instance."+"#{key}"+"_history_id=@field_history.id"         
          eval(proj)
          project_instance.save
      end
    end
    
  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

end
end
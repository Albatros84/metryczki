class ProjectUser < ActiveRecord::Base
  attr_accessible :proj_role, :project_id, :user_id
  belongs_to :user
  belongs_to :project  
  validates_uniqueness_of :user_id, :scope=>:project_id
end

class Game < ActiveRecord::Base
  has_and_belongs_to_many :projects
  attr_accessible :name

  validates_presence_of :name
end

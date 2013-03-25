#!/usr/local/bin/ruby
# coding: utf-8
class User < ActiveRecord::Base
  after_destroy :ensure_an_admin_remains #to jest callback
  has_many :field_histories
  has_many :projects, :through=>:field_histories
  
  has_many :project_users
  has_many :projects, :through=>:project_users
  
  before_create { generate_token(:auth_token) }
 
  attr_accessible :email, :password_hash, :password_salt, :role
  #has_secure_password
  attr_accessible :name, :password, :password_confirmation, :user_roles_id
  
  attr_accessor :password
  before_save :encrypt_password
  
  
  validates :name, :length=>{:maximum=>240}
  validates_confirmation_of :password
  validates_presence_of :password, :name, :on => :create
  validates_presence_of :email, :name
  validates_uniqueness_of :email    
  validates_format_of :email, :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i, :on => :create
  validates_inclusion_of :role, :in => ["admin", "trener","biuro", "sprzedaż"]
    

  def ensure_an_admin_remains
    if User.count.zero?
      raise "Can't delete last user"
    end    
  end

    #def self.authenticate(email, password)
  def authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
  

def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver
end

def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end  
end

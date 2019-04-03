class Student < ActiveRecord::Base
  has_secure_password
  has_many :foods

  validates_presence_of :name, :email, :password_digest
end

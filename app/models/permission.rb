class Permission < ActiveRecord::Base
  attr_accessible :name

  has_many :roles_and_permission
  has_many :role, :through => :roles_and_permission



  def to_s
    self.name
  end



end

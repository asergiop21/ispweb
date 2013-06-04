class Supplier < ActiveRecord::Base
  attr_accessible :address, :location_id, :name, :user_id, :zipcode

  has_many :equipment
  belongs_to :location
  belongs_to :user
  


end

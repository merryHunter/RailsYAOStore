class PrivateProfile < ActiveRecord::Base
  attr_accessible :address, :age, :gender, :image, :name

  has_one :user
end

class BusinessProfile < ActiveRecord::Base
  attr_accessible :address, :image, :name, :url

  has_one :user
end

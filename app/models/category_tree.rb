class CategoryTree < ActiveRecord::Base
  attr_accessible :root_id, :subone_id, :subtwo_id

  has_many :categories
end

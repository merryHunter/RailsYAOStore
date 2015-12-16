class Category < ActiveRecord::Base
  attr_accessible :root, :title

  belongs_to :product
  belongs_to :category_tree
end

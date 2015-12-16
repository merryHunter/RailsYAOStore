class AddViewedToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :viewed, :boolean
  end
end

class AddDefaultValuesToPrivateProfile < ActiveRecord::Migration
  def change
    change_column :private_profiles, :name,:text, :default => "Name"
    change_column :private_profiles, :image,:text, :default => "url/image.png"
    change_column :private_profiles, :address,:text, :default => "address"
    change_column :private_profiles, :age,:integer, :default => 0
    change_column :private_profiles, :gender,:text, :default => "unknown"
  end
end

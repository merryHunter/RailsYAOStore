class AddDefaultValueToBusinessProfile < ActiveRecord::Migration
  def change
    change_column :business_profiles, :name, :text, default: "Company"
    change_column :business_profiles, :image, :text, default: "url/image.png"
    change_column :business_profiles, :address, :text, default: "address"
    change_column :business_profiles, :url, :text, default: "url"
  end
end

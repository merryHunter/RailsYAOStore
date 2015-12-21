class CreateBusinessProfiles < ActiveRecord::Migration
  def change
    create_table :business_profiles do |t|
      t.string :name
      t.string :image
      t.string :address
      t.string :url

      t.timestamps
    end
  end
end

class CreatePrivateProfiles < ActiveRecord::Migration
  def change
    create_table :private_profiles do |t|
      t.string :name
      t.string :image
      t.string :address
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end

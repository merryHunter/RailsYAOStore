class CreateCategoryTrees < ActiveRecord::Migration
  def change
    create_table :category_trees do |t|
      t.integer :root_id
      t.integer :subone_id
      t.integer :subtwo_id

      t.timestamps
    end
  end
end

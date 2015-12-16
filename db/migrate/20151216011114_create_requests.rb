class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.boolean :private
      t.boolean :business
      t.date :request_date
      t.string :payment_details

      t.timestamps
    end
  end
end

class RemoveDialogss < ActiveRecord::Migration
  def change
    drop_table :dialogs
  end
end

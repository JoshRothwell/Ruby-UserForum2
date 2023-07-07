class UpdateComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :commenter
    add_reference :comments, :user, foreign_key: true
  end
end



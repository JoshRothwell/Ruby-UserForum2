class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.text :body
      t.string :role
      t.integer :post_count

      t.timestamps
    end
  end
end

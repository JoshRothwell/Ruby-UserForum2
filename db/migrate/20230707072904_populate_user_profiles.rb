class PopulateUserProfiles < ActiveRecord::Migration[7.0]
  def up
    User.find_each do |user|
      UserProfile.create!(user: user)
    end
  end

  def down
    UserProfile.delete_all
  end
end

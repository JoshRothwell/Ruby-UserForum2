# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email: 'PermissionTest@example.com', password: 'Perms4Life', password_confirmation: 'Perms4Life', role: :regular, username: 'PermaMark')
User.create(email: 'admin@example.com', password: 'Superior45', password_confirmation: 'Superior45', role: :admin, username: 'AdminAllan')
User.create(email: 'regular@example.com', password: 'Inferior23', password_confirmation: 'Inferior23', role: :regular, username: 'RegularJoe')

#Article.create(title: "Sample Article", body: "This is the body of the article.", status: "published", user_id: 1)
#Article.create(title: "Sample Article 2", body: "This is the body of the article.", status: "published", user_id: 1)
#Article.create(title: "Sample Article", body: "This is the body of the article.", status: "published", user_id: 2)
#Article.create(title: "Sample Article", body: "This is the body of the article.", status: "published", user_id: 3)


ActiveRecord::Base.transaction do
  user = User.find(1) # Replace 1 with the appropriate user ID
  article = Article.new(title: "Permissions Test 01", body: "This is the body of the article. The goal of this article is to test permissions. Only Mark and the Admin should be able to edit this article.", status: "public")
  article.user = user
  article.save!
end

  
require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  setup do
    @article = articles(:one) # Assuming you have fixtures set up with sample articles
  end

  test "visiting the index" do
    visit articles_url
    assert_selector "h1", text: "Articles"
  end

  test "creating a new article" do
    visit articles_url
    click_on "New Article"

    fill_in "Title", with: "New Article Title"
    fill_in "Body", with: "This is the content of the new article."
    click_on "Create Article"

    assert_text "Article was successfully created."
  end

  test "updating an article" do
    visit articles_url
    click_on "Edit", match: :first

    fill_in "Title", with: "Updated Article Title"
    click_on "Update Article"

    assert_text "Article was successfully updated."
  end

  test "deleting an article" do
    visit articles_url
    page.accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Article was successfully deleted."
  end
end

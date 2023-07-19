require 'rails_helper'

describe Article do
    it "has a title and body" do
      article = Article.new(title: "Sample Article", body: "Lorem ipsum")
      expect(article.title).to eq("Sample Article")
      expect(article.body).to eq("Lorem ipsum")
    end
  end
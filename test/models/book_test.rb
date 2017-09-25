require 'test_helper'

feature "Book model tests" do
  scenario "it has an author" do
    book = Book.create()
  end
end

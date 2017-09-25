require "rails_helper"

feature "A visitor can see an index of books when they visit the books index" do
  scenario "They see a list of books when they visit the books index" do
    5.times do
      name = Faker::Book.author.split(' ')
      author = Author.create(first_name: name[0], last_name: name[1])
      book = Book.create(title: Faker::Book.title, author: author, date_published: Faker::Date.between(90.years.ago, Date.today))
    end

    visit books_path

    expect(page).to have_content("Books index")
    expect(page).to have_content("#{Book.first.author_name}")
    expect(page).to have_content("#{Book.second.author_name}")
    expect(page).to have_content("#{Book.third.date_published}")
    expect(page).to have_content("#{Book.fourth.title}")
  end
end

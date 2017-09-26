class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def index2
  end
end

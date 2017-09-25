class Book < ApplicationRecord
  belongs_to :author

  def author_name
    "#{author.first_name} #{author.last_name}"
  end
end

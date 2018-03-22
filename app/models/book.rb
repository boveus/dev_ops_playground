class Book < ApplicationRecord
  belongs_to :author

  def bad_method
    "this is an example of a code smell because this line is far too long.  If a line exceeds 80 characters it is a code smell."
  end

  def author_name
    "#{author.first_name} #{author.last_name}"
  end
end

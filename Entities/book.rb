# frozen_string_literal: true

# Book class
class Book
  attr_reader :title
  attr_reader :author

  def initialize(title, author)
    @title = String(title)
    @author = String(author)
  end
end

# frozen_string_literal: true

# Book class
class Book
  include Validate
  attr_reader :title
  attr_reader :author

  def initialize(title, author)
    @title = title if valid(title, 'String')
    @author = author if valid(author, 'Author')
  end
end

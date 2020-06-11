# frozen_string_literal: true

# Book class
class Book
  include Validate
  attr_reader :title
  attr_reader :author

  def initialize(title, author)
    @title = valid(title, 'String')
    @author = valid(author, 'Author')
  end
end

# frozen_string_literal: true

# Book class
class Book
  include Validate
  attr_reader :title
  attr_reader :author

  def initialize(title, author)
    validate(title, author)
    @title = title
    @author = author
  end

  private

  def validate(title, author)
    validate_class(title, String)
    validate_class(author, Author)
    validate_string(title)
  end
end

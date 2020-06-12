# frozen_string_literal: true

# Book class
class Book
  include Validate
  attr_reader :title
  attr_reader :author

  def initialize(title, author)
    validate(title: title, author: author)
    @title = title
    @author = author
  end

  private

  def validate(title:, author:, title_class: String, author_class: Author)
    validate_class(title, title_class)
    validate_class(author, author_class)
    validate_string(title)
  end
end

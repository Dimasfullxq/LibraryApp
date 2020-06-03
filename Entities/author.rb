# frozen_string_literal: true

# Author class
class Author
  attr_reader :name
  attr_reader :biography

  def initialize(name, biography = 'A good author')
    @name = String(name)
    @biography = String(biography)
  end
end

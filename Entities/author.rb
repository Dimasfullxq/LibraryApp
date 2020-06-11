# frozen_string_literal: true

# Author class
class Author
  include Validate
  attr_reader :name
  attr_reader :biography

  def initialize(name, biography = 'A good author')
    @name = valid(name, 'String')
    @biography = String(biography)
  end
end

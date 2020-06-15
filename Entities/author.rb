# frozen_string_literal: true

# Author class
class Author
  include Validate
  attr_reader :name
  attr_reader :biography

  def initialize(name, biography = 'A good author')
    validate(name)
    @name = name
    @biography = String(biography)
  end

  private

  def validate(name)
    validate_class(name, String)
    validate_string(name)
  end
end

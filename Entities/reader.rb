# frozen_string_literal: true

# Reader Class
class Reader
  include Validate
  attr_reader :name, :email, :city, :street, :house

  def initialize(name:, email:, city:, street:, house:)
    validate(name, email, city, street, house: house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  private

  def validate(*fields, house:)
    validate_class(*fields, String)
    validate_class(house, Integer)
    validate_string(*fields)
    validate_integer(house)
  end
end

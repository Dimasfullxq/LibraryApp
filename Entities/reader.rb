# frozen_string_literal: true

# Reader Class
class Reader
  include Validate
  attr_reader :name
  attr_reader :email
  attr_reader :city
  attr_reader :street
  attr_reader :house

  def initialize(name:, email:, city:, street:, house:)
    @name = valid(name, 'String')
    @email = valid(email, 'String')
    @city = valid(city, 'String')
    @street = valid(street, 'String')
    @house = valid(house, 'Integer')
  end
end

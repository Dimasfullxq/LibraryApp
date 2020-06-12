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
    @name = name if valid(name, 'String')
    @email = email if valid(email, 'String')
    @city = city if valid(city, 'String')
    @street = street if valid(street, 'String')
    @house = house if valid(house, 'Integer')
  end
end

# frozen_string_literal: true

# Reader Class
class Reader
  attr_reader :name
  attr_reader :email
  attr_reader :city
  attr_reader :street
  attr_reader :house

  def initialize(name, email, city, street, house)
    @name = String(name)
    @email = String(email)
    @city = String(city)
    @street = String(street)
    @house = Integer(house)
  end
end

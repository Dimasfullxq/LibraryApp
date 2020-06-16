# frozen_string_literal: true

# Library Class
class Library
  LIBRARY_DATA_FILE = 'data.yml'
  include Uploader
  attr_reader :library_data

  def initialize
    @authors = []
    @orders = []
    @books = []
    @readers = []
  end

  def add(*entities)
    entities.each do |entity|
      case entity
      when Book then @books << entity
      when Author then @authors << entity
      when Order then @orders << entity
      when Reader then @readers << entity
      end
    end
  end

  def top_reader(num = 1)
    top_entity(num, :reader)
  end

  def most_popular_books(num = 1)
    top_entity(num, :book)
  end

  def number_of_readers_of_the_most_popular_books(num = 3)
    most_popular_books(num).map { |book| orders_get.select { |order| order[:book] == book } }
                           .flatten.uniq { |order| order[:reader] }.size
  end

  private

  def orders_get
    @orders.map { |order| { reader: order.reader, book: order.book } }
  end

  def top_entity(num, entity_name)
    entities = orders_get.map { |entity| entity[entity_name] }.uniq
    entities.sort_by { |entity| -entities.count(entity) }.first(num)
  end
end

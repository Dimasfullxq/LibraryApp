# frozen_string_literal: true

# Library Class
class Library
  LIBRARY_DATA_FILE = 'data.yml'
  include Uploader
  attr_reader :authors, :orders, :books, :readers

  def initialize
    @data = load(LIBRARY_DATA_FILE)
    @authors = @data[:authors] || []
    @orders = @data[:orders] || []
    @books = @data[:books] || []
    @readers = @data[:readers] || []
  end

  def add(*entities)
    entities.each do |entity|
      case entity
      when Book then @books << entity
      when Author then @authors << entity
      when Order then @orders << entity
      when Reader then @readers << entity
      else raise Errors::WrongTypeAdded
      end
    end
  end

  def store
    { authors: @authors, books: @books, readers: @readers, orders: @orders }
  end

  def top_reader(num = 1)
    top_entity(num: num, entity_name: :reader, uniq_field: :book)
  end

  def most_popular_books(num = 1)
    top_entity(num: num, entity_name: :book, uniq_field: :reader)
  end

  def number_of_readers_of_the_most_popular_books(num = 3)
    most_popular_books(num).map { |book| @orders.select { |order| order.book == book } }
                           .flatten.uniq(&:reader).size
  end

  private

  def top_entity(num:, entity_name:, uniq_field:)
    entities = @orders.group_by(&entity_name).flat_map { |_key, orders| orders.uniq(&uniq_field) }.map(&entity_name)
    entities.sort_by { |entity| -entities.count(entity) }.uniq.first(num)
  end
end

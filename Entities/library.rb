# frozen_string_literal: true

# Library Class
class Library
  attr_reader :authors
  attr_reader :orders
  attr_reader :readers_with_orders

  def initialize
    @authors = []
    @orders = []
    @readers_with_orders = []
  end

  def add_order(orders)
    orders.each do |order|
      @orders.push(order)
      readers_with_books = {
        reader: order.reader,
        book: order.book
      }
      @readers_with_orders.push(readers_with_books)
    end
  end

  def top_reader(num = 1)
    top_readers = []
    readers = []
    top_entity(num: num, top_entities: top_readers, entities: readers, entity_name: :reader)
  end

  def most_popular_books(num = 1)
    top_books = []
    books = []
    top_entity(num: num, top_entities: top_books, entities: books, entity_name: :book)
  end

  def number_of_readers_of_the_most_popular_books(num = 3)
    readers = []
    top_books = most_popular_books(num)
    top_books.each { |book| readers += @readers_with_orders.uniq.select { |order| order[:book] == book } }
    readers.uniq { |reader| reader[:reader] }.size
  end

  def save(authors:, readers:, books:, orders:)
    data = { authors: authors, readers: readers, books: books, orders: orders }
    file = File.open('data.yml', 'w')
    file.write(data.to_yaml)
    file.close
  end

  def load
    YAML.load_file('data.yml')
  end

  private

  def top_entity(num:, top_entities:, entities:, entity_name:)
    @readers_with_orders.uniq.each { |entity| entities.push(entity[entity_name]) }
    while num.positive?
      top_entity_current = entities.max_by { |entity| entities.count(entity) }
      top_entities.push(top_entity_current)
      entities.delete(top_entity_current)
      num -= 1
    end
    top_entities
  end
end

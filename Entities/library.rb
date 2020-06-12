# frozen_string_literal: true

# Library Class
class Library
  LIBRARY_DATA_FILE = 'data.yml'
  attr_reader :library_data

  def initialize
    @library_data = {
      authors: [], readers: [], books: [], orders: []
    }
  end

  def add(entity, entity_type)
    entity.is_a?(Array) ? @library_data[entity_type] += entity : @library_data[entity_type] << entity
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
    top_books.each { |book| readers += orders_get.uniq.select { |order| order[:book] == book } }
    readers.uniq { |reader| reader[:reader] }.size
  end

  def save(authors:, readers:, books:, orders:)
    data = { authors: authors, readers: readers, books: books, orders: orders }
    file = File.open(LIBRARY_DATA_FILE, 'w')
    file.write(data.to_yaml)
    file.close
  end

  def load
    YAML.load_file(LIBRARY_DATA_FILE)
  end

  private

  def orders_get
    orders = []
    @library_data[:orders].each { |order| orders << { reader: order.reader, book: order.book } }
    orders
  end

  def top_entity(num:, top_entities:, entities:, entity_name:)
    orders_get.uniq.each { |entity| entities.push(entity[entity_name]) }
    while num.positive?
      top_entity_current = entities.max_by { |entity| entities.count(entity) }
      top_entities.push(top_entity_current)
      entities.delete(top_entity_current)
      num -= 1
    end
    top_entities
  end
end

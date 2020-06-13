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

  def add(*entities)
    entities.each do |entity|
      entity_type = entity.class.to_s.downcase.concat('s').to_sym
      @library_data[entity_type] << entity
    end
  end

  def top_reader(num = 1)
    top_entity(num: num, entity_name: :reader)
  end

  def most_popular_books(num = 1)
    top_entity(num: num, entity_name: :book)
  end

  def number_of_readers_of_the_most_popular_books(num = 3)
    readers = []
    top_books = most_popular_books(num)
    top_books.each { |book| readers += orders_get.uniq.select { |order| order[:book] == book } }
    readers.map { |reader| reader[:reader] }.uniq.size
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
    @library_data[:orders].map { |order| { reader: order.reader, book: order.book } }
  end

  def top_entity(num:, top_entities: [], entity_name:)
    entities = orders_get.uniq.map { |entity| entity[entity_name] }
    while num.positive?
      top_entities << entities.max_by { |entity| entities.count(entity) }
      entities.delete(top_entities.last)
      num -= 1
    end
    top_entities
  end
end

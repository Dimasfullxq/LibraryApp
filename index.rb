# frozen_string_literal: true

require 'date'
require 'yaml'
require_relative 'entities/library'
require_relative 'entities/author'
require_relative 'entities/reader'
require_relative 'entities/book'
require_relative 'entities/order'

authors = []
readers = []
orders = []
books = []

library = Library.new

auhtor1 = Author.new('Stan Lee')
auhtor2 = Author.new('Tony Stark')
auhtor3 = Author.new('Steve Rojers')

authors.push(auhtor1, auhtor2, auhtor3)

reader1 = Reader.new(name: 'Dima', email: 'gliffy', city: 'Dnepr', street: 'Sokol', house: 1)
reader2 = Reader.new(name: 'Liza', email: 'liza', city: 'Dnepr', street: 'Mur', house: 12)
reader3 = Reader.new(name: 'Tima', email: 'tima@', city: 'Dnper', street: 'Simph', house: 3)

readers.push(reader1, reader2, reader3)

book1 = Book.new('Spider-Man', auhtor1)
book2 = Book.new('Hulk', auhtor2)
book3 = Book.new('Iron', auhtor3)
book4 = Book.new('Cap', auhtor1)

books.push(book1, book2, book3, book4)

order1 = Order.new(reader: reader1, book: book1)
order2 = Order.new(reader: reader1, book: book2)
order3 = Order.new(reader: reader1, book: book3)
order4 = Order.new(reader: reader2, book: book1)
order5 = Order.new(reader: reader2, book: book2)
order6 = Order.new(reader: reader2, book: book2)
order7 = Order.new(reader: reader3, book: book4)
order8 = Order.new(reader: reader3, book: book4)

orders.push(order1, order2, order3, order4, order5, order6, order7, order8)

library.save(authors: authors, readers: readers, books: books, orders: orders)

data_from_file = library.load
orders_from_file = data_from_file.select { |key, _value| key == :orders }.values[0]
library.add_order(orders_from_file)
puts library.top_reader(2)
puts library.most_popular_books(2)
puts library.number_of_readers_of_the_most_popular_books(1)

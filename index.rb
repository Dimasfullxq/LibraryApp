# frozen_string_literal: true

require_relative 'config/load'

authors = []
readers = []
orders = []
books = []

library = Library.new

author1 = Author.new('Stan Lee')
author2 = Author.new('Tony Stark')
author3 = Author.new('Steve Rojers')

authors.push(author1, author2, author3)

reader1 = Reader.new(name: 'Dima', email: 'gliffy@ukr.net', city: 'Dnepr', street: 'Sokol', house: 1)
reader2 = Reader.new(name: 'Liza', email: 'liza@gmail.com', city: 'Dnepr', street: 'Mur', house: 12)
reader3 = Reader.new(name: 'Tima', email: 'tima@gmail.com', city: 'Dnper', street: 'Simph', house: 3)

readers.push(reader1, reader2, reader3)

book1 = Book.new('Spider-Man', author1)
book2 = Book.new('Hulk', author2)
book3 = Book.new('Iron', author3)
book4 = Book.new('Cap', author1)

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

authors.each { |author| library.add(author) }
books.each { |book| library.add(book) }
readers.each { |reader| library.add(reader) }
orders.each { |order| library.add(order) }
library.add(Author.new('Steven King'), Author.new('Jerome Salinger'))

puts library.top_reader(2)
puts library.most_popular_books(2)
puts library.number_of_readers_of_the_most_popular_books(1)

library.save(Library::LIBRARY_DATA_FILE, library.store)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

@animals = []
CSV.foreach('test/fixtures/files/AnimalHeightWeight.csv', headers: true, header_converters: :symbol) do |row|
  @animals << row.to_h
end

# Reorder to data to aid with splitting test and training data
@animals.shuffle.each do | row |
  AnimalHeightWeight.create(row.to_h)
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed 2 dealerships with 5 cars each

Car.destroy_all
Year.destroy_all
CarModel.destroy_all
Make.destroy_all

cars_data = [
  { year: 2022, make: "Toyota", model: "Camry", trim: "SE", count: 3 },
  { year: 2023, make: "Toyota", model: "Corolla", trim: "LE", count: 2 },
  { year: 2021, make: "Toyota", model: "RAV4", trim: "XLE", count: 4 },
  { year: 2024, make: "Toyota", model: "Highlander", trim: "Limited", count: 1 },
  { year: 2020, make: "Toyota", model: "Prius", trim: "XLE", count: 2 },
]

cars_data2 = [
  { year: 2022, make: "Honda", model: "Civic", trim: "EX", count: 3 },
  { year: 2023, make: "Honda", model: "Accord", trim: "Sport", count: 2 },
  { year: 2021, make: "Honda", model: "CR-V", trim: "EX-L", count: 4 },
  { year: 2024, make: "Honda", model: "Pilot", trim: "Touring", count: 1 },
  { year: 2020, make: "Honda", model: "Fit", trim: "LX", count: 2 },
]

all_cars_data = cars_data + cars_data2

all_cars_data.each do |car_info|
  
  make = Make.find_or_create_by!(name: car_info[:make])

  
  car_model = CarModel.find_or_create_by!(name: car_info[:model], make: make)

  
  year_record = Year.find_or_create_by!(
    year: car_info[:year],
    make: make,
    car_model: car_model
  )

  
  Car.create!(
    make: make,
    car_model: car_model,
    year: year_record,
    trim: car_info[:trim],
    count: car_info[:count]
  )
end

puts "Seeded #{Make.count} makes, #{CarModel.count} models, #{Year.count} years, #{Car.count} cars."


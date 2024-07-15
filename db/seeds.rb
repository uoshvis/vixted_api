# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Item.create([
    {
        "title": "Sleek Granite Pants",
        "description": "New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart",
        "price": "268.00"
    },
    {
        "title": "Recycled Frozen Tuna",
        "description": "Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals",
        "price": "699.00"
    },
    {
        "title": "Generic Metal Shoes",
        "description": "The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive",
        "price": "514.00"
    },
    {
        "title": "Intelligent Concrete Salad",
        "description": "The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive",
        "price": "474.00"
    },
    {
        "title": "Electronic Bronze Car",
        "description": "Ergonomic executive chair upholstered in bonded black leather and PVC padded seat and back for all-day comfort and support",
        "price": "478.00"
    },
    {
        "title": "Gorgeous Cotton Chips",
        "description": "The Apollotech B340 is an affordable wireless mouse with reliable connectivity, 12 months battery life and modern design",
        "price": "314.00"
    },
    {
        "title": "Rustic Cotton Shoes",
        "description": "The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality",
        "price": "725.00"
    },
    {
        "title": "Gorgeous Fresh Shoes",
        "description": "The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J",
        "price": "883.00"
    },
    {
        "title": "Incredible Concrete Salad",
        "description": "Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals",
        "price": "837.00"
    },
    {
        "title": "Sleek Bronze Bike",
        "description": "New range of formal shirts are designed keeping you in mind. With fits and styling that will make you stand apart",
        "price": "192.00"
    }
])
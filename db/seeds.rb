# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


User.create(
[
    {
        "username": "Jaqueline_Ondricka21"
    },
    {
        "username": "Trevion41"
    },
    {
        "username": "Elmer.Steuber"
    },
    {
        "username": "Julien21"
    },
    {
        "username": "Madge_Gislason"
    },
    {
        "username": "Grant37"
    },
    {
        "username": "Bridget_Grimes33"
    },
    {
        "username": "Vallie_Towne92"
    },
    {
        "username": "Isai53"
    },
    {
        "username": "Ryan_Lemke"
    }
]
)

Item.create([
    {
        "user_id": 5,
        "title": "Small Steel Keyboard",
        "description": "Boston's most advanced compression wear technology increases muscle oxygenation, stabilizes active muscles",
        "price": "762.00"
    },
    {
        "user_id": 4,
        "title": "Intelligent Granite Ball",
        "description": "Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals",
        "price": "178.00"
    },
    {
        "user_id": 3,
        "title": "Practical Plastic Pizza",
        "description": "The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality",
        "price": "335.00"
    },
    {
        "user_id": 3,
        "title": "Electronic Granite Gloves",
        "description": "The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J",
        "price": "116.00"
    },
    {
        "user_id": 5,
        "title": "Licensed Bronze Gloves",
        "description": "Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals",
        "price": "254.00"
    },
    {
        "user_id": 1,
        "title": "Rustic Frozen Bacon",
        "description": "Carbonite web goalkeeper gloves are ergonomically designed to give easy fit",
        "price": "353.00"
    },
    {
        "user_id": 5,
        "title": "Bespoke Fresh Pants",
        "description": "New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016",
        "price": "554.00"
    },
    {
        "user_id": 5,
        "title": "Gorgeous Granite Soap",
        "description": "The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive",
        "price": "997.00"
    },
    {
        "user_id": 2,
        "title": "Recycled Steel Soap",
        "description": "The beautiful range of Apple Naturalé that has an exciting mix of natural ingredients. With the Goodness of 100% Natural Ingredients",
        "price": "269.00"
    },
    {
        "user_id": 3,
        "title": "Practical Cotton Soap",
        "description": "The slim & simple Maple Gaming Keyboard from Dev Byte comes with a sleek body and 7- Color RGB LED Back-lighting for smart functionality",
        "price": "39.00"
    }
])
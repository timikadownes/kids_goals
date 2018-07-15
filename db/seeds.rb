# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Kid.create(name: "Raegan", grade: 4, age: 10, teacher: "Ms. Zimmermann", school: "Tucker Elementary", image_url: "none", user_id: 1)
Kid.create(name: "Kaedin", grade: 5, age: 11, teacher: "Ms. Noah", school: "McDonough Elementary", image_url: "none", user_id: 1)
Kid.create(name: "Gabriel", grade: 0, age: 3, teacher: "Ms. Merry", school: "Tucker Elementary", image_url: "none", user_id: 1)
Goal.create(category: "sports", kid_id: 1, image_url: "https://cdnfiles.crowdrise.com/Prod_Large/ArmyTenTimika1-4ef17f9db6ebc.JPG", due_date: "2018-12-31", description: "The goal is to make the softball team")



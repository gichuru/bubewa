# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = ["Maternity Wards","Governors","Senators","Consumer Products",
    "Power & Energy","Labour Unions","Government Parastatals","Driving Schools",
    "Insurance Companies","Bottled Water","Taxi Services","Special Mentions | Change Makers",
    "Shopping Malls","Mobile Money","Pay-TV ","Govt: Cabinet Secretaries ",
    "Banking and Financial Services","Airlines","Internet Service providers"]
categories.each do |category|
    Category.find_or_create_by(name: category) do |c|
        c.name = category
    end
end

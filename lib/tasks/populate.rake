namespace :populate do
  desc "Populate the database with fake users"
  task users: :environment do
      20.times do |i|
          email = Faker::Internet.email
          User.find_or_create_by(email: email) do |u|
              u.email = email
              u.last_name = Faker::Name.last_name
              u.first_name = Faker::Name.first_name
              u.password = "12345678"
              u.password_confirmation = "12345678"
          end
      end
  end

  task listings: :environment do
      Category.all.each do |category|
          16.times do |i|
              listing = category.listings.new(name: Faker::Company.name, description: Faker::Lorem.paragraph,
                address: Faker::Address.street_address, phone: Faker::PhoneNumber.cell_phone,
                email: Faker::Internet.email, website: Faker::Internet.url, title: Faker::Company.suffix)
              listing.remote_image_url = Faker::Avatar.image
              listing.save!
          end
      end
  end
end

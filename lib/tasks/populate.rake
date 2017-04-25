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
end

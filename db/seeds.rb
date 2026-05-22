# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


kpmg = Company.find_or_create_by(name: 'KPMG')
pwc = Company.find_or_create_by(name: 'PwC')

FactoryBot.create_list(:quote, 3, company: kpmg) if kpmg.quotes.empty?
FactoryBot.create_list(:quote, 3, company: pwc) if pwc.quotes.empty?

User.find_or_initialize_by(email: 'accountant@kpmg.com', company_id: kpmg.id).update(password: 'password')
User.find_or_initialize_by(email: 'manager@kpmg.com', company_id: pwc.id).update(password: 'password')
User.find_or_initialize_by(email: 'eavesdropper@pwc.com', company_id: pwc.id).update(password: 'password')

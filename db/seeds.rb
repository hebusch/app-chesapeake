# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'cortes.csv'))
csv = CSV.parse(csv_text, :headers=>true)
csv.each do |row|
    t = Corte.new
    t.description = row['descripcion']
    t.code = row['codigo']
    t.save
end

User.create! :email => 'heinzbuschcarvajal@gmail.com', :password => '123456', :password_confirmation => '123456'
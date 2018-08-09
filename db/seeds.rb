require 'open-uri'
require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)
Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

Ingredient.create!(name: "lemon")
Ingredient.create!(name: "ice")
Ingredient.create!(name: "mint leaves")

results = JSON.load(open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"))
results_array = results["drinks"]

results_array.each do |drink_hash|
  new_drink = drink_hash["strIngredient1"]
  Ingredient.create!(name: new_drink)
end

cocktail = Cocktail.create!(name: "cocktail test")
cocktail.doses.create!(ingredient: Ingredient.first, description: '4cl')
cocktail.doses.create!(ingredient: Ingredient.last, description: '10ml')

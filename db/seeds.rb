require 'json'
require 'open-uri'

puts'cleaning database'
Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all
puts 'database is clean'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

document = open(url).read
ingredients = JSON.parse(document)
ingredients["drinks"].each do |ingredient|
  i = Ingredient.create(
    name: ingredient["strIngredient1"]
  )
  puts "create #{i.name}"
end

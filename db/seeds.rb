require 'json'
require 'open-uri'

# Ingredient.delete_all
# Cocktail.delete_all


# puts 'fetching list of ingredients'

# url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# ingredients = JSON.parse(open(url).read)
# drinks = ingredients["drinks"]

# puts "Creating ingredients"

# drinks.each do |hash_ingredient|
#   Ingredient.create(name: hash_ingredient["strIngredient1"])
# end

# puts "Finishing creating ingredients in the db"

puts 'fetching list of cocktails'

url = 'https://raw.githubusercontent.com/teijo/iba-cocktails/master/recipes.json'
cocktails = JSON.parse(open(url).read)

# puts cocktails

# puts "Creating cocktails"
ingredients = []
cocktails.each do |cocktail|
  cocktail["ingredients"].each do |details_ingredient|
    ingredients << details_ingredient["ingredient"]
  end
end

ingredients.delete(nil)
p ingredients

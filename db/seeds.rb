require 'json'
require 'open-uri'

url = 'https://raw.githubusercontent.com/teijo/iba-cocktails/master/recipes.json'
cocktails = JSON.parse(open(url).read)

Dose.delete_all
Cocktail.delete_all
Ingredient.delete_all

cocktails.each do |cocktail|
  cocktail["ingredients"].each do |details_ingredient|
    ingredient = details_ingredient["ingredient"]
    # p ingredient unless ingredient.nil?
    Ingredient.create(name: ingredient) unless ingredient.nil?
  end
end



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

# puts 'fetching list of cocktails'

# url = 'https://raw.githubusercontent.com/teijo/iba-cocktails/master/recipes.json'
# cocktails = JSON.parse(open(url).read)
# top_10 = cocktails.first(10)
# p top_10
# puts cocktails

# puts "Creating cocktails"



# Cocktail.destroy_all
# Ingredient.destroy_all

# cocktails = [
#   {
#     name: "Old Fashioned",
#     picture: "http://www.seriouseats.com/images/2014/11/20141104-cocktail-party-old-fashioneds-holiday-vicky-wasik-3.jpg"
#     },
#   {
#     name: "Daiquiri",
#     picture: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-daiquiri.jpg"
#     },
#   {
#     name: "Margarita",
#     picture: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-margarita.jpg"
#     },
#   {
#     name: "Sidecar",
#     picture: "http://www.seriouseats.com/images/2014/11/20141101-cognac-sidecar-carey-jones.jpg"
#     },
#   {
#     name: "French 75",
#     picture: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-french75.jpg"
#     },
#   {
#     name: "Bloody Mary",
#     picture: "http://www.seriouseats.com/images/2015/03/twase-20150320-21.jpg"
#     },
#   {
#     name: "Irish Coffee",
#     picture: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-irish-coffee.jpg"
#     },
#   {
#     name: "Jack Rose",
#     picture: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-jack-rose.jpg"
#     },
#   {
#     name: "Negroni",
#     picture: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-negroni.jpg"
#     },
#   {
#     name: "Boulevardier",
#     picture: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-boulevardier.jpg"
#     },
#   {
#     name: "Sazerac",
#     picture: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-sazerac.jpg"
#     },
#   {
#     name: "Vieux Carré",
#     picture: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-vieux-carre.jpg"
#     },
#   {
#     name: "Ramos Gin Fizz",
#     picture: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-robyn-lee-ramos-gin-fizz.jpg"
#     },
#   {
#     name: "Mint Julep",
#     picture: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-mint-julep.jpg"
#     },
#   {
#     name: "Whiskey Sour",
#     picture: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-whiskey-sour.jpg"
#     },
#   {
#     name: "Mai Tai",
#     picture: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-mai-tai.jpg"
#     },
#   {
#     name: "Planter's Punch",
#     picture: "http://www.seriouseats.com/images/2015/04/20150406-cocktails-planters-punch-robyn-lee-1.jpg"
#     },
#   {
#     name: "Pisco Sour",
#     picture: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-pisco-sour.jpg"
#     },
#   {
#     name: "Cosmopolitan",
#     picture: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-cosmopolitan.jpg"
#     },
#   {
#     name: "Tom Collins",
#     picture: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-tom-collins.jpg"
#     },
#   {
#     name: "Last Word",
#     picture: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-last-word.jpg"
#   }
# ]

# ingredients = %w(lemon ice mint leaves redbull jagermeister sugar tonic gin rhum)
# ingredients.each { |ingredient| Ingredient.create(name: ingredient) }


# cocktails.each { |cocktail| Cocktail.create(cocktail) }


# url = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"
# article = Article.new(title: 'NES', body: "A great console")
# article.remote_photo_url = url
# article.save

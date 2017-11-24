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
    Ingredient.create(name: ingredient) unless ingredient.nil?
  end
end

cocktails_wagon = [
  {
    name: "Old Fashioned",
    photo: "http://www.seriouseats.com/images/2014/11/20141104-cocktail-party-old-fashioneds-holiday-vicky-wasik-3.jpg"
    },
  {
    name: "Daiquiri",
    photo: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-daiquiri.jpg"
    },
  {
    name: "Margarita",
    photo: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-margarita.jpg"
    },
  {
    name: "Sidecar",
    photo: "http://www.seriouseats.com/images/2014/11/20141101-cognac-sidecar-carey-jones.jpg"
    },
  {
    name: "French 75",
    photo: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-french75.jpg"
    },
  {
    name: "Bloody Mary",
    photo: "http://www.seriouseats.com/images/2015/03/twase-20150320-21.jpg"
    },
  {
    name: "Irish Coffee",
    photo: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-irish-coffee.jpg"
    },
  {
    name: "Jack Rose",
    photo: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-jack-rose.jpg"
    },
  {
    name: "Negroni",
    photo: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-negroni.jpg"
    },
  {
    name: "Boulevardier",
    photo: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-boulevardier.jpg"
    },
  {
    name: "Sazerac",
    photo: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-sazerac.jpg"
    },
  {
    name: "Vieux Carré",
    photo: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-vieux-carre.jpg"
    },
  {
    name: "Ramos Gin Fizz",
    photo: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-robyn-lee-ramos-gin-fizz.jpg"
    },
  {
    name: "Mint Julep",
    photo: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-mint-julep.jpg"
    },
  {
    name: "Whiskey Sour",
    photo: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-whiskey-sour.jpg"
    },
  {
    name: "Mai Tai",
    photo: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-mai-tai.jpg"
    },
  {
    name: "Pisco Sour",
    photo: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-pisco-sour.jpg"
    },
  {
    name: "Cosmopolitan",
    photo: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-cosmopolitan.jpg"
    },
  {
    name: "Tom Collins",
    photo: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-tom-collins.jpg"
    },
  {
    name: "Last Word",
    photo: "http://www.seriouseats.com/images/2015/03/20150323-cocktails-vicky-wasik-last-word.jpg"
  }
]

cocktails_names = cocktails_wagon.map { |c| c[:name] }
cocktails_urls = {}

cocktails_wagon.each do |c|
  cocktails_urls[c[:name]] = c[:photo]
end

cocktails_ingredients = []

cocktails.each do |c|
  cocktails_ingredients << c if cocktails_names.include? c["name"]
end

cocktails_preparations = {}
cocktails.each do |c|
  cocktails_preparations[c["name"]] = c["preparation"] if cocktails_names.include? c["name"]
end

cocktails_ingredients.each do |cocktail|
  name = cocktail["name"]
  url = cocktails_urls[name]
  preparation = cocktails_preparations[name]
  new_cocktail = Cocktail.new(name: name)
  new_cocktail.remote_photo_url = url
  new_cocktail.preparation = preparation
  new_cocktail.save
  cocktail["ingredients"].each do |ingredient_details|
    dose = Dose.new
    if ingredient_details.key?("ingredient")
      ingredient = ingredient_details["ingredient"]
      description = "#{ingredient_details['amount']} #{ingredient_details['unit']}" #ingredient["amount"] + ingredient["unit"]
      dose.description = description
      dose.ingredient = Ingredient.find_by_name(ingredient)
      dose.cocktail = new_cocktail
    end
    dose.save
  end
end

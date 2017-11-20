require 'open-uri'
require 'nokogiri'

puts "Quelle catégorie t'interresse?"
category = gets.chomp

url = "https://www.etsy.com/search?q=#{category}"

file = open(url)

html_text = file.read

doc = Nokogiri::HTML(html_text)

# Cas simple: je trouve un tableau de balises directement
# doc.search('.currency-value').each do |currency_box|
#   p currency_box.text
# end

# Cas compliqué: je trouve un tableau de nouveaux blocs HTML que je dois re-fouiller
doc.search('.v2-listing-card').each do |element|
  p element.search('.text-body')[0].text.strip
  p element.search('.currency-value')[0].text
  p element.search('img')[0]["src"]
end

# Une fois qu'on a un doc Nokogiri
# search(class) renvoie un tableau d'éléments qui ont la class
# On peut à nouveau chercher dans ces éléments
# Une fois qu'on accède à l'élément, 2 méthodes utiles
  # .text pour le contenu de la balise
  #["href"] ["src"] pour récupérer la valeur d'un attrribut

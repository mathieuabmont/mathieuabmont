# App pour gérer ses envies d'achat
require_relative "display"

puts "Welcome on Wishly"

wishlist = [{name: "Macbook", checked: true}, {name: "iPhone", checked: false}]

while true
  puts "I'm all ears! What's on your mind? [add|display|check|pick|delete|exit]"
  action = gets.chomp

  case action
  when "add"
    puts "Which product do you want to add to your wishlist?"
    wishlist << {name: gets.chomp, checked: false}
  when "display"
    display(wishlist)
  when "delete"
    puts "Which product do you want to delete? Enter a number"
    display(wishlist)
    index_to_delete = gets.chomp.to_i - 1
      if index_to_delete <= wishlist.length
        wishlist.delete_at(_indexto_delete)
      else
        puts "Invalid action."
      end
    puts "Your new list is"
    display(wishlist)
  when "check"
    puts "Which item to you to check or uncheck"
    display(wishlist)
    index_to_check = gets.chomp.to_i - 1
    wishlist[index_to_check][:checked] = !wishlist[index_to_check][:checked]
    puts "Your new list is"
    display(wishlist)
  when "pick"
    puts "Which product do you want inspiration for?"
    product = gets.chomp
    # on va chercher les résultats Esty
    results = esty_scraper(product)
    results[0..9].each_with_index do |item, index|
      puts "-#{index + 1} - #{item}"
    end
    puts "Which product do you want to pick ? Enter a number"
    pick_number = gets.chomp.to_i - 1
    wishlist << {name: results[pick_number], checked: false}
    # on les affiche à l'utilisateur
    # demander à l'utilisateur lequel il veut ajouter à sa liste
  when "exit"
    break
  else
    puts "Invalid action. Please try again"
  end
end

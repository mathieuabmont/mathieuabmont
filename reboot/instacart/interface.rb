# Objectif coder un logiciel de courses
cart = {}

items = { "pomme" => { price: 3.5, stock: 50 },
  "orange" => { price: 4.9, stock: 50 },
  "quinoa" => { price: 12, stock: 50 },
  "pain" => { price: 1.2, stock: 50 }
}

while true
  puts "Les produits disponibles sont :"
  items.each do |name, infos|
    puts "- #{name} à #{infos[:price]}€ - #{infos[:stock]}"
  end

  puts "Quel produit ajouter à votre panier ? Tapez 'exit' pour sortir"
  user_choice = gets.chomp
  if user_choice == "exit"
    break
  elsif items.has_key? user_choice
    puts "Combien en veux-tu ?"
    quantity = gets.chomp.to_i
    available_stock = items[user_choice][:stock]

    while quantity > available_stock
      puts "Il n'y a que #{available_stock} #{user_choice} disponibles. Combien t'en veux ?"
      quantity = gets.chomp.to_i
    end

    if cart.has_key? user_choice
      cart[user_choice] += quantity
    else
      cart[user_choice] = quantity
    end
    items[user_choice][:stock] -= quantity

  else
    puts "Invalid choice"
  end
end

sum = 0
cart.each do |name, quantity|
  price = items[name][:price]
  subtotal = price * quantity
  puts "- #{quantity} #{name} (#{price}€) => #{subtotal}€"
  sum += subtotal
end




# cart = {}
# hand = {}

# items = { "pomme" => 0.5,
#   "orange" => 0.7,
#   "quinoa" => 3,
#   "pain" => 2.8
# }

# while true
#   puts "Les produits disponibles sont :"
#   items.each do |product, price|
#     puts "- #{product} à #{price}€"
#   end

#   puts "Quel produit ajouter à votre panier ? Tapez 'exit' pour sortir"
#   user_choice = gets.chomp
#   if user_choice == "exit"
#     break
#   elsif items.has_key? user_choice
#     hand = items.select { |product, price| product == user_choice }
#     cart = cart.merge(hand)
#   else
#     puts "Invalid choice"
#   end
# end

# sum = 0
# cart.each_value do |price|
#   sum += price
# end

# puts cart
# p "-------------------------"
# p "TOTAL #{sum}"


# cart = []
# hand = {}

# items = { "pomme" => 3.5,
#   "orange" => 4.9,
#   "quinoa" => 12,
#   "pain" => 1.2
# }

# while true
#   puts "Les produits disponibles sont :"
#   items.each do |product, price|
#     puts "- #{product} à #{price}€"
#   end

#   puts "Quel produit ajouter à votre panier ? Tapez 'exit' pour sortir"
#   user_choice = gets.chomp
#   if user_choice == "exit"
#     break
#   elsif items.has_key? user_choice
#     cart << user_choice
#   else
#     puts "Invalid choice"
#   end
# end

# sum = 0
# cart.each do |article|
#   price = items[article]
#   sum += price
# end

# count_cart = {}
# cart.each do |article|
#   if count_cart.has_key? article
#     count_cart[article] += 1
#   else
#     count_cart[article] = 1
#   end
# end

# count_cart.each do |article, quantity|
#   puts "- #{article} - #{quantity}"
# end
# p "-------------------------"
# p "TOTAL #{sum}"

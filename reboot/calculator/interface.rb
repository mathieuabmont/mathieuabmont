# TODO : code une calculatrice
require_relative "calcutator"

choice = "y"
while choice == "y"
  puts "Entrez votre première valeur"
  first_number = gets.chomp.to_f

  puts "Entrez votre seconde valeur"
  second_number = gets.chomp.to_f

  puts "Entrez le type d'opération (+, -, /, *)"
  operation = gets.chomp

  result = calculate(first_number, second_number, operation)

  if result
    puts "votre résultat est #{result}"
  else
    puts "Error"
  end
  puts "Veux-tu continuer ? (y/n)"
  choice = gets.chomp
end

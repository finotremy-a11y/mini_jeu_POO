require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "---------------------------------------------------"
puts "| Bienvenue sur la V.3 'Ils Veulent Tous Ma POO' !|"
puts "| Le but du jeu est d'etre le dernier survivant ! |"
puts "---------------------------------------------------"

# création du jeu
puts "Quel est ton prénom ?"
print "> "
user_name = gets.chomp

game = Game.new(user_name)

# boucle principale
while game.is_still_ongoing?
  game.show_players
  game.menu

  print "> "
  choice = gets.chomp
  game.menu_choice(choice)

  game.enemies_attack
  game.new_players_in_sight
end

# fin du jeu
game.end_game
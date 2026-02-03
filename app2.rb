require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "---------------------------------------------------"
puts "| Bienvenue sur 'Ils Veulent Tous Ma POO' !       |"
puts "| Le but du jeu est d'etre le dernier survivant ! |"
puts "---------------------------------------------------"

#creer son personnage
puts "Quel est ton prenom ?"
print "> "
user_name = gets.chomp
user = HumanPlayer.new(user_name)

#creer les ennemis
player1 = Player.new("Flora")
player2 = Player.new("Alessia")
enemies = [player1, player2]

#boucle de combat et affichage des constantes :
while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  #affiche la sante :
  puts "\nVoici l'etat de ton joueur :"
  user.show_state
  puts""

  #affiche le menu :
  puts "Quelle action veux-tu effectuer ?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher a se soigner"
  puts ""
  puts "attaquer un joueur en vue :"
  puts "1 - #{player1.show_state}"
  puts "2 - #{player2.show_state}"
  print "> "
  choice = gets.chomp

  #faire l'action choisi
  case choice
  when "a"
    user.search_weapon
  when "s"
    use.search_health_pack
  when "1"
    user.attacks(player1) if player1.life_points > 0
  when "2"
    user.attacks(player2) if player2.life_points > 0
  else
    puts "Commande inconnue"
  end

  #attaque ennemis
  puts "\nLes ennemis t'attaquent !"

  enemies.each do |enemy|
    if enemy.life_points > 0
      enemy.attacks(user)
    end
  end
end

#fin de partie
puts "La partie est finie"

if user.life_points > 0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Nul ! Tu as perdu !"
end



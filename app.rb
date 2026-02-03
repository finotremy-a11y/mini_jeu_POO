require 'bundler'
Bundler.require

require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "Voici l'état de chaque joueur :"
puts player1.show_state
puts player2.show_state

puts "Passons à la phase d'attaque :"

player1.attacks(player2)
puts player2.show_state

player2.attacks(player1)
puts player1.show_state
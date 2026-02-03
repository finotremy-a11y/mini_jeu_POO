class Game
  attr_accessor :human_player, :enemies_in_sight, :players_left

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @enemies_in_sight = []
    @players_left = 10
  end

  #supprimer les ennemis mort de la liste des ennemis
  def kill_player(player)
    @enemies_in_sight.delete(player)
    puts "#{player.name} a été éliminé !"  
  end

  #le jeu continue tant que le joueur n'est pas mort et qu'il reste des ennemis
  def is_still_ongoing?
    @human_player.life_points > 0 && (@players_left > 0 || @enemies_in_sight.any?)
  end

  #affiche l'etat du joueur et le nombre d'ennemis restant
  def show_players
    puts @human_player.show_state
    puts "Il reste #{@players_left} ennemis à affronter."
  end

  #affiche les options possibles
  def menu
    puts "\nQuelle action veux-tu effectuer ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts ""
    puts "attaquer un joueur en vue :"

    @enemies_in_sight.each_with_index do |enemy, index|
      if enemy.life_points > 0
        puts "#{index} - #{enemy.name} a #{enemy.life_points} points de vie"
      end
    end
  end

  #appliquer le choix du joueur 
  def menu_choice(choice)
    case choice
    when "a"
      @human_player.search_weapon

    when "s"
      @human_player.search_health_pack

    else
      # Si c’est un chiffre, on attaque un ennemi
      if choice.to_i.to_s == choice
        index = choice.to_i
        enemy = @enemies_in_sight[index]

        if enemy && enemy.life_points > 0
          @human_player.attacks(enemy)
          kill_player(enemy) if enemy.life_points <= 0
        else
          puts "Ce joueur n'existe pas ou est déjà mort."
        end

      else
        puts "Commande inconnue..."
      end
    end
  end

  #attaque de tous les ennemis contre le joueur
  def enemies_attack
    if @enemies_in_sight.empty?
      puts "Aucun ennemi en vue pour t'attaquer."
    else
      puts "\nLes ennemis t'attaquent !"
      @enemies_in_sight.each do |enemy|
        if enemy.life_points > 0
          enemy.attacks(@human_player)
        end
      end
    end
  end

  #gere les apparitions d'ennemis
  def new_players_in_sight
    if @players_left <= 0
      puts "Tous les ennemis sont déjà en vue."
      return
    end

    dice = rand(1..6)

    case dice
    when 1
      puts "Aucun nouvel ennemi n'arrive."
    when 2..4
      add_enemy(1)
    when 5..6
      add_enemy(2)
    end
  end

  def add_enemy(number)
    number.times do
      break if @players_left <= 0

      new_enemy = Player.new("player_#{rand(1000..9999)}")
      @enemies_in_sight << new_enemy
      @players_left -= 1

      puts "Un nouvel ennemi arrive : #{new_enemy.name} !"
    end
  end

  #fin du jeu
  def end_game
    puts "\nLa partie est finie."

    if @human_player.life_points > 0
      puts "BRAVO ! TU AS GAGNÉ !"
    else
      puts "Dommage... tu as perdu."
    end
  end
end

class Player

  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie."
  end

  #dit si en fonction des dommages recu le joueur est mort
  def gets_damage(damage_received)
    @life_points -= damage_received

    if @life_points <= 0
      @life_points = 0
      puts "le joueur #{@name} a été tué !"
    end
  end

  #choisi un nombre entre 1 et 6 pour infliger des dommages
  def compute_damage
    rand(1..6)
  end

  #attaque l'autre joueur
  def attacks(player)
    puts "#{name} attaque #{player.name}"

    damage = compute_damage
    player.gets_damage(damage)

    puts "il lui inflige #{damage} points de dommages"
  end
end

class HumanPlayer < Player 
  attr_accessor :weapon_level

  #creer les joueurs
  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  #dit les specifications des joueurs
  def show_state
    puts "#{name} a #{life_points} points de vie et a une arme de niveau #{weapon_level}."
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  #genere de nouvelle armes, plus ou moins performante que celle que les joueurs ont
  def search_weapon
    new_weapon_level = rand (1..6)
    puts "Tu as trouver une arme de niveau #{new_weapon_level}"

    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "Youhou ! Tu as trouver une meilleure arme, tu la prends."
    else
      puts "Dommage, elle n'est pas mieux que ton arme actuelle."
    end
  end

  #genere des pack de points de vie
  def search_health_pack
    dice = rand(1..6)

    case dice
    when 1
      puts "Tu n'as rien trouve..."
    when 2..5
      puts "Bravo, tu as trouver un pack de +50 points de vie !"
      @life_points +=50
      @life_points = 100 if @life_points > 100
    when 6
      puts "Wow, tu as trouver un pack de +80 points de vie !"
      @life_points +=50
      @life_points = 100 if @life_points > 100
    end
  end
end
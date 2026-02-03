# Mini Jeu POO - "Ils Veulent Tous Ma POO"

## Description

"Mini Jeu POO" is a text-based survival game implemented in Ruby using Object-Oriented Programming (OOP) principles. The game is titled "Ils Veulent Tous Ma POO" (They All Want My POO), where you play as a human player fighting against AI-controlled enemies to be the last survivor.

The project demonstrates fundamental OOP concepts in Ruby, including classes, inheritance, and encapsulation through a fun, interactive game.

## Features

- **Player Classes**: Two types of players - basic `Player` and advanced `HumanPlayer`
- **Combat System**: Turn-based attacks with random damage
- **Human Player Abilities**:
  - Search for better weapons to increase damage
  - Find health packs to restore life points
  - Attack visible enemies
- **Dynamic Enemy Spawning**: New enemies appear randomly during gameplay
- **Game Loop**: Continues until the human player dies or all enemies are defeated

## How to Run

### Prerequisites
- Ruby installed on your system
- Bundler for dependency management

### Installation
1. Clone or navigate to the project directory
2. Install dependencies:
   ```bash
   bundle install
   ```

### Running the Game
Run the main game:
```bash
ruby app3.rb
```

### Demo Versions
- `app.rb`: Simple demo with two players attacking each other
- `app2.rb`: Intermediate version with fixed enemies
- `app3.rb`: Full game with dynamic enemy spawning

## Game Classes

### Player
- Basic player class with name and life points
- Methods: `show_state`, `gets_damage`, `compute_damage`, `attacks`

### HumanPlayer (inherits from Player)
- Advanced player with weapon levels and special abilities
- Starts with 100 life points and level 1 weapon
- Methods: `search_weapon`, `search_health_pack`

### Game
- Manages the overall game state
- Handles enemy spawning, player actions, and game flow
- Methods: `is_still_ongoing?`, `show_players`, `menu`, `menu_choice`, `enemies_attack`, `new_players_in_sight`, `end_game`

## Gameplay

1. Enter your name to create your character
2. Each turn, choose from:
   - Search for a better weapon
   - Search for health packs
   - Attack visible enemies
3. Enemies will counter-attack after your turn
4. New enemies may spawn randomly
5. Survive until all enemies are defeated!

## Dependencies

- `pry`: For debugging (included in Gemfile)

## Learning Objectives

This project serves as an educational example of:
- Ruby class inheritance
- Object-oriented design patterns
- Game loop implementation
- Random event generation
- User input handling
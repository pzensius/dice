class Equipment
  def initialize(dice_array)
  end
end

class Dice
  def initialize(sides)
  end
  def roll
  end
  def state
  end
end

class Player
  def initialize(score)
  end
end

class Score
  def initialize(points)
  end
end

class Gameflow
  @@players = []
  @@turn = nil
  
  def Gameflow.current_turn
    @@turn = initialize_turn unless @@turn
    @@turn
  end
  #Adds a new player to the game
  def Gameflow.add_player
    puts 'add a player'
  end
  #Sets the current turn
  def Gameflow.set_current_turn
    puts 'set the current turn'
  end
  #Runs a turn for a player
  def Gameflow.run_turn
    puts 'run the turn'
  end
  private_class_method :new, :set_current_turn, :initialize_turn
end


Gameflow.add_player

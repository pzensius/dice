class Dice
  def initialize(sides)
    @sides = sides
    @state = nil
  end
  def roll_dice
    @state = (rand*@sides).ceil
  end
  def get_state
    @state
  end
end

class Player
  def initialize
    @score = 0
  end
end

class Score
  def initialize(points)
  end
end

class Gameflow
  @@players = []
  @@dice = []
  @@turn = nil
  
  def Gameflow.current_turn
    @@turn = initialize_turn unless @@turn
    @@turn
  end
  #Adds a new player to the game
  def Gameflow.add_player
    @@players.push(Player.new)
  end
  #Sets the current turn
  def Gameflow.set_current_turn
    puts 'set the current turn'
  end
  #Runs a turn for a player
  def Gameflow.run_turn
    puts 'run the turn'
  end
  def Gameflow.initialize_turn
    @@turn = 0
  end
  def Gameflow.reset_dice
    @@dice = nil
    @@dice = []
    1.upto(6) {|x| @@dice.push(Dice.new(6))}
  end
  def Gameflow.roll_dice
    @@dice.each {|x| x.roll_dice}
  end
  def Gameflow.print_dice_state
    @@dice.each {|x| puts x.get_state}
  end
  private_class_method :new, :set_current_turn, :initialize_turn
end

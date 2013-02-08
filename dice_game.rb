class Dice
  #Dice has number of sides
  def initialize(sides)
    @sides = sides
    @state = nil
  end
  #Roll this dice
  def roll_dice
    @state = (rand*@sides).ceil
  end
  #Get the state of the roll
  def get_state
    @state
  end
end

class Player
  #All the names that have players
  @@names = []
  #Player has a score and a name
  def initialize(name)
    return false
    if @@names.include?(name)
      return false
    else
      @@names.push(name)
      @name = name
    end
    @score = Score.new
  end
  #Get this player's accumulated points
  def get_accumulated_points
    @score.get_points
  end
  #Get the player's name
  def get_name
    @name
  end
  #Reset the score for this player
  def reset_score
    @score = nil
    @score = Score.new
  end
end

class Score
  #Score has points
  def initialize
    @points = 0
  end
  #Add points
  def add_points(points)
    @points += points
  end
  #Get the current points
  def get_points
    @points
  end
end

#Main functions for the game
class Gameflow
  #The players in the game
  @@players = []
  #The one and only dice
  @@dice = []
  #Whose turn it is
  @@turn = nil
  #Game is running
  @@running = nil
  #Score for current turn
  @@score = nil
  #Get the current turn
  def Gameflow.get_turn
    @@turn
  end
  #Add a new player to the game
  def Gameflow.add_player(name)
    begin
      @@players.push(Player.new(name))
    rescue
      puts 'Please try again'
    end
  end
  #List all the players and their scores
  def Gameflow.list_players
    for x in @@players
      puts String(x.get_name) + ' ' + String(x.get_accumulated_points)
    end
  end
  #Reset all scores
  def Gameflow.reset_player_scores
    @@players.each {|x| x.reset_score}
  end
  #Set the current turn
  def Gameflow.set_turn(at_player)
    @@turn = at_player
  end
  #Reset the score
  def Gameflow.reset_score
    @@score = nil
    @@score = Score.new
  end
  #Reset all dice
  def Gameflow.reset_dice
    @@dice = nil
    @@dice = []
    1.upto(6) {|x| @@dice.push(Dice.new(6))}
  end
  #Roll the dice
  def Gameflow.roll_dice
    @@dice.each {|x| x.roll_dice}
  end
  #Print the current roll
  def Gameflow.print_dice_state
    @@dice.each {|x| puts x.get_state}
  end
  #Check to see if already running
  def Gameflow.is_running?
    @@running
  end
end


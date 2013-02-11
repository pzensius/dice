class Dice
  #Dice has number of sides and a roll state
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
  #Print the dice
  def Dice.print_dice(side)
    putting = false
    IO.foreach('ascii_dice.txt') do |line|
      if line == "</dice"+String(side)+">\n"
        putting = false
        puts "\n"
      end
      if putting == true
        puts line
      end
      if line == "<dice"+String(side)+">\n"
        putting = true
        puts "\n"
      end
    end
  end
end

class DiceList
  private_class_method :new
  @@dicelist = nil
  #Singleton pattern
  def DiceList.create(dice,sides)
    @@dicelist = new(dice,sides) unless @@dicelist
    @@dicelist
  end
  #DiceList has max number of dice, sides per dice
  #and the list of dice
  def initialize(dice,sides)
    @max_dice = dice
    @sides = sides
    @dicelist = []
  end
  #Access elements by index
  def [](key)
    if key.kind_of?(Integer)
      @dicelist[key]
    else
      false
    end
  end
  #Append one dice to the dice list
  def append
    @dicelist.push(Dice.new(@sides))
  end
  #Removes all elements and append up to max dice
  def reset_max
    @dicelist.clear
    1.upto(@max_dice) do |x|
      append
    end
  end
  #Roll each dice.
  def roll_dice
    @dicelist.each {|x| x.roll_dice}
  end
  #Print each dice
  def print_current_roll
    @dicelist.each {|x| Dice.print_dice(x.get_state)}
  end
end

class Player
  #Player has a score and a name
  def initialize(name)
    @name = name
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

class PlayerList
  private_class_method :new
  #the PlayerList to be object
  @@playerlist = nil
  #Singleton pattern
  def PlayerList.create
    @@playerlist = new unless @@playerlist
    @@playerlist
  end
  #PlayerList has the player array
  def initialize
    @playerlist = []
  end
  #Access elements by index
  def [](key)
    if key.kind_of?(Integer)
      @playerlist[key]
    else
      false
    end
  end
  #Append one player to the player list, given a unique name
  def append(name)
    @playerlist.each do |x|
      if x.get_name == name
        return false
      end
    end
    @playerlist.push(Player.new(name))
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
  private_class_method :new
  #Max Dice constant
  MaxDice = 6
  #Sides per dice constant
  Sides = 6
  #The single dice list
  @@dice = DiceList.create(MaxDice,Sides)
  @@players = PlayerList.create
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
    if @@players.append(name)
      return true
    else
      puts 'Please try again'
      return false
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
    @@dice.reset_max
  end
  #Roll the dice
  def Gameflow.roll_dice
    @@dice.roll_dice
  end
  #Print the current roll
  def Gameflow.print_current_roll
    @@dice.print_current_roll
  end
  #Check to see if already running
  def Gameflow.is_running?
    @@running
  end
end


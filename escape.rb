class World
  #Person = Struct.new(:name, :gender, :age)
  # Same as:
  # class Person
  #   attr_accessor :name, :gender, :age
  #   def initialize name, gender, age
  #     @name = name
  #     @gender = gender
  #     @age = age
  #   end
  # end
  class Person
    
    # Showing that class instance variables are private no matter what without a method to return them
    # public
    # @@test = 1
    
    # You can't add to the initialize method within a struct, so write it out.
    # @@num_of_people = 0
    # def initialize name, gender, age
    #   @name = name
    #   @gender = gender
    #   @age = age
    #   @@num_of_people += 1
    # end
    # def Person.num_of_people 
    #   @@num_of_people
    # end
  end
end
#Initialize classes to store all information
class Dungeon
  attr_accessor :player
  
  def initialize player_name
    @player = Player.new(player_name)
    @rooms = []
    
  end
  def add_room reference, name, description, connections
    @rooms << Room.new(reference, name, description, connections)
  end
  def start location
    @player.location = location
    show_current_description
  end
  
  def find_room_in_dungeon reference
    @rooms.detect { |room| room.reference == reference }
  end
  def find_room_in_direction direction
    find_room_in_dungeon(@player.location).connections[direction]
  end
  def go direction
    puts "You go #{direction}"
    @player.location = find_room_in_direction(direction)
    show_current_description
  end
  def show_current_description
    find_room_in_dungeon(@player.location).full_description
  end

  class Player
    attr_accessor :name, :location
    
    def initialize player_name
      @name = player_name
    end
    # Returns location
    # Initialized without name
    
  end
  class Room
    attr_accessor :reference, :name, :description, :connections
    
    def initialize reference, name, description, connections
      @name = name
      @reference = reference
      @description = description
      @connections = connections
    end
    def full_description
      puts "#{@name}, you are in #{@name}: #{@description}" 
    end
  end
end

test = Dungeon.new("Erik")

test.add_room(:mycell, "My Cell", "I am imprisoned here", {west: :hallway})
test.add_room(:hallway, "Hallway", "You have escaped to the hallway", {east: :mycell, west: :starlightchamber, north: :staircase})
test.add_room(:staircase, "Staircase", "You have escaped to the main level", {south: :hallway})
test.start(:mycell)
test.go(:west)
test.go(:north)
class Owner
  attr_reader :name, :species
  
  @@all = []
  @@count = 0
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @@count += 1
  end
  
  def say_species
    return "I am a #{@species}."
  end
  
  def self.all 
    @@all
  end
  
  def self.count
    @@count
  end
  
  def self.reset_all
    @@all.clear
    @@count = 0
  end
  
  def cats
    Cat.all.select { |cat| cat.owner == self }
  end
  
  def dogs 
    Dog.all.select { |dog| dog.owner == self }
  end
  
  def buy_cat(name)
    owner = self
    Cat.new(name, owner)
  end
  
  def buy_dog(name)
    owner = self
    Dog.new(name, owner)
  end
  
  def walk_dogs
    dogs.each { |dog| dog.mood = "happy" }
  end
  
  def feed_cats
    cats.each { |cat| cat.mood = "happy" }
  end
  
  def sell_pets
    cats.each { |cat| cat.owner = nil, cat.mood = "nervous" }
    dogs.each { |dog| dog.owner = nil, dog.mood = "nervous" }
  end
    
end
require_relative './cat.rb'
require_relative './dog.rb'

require 'pry'

class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    message = "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select do |kat|
      kat.owner == self
    end
  end

  def dogs
    Dog.all.select do |kat|
      kat.owner == self
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |kat|
      kat.mood = "happy"
    end
  end

  def sell_pets
    all_pets = self.cats + self.dogs
    all_pets.each do |pet|
      pet.owner = nil
      pet.mood = "nervous"
    end
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end

# owner1 = Owner.new("George")
# owner2 = Owner.new("Leo")
# cat1 = Cat.new("Bob", owner1)
#binding.pry
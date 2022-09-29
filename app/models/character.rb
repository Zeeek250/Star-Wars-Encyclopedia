class Character < ApplicationRecord
  # relationship for the films table
  has_many :films, through: :character_films
  has_many :character_films

  # relationship for the starship table
  has_many :starship, through: :character_star_ships
  has_many :character_star_ships

  # relationship for the homworld table
  belongs_to :homeworld
end

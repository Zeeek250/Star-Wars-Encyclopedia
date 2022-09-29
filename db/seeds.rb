# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "csv"
require "json"
require "json_csv"

Character.delete_all
Planet.delete_all
Species.delete_all
Film.delete_all
Starship.delete_all
Character_film.delete_all

character
puts "running seed"
# Character csv 1/7
character_file = Rails.root.join("db/characters.csv")
csv_character_data = File.read(character_file)
characters = CSV.parse(csv_character_data, headers: true, encoding: "utf-8")

# Species.csv 2/7
species_file = Rails.root.join("db/species.csv")
csv_species_data = File.read(species_file)
species = CSV.parse(csv_species_data, headers: true, encoding: "utf-8")

# planet.csv 3/7
planet_file = Rails.root.join("db/planets.csv")
csv_planet_data = File.read(planet_file)
planets = CSV.parse(csv_planet_data, headers: true, encoding: "utf-8")

# films.csv 4/7
film_file = Rails.root.join("db/films.csv")
csv_film_data = File.read(film_file)
films = CSV.parse(csv_film_data, headers: true, encoding: "utf-8")

# starships.csv 5/7
starship_file = Rails.root.join("db/starships.csv")
csv_starship_data = File.read(starship_file)
starships = CSV.parse(csv_starship_data, headers: true, encoding: "utf-8")

# characterFilm.csv 6/7
character_Film_file = Rails.root.join("db/characterStarship.csv")
csv_character_Film_data = File.read(character_Film_file)
character_Films = CSV.parse(csv_character_Film_data, headers: true, encoding: "utf-8")

# characterStarship.csv 7/7
character_starship_file = Rails.root.join("db/characterStarship.csv")
csv_character_starship_data = File.read(starship_file)
character_starships = CSV.parse(csv_character_starships_data, headers: true, encoding: "utf-8")

planets.each do |p|
  planet = Planet.create(
    name:            p["name"],
    rotation_period: p["rotation_period"],
    orbital_period:  p["orbital_period"],
    diameter:        p["diameter"],
    climate:         p["climate"],
    gravity:         p["gravity"],
    terrain:         p["terrain"],
    surface_water:   p["surface_water"],
    population:      p["population"]
  )
end

species.each do |s|
  specie = Species.create(
    name:             s["name"],
    classification:   s["classification"],
    designation:      s["designation"],
    average_height:   s["average_height"],
    skin_colors:      s["skin_colors"],
    hair_colors:      s["hair_colors"],
    eye_colors:       s["eye_colors"],
    average_lifespan: s["average_lifespan"],
    language:         s["language"],
    homeworld:        s["homeworld"]
  )
end

films.each do |f|
  film = Film.create(
    name:          f["title"],
    opening_crawl: f["opening_crawl"],
    director:      f["director"],
    release_date:  f["release_date"]
  )
end

starships.each do |st|
  starship = Starship.create(
    name:                   st["name"],
    model:                  st["model"],
    manufacturer:           st["manufacturer"],
    cost_in_credits:        st["cost_in_credits"],
    length:                 st["length"],
    max_atmospgering_speed: st["max_atmosphering_speed"],
    crew:                   st["crew"],
    passengers:             st["passengers"],
    cargo_capacity:         st["cargo_capacity"],
    consumables:            st["consumables"],
    hyperdrive_rating:      st["hyperdrive_rating"],
    mglt:                   st["mglt"],
    starship_class:         st["starship_class"]
  )
end

character_Films.each do |cf|
  # puts "#{cf['name']} ---#{cf['films']}"

  # character_film = CharacterFilm.create(
  # name:  cf["name"],
  # films: cf["films"]
  # )
end

puts "imported #{Planet.count} new planets"
puts "imported #{Species.count} new species"
puts "imported #{Film.count} new films"
puts "imported #{Starship.count} new starships"

require 'rest-client'
require 'json'
require 'pry'


def parse_character_movies(films_hash)
  films_hash.each do |film|
    puts "\n ***************"

    film.each do |key, value|
      puts "#{key}:\t-----------------\t #{value}"
    end
  end
  # some iteration magic and puts out the movies in a nice list
end

def validate_character(character)
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

  results_array = character_hash["results"]

  results_array.each do |results_hash|
    if results_hash["name"] == character
      return true
    end
  end
  return false
end

def get_character_movies_from_api(character)
  #make the web request
  end_array = []
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

  results_array = character_hash["results"]

  results_array.each do |results_hash|
    if results_hash["name"] == character
    movies_array = results_hash["films"]
    end_array = movies_array
    end
  end

  film_info = []
  end_array.each do | film_url |
    film_info << JSON.parse(RestClient.get(film_url))
  end
  parse_character_movies(film_info)
end

  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

  ## BONUS

  # that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
  # can you split it up into helper methods?

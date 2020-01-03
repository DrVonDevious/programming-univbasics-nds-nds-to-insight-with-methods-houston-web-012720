$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'directors_database'

# Find a way to accumulate the :worldwide_grosses and return that Integer
# using director_data as input

def gross_for_director(director_data)
  gross = 0
  movie_index = 0
  while movie_index < director_data[:movies].length do
    gross += director_data[:movies][movie_index][:worldwide_gross]
    movie_index += 1
  end
  return gross
end

# Write a method that, given an NDS creates a new Hash
# The return value should be like:
#
# { directorOne => allTheMoneyTheyMade, ... }

def directors_totals(nds)
  result = {}
  director_index = 0
  while director_index < nds.length do
    movie_index = 0
    gross = 0
    while movie_index < nds[director_index][:movies].length do
      gross += nds[director_index][:movies][movie_index][:worldwide_gross]
      movie_index += 1
    end
    director_name = nds[director_index][:name]
    result[director_name] = gross
    director_index += 1
  end
  return result
end

require_relative 'api_communicator.rb'

def welcome
  puts "Thank's for visiting! May the force be with you."
end

def get_character_from_user
  while true
    puts "please enter a character"
    response = (gets.chomp)
    if response == "exit" || response == "Exit" || response == "Exit()"
      break
    elsif validate_character(response) == true
      get_character_movies_from_api(response)
    else
      puts "Invalid character #{response}. Please try again"
    end
  end
end

def main
  welcome
  get_character_from_user
end

main

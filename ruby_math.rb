@player_1lives = 3
@player_2lives = 3
@currentPlayer = 1 

def check_lives
  if ( @player_1lives > 0 && @player_2lives > 0 )
    return true
  else 
    return false
  end
end

def get_operator_string operator
  if operator == 1 
    return " + "
  elsif (operator == 2) 
    return " - "
  else 
    return " x "
  end
end

def get_response operator, x, y
  puts "Player #{@current_player} : What does #{x} #{ get_operator_string(operator) } #{y} equal?"
  gets.chomp 
end
 
def switch_player
  if @current_player == 1 
    @current_player = 2
    puts "You have  #{@player_1lives} lives remaining"
  else  
    @current_player = 1
    puts "You have #{@player_2lives} lives remaining"
  end
end

 
def calculate_answer op, x, y
  if op == 1 
    return x + y
  elsif op == 2 
    return x - y
  else 
    return x * y
  end
end
 
def announce_winner
  if @player_1lives == 0
    puts "Player 2 wins!"
  else 
    puts "Player 1 wins!"
  end
end
  
 
def check_answer(answer, right_answer) 
  if answer == right_answer
    puts "Correct."
  else 
    if @current_player == 1
      @player_1lives -= 1
      puts "Wrong! #{@player_1lives} lives left!"
    else 
      @player_2lives -= 1
      puts "Wrong! #{@player_2lives} lives left!"
    end
  end
end

while ( check_lives() ) do 
  x  = Random.rand(20).round + 1
  y  = Random.rand(20).round + 1
  op = Random.rand(3).round  + 1
  
  right_answer = calculate_answer(op, x, y)
  answer = get_response(op, x, y)
 
  check_answer(answer, right_answer)
  switch_player()
end 

announce_winner()
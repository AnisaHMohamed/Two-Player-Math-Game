require "./player"
class Game
  attr_accessor :player1, :player2
  def initialize(player1, player2)
    @player1=player1
    @player2=player2
    self.player1.turn = true
    puts "intialized a new game"
    self.run_game
    end

  def next_turn
    if self.player1.turn
      self.player1.turn = false
      self.player2.turn = true
      puts "-----NEW TURN-----"
      self.run_game
    end
    if !self.player1.turn
      self.player1.turn = true
      self.player2.turn= false
      puts "-----NEW TURN-----"
      self.run_game
    end
  end
  def current_score
  puts "#{self.player1.name}: #{self.player1.lives}/3 vs #{self.player2.name}: #{self.player2.lives}/3"  
  end

  def question(player) 
    num1 = (rand(20).ceil) +1
    num2 = (rand(20).ceil) +1
    operatorNum = (rand(2).ceil) +1
    
    if operatorNum == 1
    operator = "plus"
    else
    operator = "subtract"
    end
    
    puts "#{player.name}: What does #{num1} #{operator} #{num2} equal?" 
    inputAnswer = gets.chomp
    
    if operator == "plus"
      actualAnswer = num1 + num2
    else
      actualAnswer = num1 - num2
    end
    if inputAnswer.to_i  == actualAnswer
      puts "YES! You are correct."
      self.current_score
      self.next_turn
    else
      puts "Seriously? No!"
      player.take_life
      self.current_score
      self.next_turn

  end
end

  def run_game

    if self.player1.lives.to_i  == 0
      puts  "#{player2.name} wins with a score of #{self.player2.lives}/3\n-----GAME OVER-----\nGood Bye!"
      exit(0)
    end
    if self.player2.lives.to_i  == 0
      puts  "#{player1.name} wins with a score of #{self.player1.lives}/3\n-----GAME OVER-----\n Good Bye!"
      exit(0)
    end
    if self.player1.turn 
    self.question(self.player1)
    
    else
      self.question(self.player2)
    end


  end


end
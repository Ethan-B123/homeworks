class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize()
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    print @seq.to_s
    sleep(1 + @seq.length * 0.9)
    # system("clear") #removed for specs
  end

  def require_sequence
    @seq.each_with_index do |color, idx|
      print "input color #{idx+1}: "
      user_input = gets.chomp.downcase.delete(" ")
      if user_input[0] != color[0]
        @game_over = true
        return false
      end
    end
    true
  end

  def add_random_color
    @seq << ["red", "blue", "yellow", "green"].shuffle[0]
  end

  def round_success_message
    puts "Correct!"
  end

  def game_over_message
    puts "Game over"
  end

  def reset_game
    @game_over = false
    @seq = []
    @sequence_length = 1

    #removed for specs
    # print "new game? (y/n): "
    # if gets.chomp[0].downcase == "y"
    #   play
    # end
  end
end

if __FILE__ == $PROGRAM_NAME
  simon_game = Simon.new
  simon_game.play
end

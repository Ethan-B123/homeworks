require "byebug"

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1, @name2 = name1, name2
    @cups = Array.new(14) { [] }
    place_stones
    @cups
  end

  def place_stones
    @cups.each_index do |idx|
      if !(idx == 6 || idx == 13)
        @cups[idx] = [:stone, :stone, :stone, :stone]
      end
    end
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !start_pos.between?(0, 12) && start_pos != 6
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    valid_move?(start_pos)
    hand = []
    dont_drop = current_player_name == @name1 ? 13 : 6
    hand, @cups[start_pos] = @cups[start_pos], hand
    place_at, i = 0, 1

    while !hand.empty?
      place_at = (start_pos + i) % 14
      if place_at != dont_drop
        @cups[place_at] << hand.shift
      end
      i += 1
    end

    render
    next_turn(place_at)
  end

  def next_turn(ending_cup_idx)
    puts ending_cup_idx
    # debugger
    if ending_cup_idx == 13 || ending_cup_idx == 6
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? {|el| el.empty?} ||
      @cups[7..12].all? {|el| el.empty?}
  end

  def winner
    p1_score = @cups[6].length
    p2_score = @cups[13].length
    if p1_score == p2_score
      return :draw
    end
    p1_score > p2_score ? @name1 : @name2
  end
end

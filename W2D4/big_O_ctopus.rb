require "byebug"
test_fish = ['fish', 'fiiish', 'fiiiiish',
   'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh',
    'fiiiissshhhhhh']

### Sluggish Octopus
def pow_2_time(arr)
  biggest = arr[0]
  arr.each_with_index do |fish_a, idx_a|
    arr.each_with_index do |fish_b, idx_b|
      next if idx_a == idx_b
      if fish_a.length > fish_b.length &&
          fish_a.length > biggest.length
        biggest = fish_a
      end
    end
  end
  biggest
end


def method_name

end

class Array
  def merge_sort(&prc)
    # See how I create a Proc if no block was given; this eliminates
    # having to later have two branches of logic, one for a block and
    # one for no block.
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)

  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

def o_n(arr)
  biggest = arr[0]
  arr.each do |fish|
    if fish.length > biggest.length
      biggest = fish
    end
  end
  biggest
end

tiles_array = ["up", "right-up", "right", "right-down",
  "down", "left-down", "left", "left-up"]

new_tiles_data_structure = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def slow_dance(dir, tiles)
  tiles.each_with_index do |tile, idx|
    return idx if tile == dir
  end
  return nil
end

def fast_dance(dir, new_hash)
  new_hash[dir]
end

if __FILE__ == $PROGRAM_NAME
  print "\n\npow_2_time(test_fish): "
  print pow_2_time(test_fish)

  print "\n\nO(n log n) -> (test_fish): "
  print test_fish.merge_sort {|a,b| a.length <=> b.length}.last

  print "\n\no_n(test_fish): "
  print o_n(test_fish)

  print "\n\nslow_dance(dir, tiles): "
  print slow_dance("right-down", tiles_array)

  print "\n\nfast_dance(dir, tiles): "
  print fast_dance("right-down", new_tiles_data_structure)

  print "\n\n"
end

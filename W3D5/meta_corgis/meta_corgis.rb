class SnackBox
  SNACK_BOX_DATA = {
    1 => {
      "bone" => {
        "info" => "Phoenician rawhide",
        "tastiness" => 20
      },
      "kibble" => {
        "info" => "Delicately braised hamhocks",
        "tastiness" => 33
      },
      "treat" => {
        "info" => "Chewy dental sticks",
        "tastiness" => 40
      }
    },
    2 => {
      "bone" => {
        "info" => "An old dirty bone",
        "tastiness" => 2
      },
      "kibble" => {
        "info" => "Kale clusters",
        "tastiness" => 1
      },
      "treat" => {
        "info" => "Bacon",
        "tastiness" => 80
      }
    },
    3 => {
      "bone" => {
        "info" => "A steak bone",
        "tastiness" => 64
      },
      "kibble" => {
        "info" => "Sweet Potato nibbles",
        "tastiness" => 45
      },
      "treat" => {
        "info" => "Chicken bits",
        "tastiness" => 75
      }
    }
  }
  def initialize(data = SNACK_BOX_DATA)
    @data = data
  end

  def get_bone_info(box_id)
    @data[box_id]["bone"]["info"]
  end

  def get_bone_tastiness(box_id)
    @data[box_id]["bone"]["tastiness"]
  end

  def get_kibble_info(box_id)
    @data[box_id]["kibble"]["info"]
  end

  def get_kibble_tastiness(box_id)
    @data[box_id]["kibble"]["tastiness"]
  end

  def get_treat_info(box_id)
    @data[box_id]["treat"]["info"]
  end

  def get_treat_tastiness(box_id)
    @data[box_id]["treat"]["tastiness"]
  end
end

class CorgiSnacks

  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
  end

  def bone
    info = @snack_box.get_bone_info(@box_id)
    tastiness = @snack_box.get_bone_tastiness(@box_id)
    result = "Bone: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

  def kibble
    info = @snack_box.get_kibble_info(@box_id)
    tastiness = @snack_box.get_kibble_tastiness(@box_id)
    result = "Kibble: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

  def treat
    info = @snack_box.get_treat_info(@box_id)
    tastiness = @snack_box.get_treat_tastiness(@box_id)
    result = "Treat: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

end

class Dog
  def self.all
    @dogs ||= []
  end

  def initialize(name)
    @name = name

    self.class.all << self
  end
end

class MetaCorgiSnacks

  def initialize(snack_box, box_id)
    self.class.snack_box = snack_box
    self.class.box_id = box_id
    @snack_box = snack_box
    @box_id = box_id
  end

  def self.snack_box=(sb)
    @snack_box = sb
  end

  def self.box_id=(bid)
    @box_id = bid
  end

  # def method_missing(name, *args)
  #   # Your code goes here...
  #   raise "method missing" if !%i(bone kibble treat).include?(name)
  #   MetaCorgiSnacks.define_snack(name)
  # end


  def self.define_snack(name)
    # Your code goes here...
    define_method(name) do
      @snack_box ||= SnackBox.new
      @box_id ||= 1
      info = @snack_box.send("get_#{name.to_s}_info".to_sym, @box_id)
      tastiness = @snack_box.send("get_#{name.to_s}_tastiness".to_sym, @box_id)
      result = "#{name.to_s.capitalize}: #{info}: #{tastiness} "
      tastiness > 30 ? "* #{result}" : result
    end
  end

  define_snack(:bone)
  define_snack(:kibble)
  define_snack(:treat)
end

# load 'meta_corgis.rb'
# snack_box = SnackBox.new
# meta_snacks = MetaCorgiSnacks.new(snack_box, 1)
# meta_snacks.bone # => "Bone: Phoenician rawhide: 20 "
# meta_snacks.kibble

require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:dessert) { Dessert.new("brownie", 10, chef) }
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq( [] )
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("brownie", "many", "Ethan") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) do
      dessert.add_ingredient("brownie mix")
      dessert.add_ingredient("egg")
      dessert.add_ingredient("water")
    end

    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients.length).to eq(3)
    end
  end

  describe "#mix!" do
    before(:each) do
      dessert.add_ingredient("brownie mix")
      dessert.add_ingredient("egg")
      dessert.add_ingredient("water")
      dessert.add_ingredient("thing0")
      dessert.add_ingredient("thing1")
      dessert.add_ingredient("thing2")
      dessert.add_ingredient("thing3")
      dessert.mix!
    end

    it "shuffles the ingredient array" do
      expect(dessert.ingredients).to_not eq(
        ["brownie mix", "egg", "water", "thing0", "thing1", "thing2", "thing3"]
      )
    end
  end

  describe "#eat" do

    it "subtracts an amount from the quantity" do
      dessert.eat(10)
      expect(dessert.quantity).to eq(0)
    end

    it "raises an error if the amount is greater than the quantity"do
      expect{ dessert.eat(11) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("*cheff title*")
      serve_string = dessert.serve
      has_title = serve_string.include?(chef.titleize)
      expect(has_title).to be_truthy
    end

  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake)
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end

require './lib/pantry'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test
  def setup
    @r1 = Recipe.new("Cheese Pizza")
    @r1.add_ingredient("Cheese", 20)
    @r1.add_ingredient("Flour", 20)

    @r2 = Recipe.new("Pickles")
    @r2.add_ingredient("Brine", 10)
    @r2.add_ingredient("Cucumbers", 30)

    @r3 = Recipe.new("Peanuts")
    @r3.add_ingredient("Raw nuts", 10)
    @r3.add_ingredient("Salt", 10)
  end
  def test_it_exists
    pantry = Pantry.new
    assert_instance_of Pantry, pantry
  end

  # def test_pantry_can_add_to_cookbook
  #   pantry = Pantry.new
  #   pantry.add_to_cookbook(@r1)
  #   pantry.add_to_cookbook(@r2)
  #   pantry.add_to_cookbook(@r3)
  #   assert_equal 3, pantry.cookbook.count
  # end

  # def test_stock_is_0_when_nothing_stocked
  #   pantry = Pantry.new
  #   pantry.add_to_cookbook(@r1)
  #   pantry.add_to_cookbook(@r2)
  #   pantry.add_to_cookbook(@r3)
  #   assert_equal 0, pantry.stock_check("Cheese")
  # end

  # def test_it_can_stock
  #   pantry = Pantry.new
  #   pantry.add_to_cookbook(@r1)
  #   pantry.add_to_cookbook(@r2)
  #   pantry.add_to_cookbook(@r3)
  #   pantry.restock("Cheese", 10)
  #   assert_equal 10, pantry.stock_check("Cheese")
  #   pantry.restock("Cheese", 20)
  #   assert_equal 30, pantry.stock_check("Cheese")
  # end

  def test_can_add_recipe_to_shopping_list
    pantry = Pantry.new
    pantry.add_to_shopping_list(@r1)
    expected = {"Cheese" => 20, "Flour" => 20}
    assert_equal expected, pantry.shopping_list
    pantry.add_to_shopping_list(@r2)
    expected1 = {"Cheese" => 20, "Flour" => 20, "Brine" => 10, "Cucumbers" => 30}
    assert_equal expected1, pantry.shopping_list
  end
end

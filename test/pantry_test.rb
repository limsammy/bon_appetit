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

  def test_pantry_can_add_to_cookbook
    pantry = Pantry.new
    pantry.add_to_cookbook(@r1)
    pantry.add_to_cookbook(@r2)
    pantry.add_to_cookbook(@r3)
    assert_equal 3, pantry.cookbook.count
  end

  def test_stock_is_0_when_nothing_stocked
    pantry = Pantry.new
    pantry.add_to_cookbook(@r1)
    pantry.add_to_cookbook(@r2)
    pantry.add_to_cookbook(@r3)
    assert_equal 0, pantry.stock_check("Cheese")
  end

  def test_it_can_stock
    pantry = Pantry.new
    pantry.add_to_cookbook(@r1)
    pantry.add_to_cookbook(@r2)
    pantry.add_to_cookbook(@r3)
    pantry.restock("Cheese", 10)
    pantry.restock("Flour", 20)
    pantry.restock("Brine", 40)
    pantry.restock("Pickles", 40)
    pantry.restock("Raw nuts", 20)
    pantry.restock("Salt", 20)
    assert_equal 10, pantry.stock_check("Cheese")
  end
end

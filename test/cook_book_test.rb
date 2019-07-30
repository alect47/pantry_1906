require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'
require './lib/cook_book'
require 'pry'

class CookBookTest < Minitest::Test

  def setup
    @cookbook = CookBook.new
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    @ground_beef = Ingredient.new("Ground Beef", "oz", 100)
    @bun = Ingredient.new("Bun", "g", 1)
    @burger = Recipe.new("Burger")
    @burger.add_ingredient(@ground_beef, 4)
    @burger.add_ingredient(@bun, 100)
  end

  def test_it_exits
    assert_instance_of CookBook, @cookbook
  end

  def test_attributes
    assert_equal [{}], @cookbook.summary
  end

  def test_sort_ingredients_by_cal
    assert_equal [2, 8], @cookbook.sort_ingredients_by_cal(@mac_and_cheese).values
  end

  def test_ingredients_hash
    assert_equal 440, @cookbook.ingredients_hash(@mac_and_cheese)[:total_calories]
  end

  def test_recipe_hash
    assert_equal "", @cookbook.recipe_hash(@mac_and_cheese)
  end

  def test_add_recipe
    @cookbook.add_recipe(@mac_and_cheese)
    @cookbook.add_recipe(@burger)
    expected = [{}]
    assert_equal expected, @cookbook.summary
  end


end

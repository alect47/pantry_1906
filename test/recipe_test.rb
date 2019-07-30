require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require 'pry'

class IngredientTest < Minitest::Test

  def setup
    @cheese = Ingredient.new("Cheese", "oz", 50)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  def test_it_exists
    assert_instance_of Recipe, @mac_and_cheese
  end

  def test_attributes
    assert_equal "Mac and Cheese", @mac_and_cheese.name
    assert_equal ({}), @mac_and_cheese.ingredients_required
  end


end

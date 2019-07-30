require './test/test_helper'

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
    assert_equal [], @cookbook.summary
  end

  def test_sort_ingredients_by_cal
    assert_equal [8, 2], @cookbook.sort_ingredients_by_cal(@mac_and_cheese).values
  end

  def test_ingredients_hash
    assert_equal 440, @cookbook.ingredients_hash(@mac_and_cheese)[:total_calories]
  end

  def test_recipe_hash
    assert_equal "Mac and Cheese", @cookbook.recipe_hash(@mac_and_cheese)[:name]
  end

  def test_add_recipe
    @cookbook.add_recipe(@mac_and_cheese)
    @cookbook.add_recipe(@burger)
    expected = ({:name=>"Mac and Cheese", :details=>{:ingredients=>
        [{:ingredient=>"Macaroni", :amount=>"8 oz"},
        {:ingredient=>"Cheese", :amount=>"2 C"}], :total_calories=>440}})
    assert_equal expected, @cookbook.summary[0]
  end

end

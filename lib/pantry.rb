class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, num)
    @stock[ingredient] += num
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.all? do |k, v|
       @stock[k] >= v
    end
  end

end

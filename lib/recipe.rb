require 'pry'
class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, num)
    @ingredients_required[ingredient] = num
  end

  def amount_required(ingredient)
    @ingredients_required[ingredient]
  end

  def ingredients
    @ingredients_required.map {|k, v| k}
  end

  def total_calories
    total_cal = 0
    @ingredients_required.each do |k, v|
      total_cal += (k.calories * v)
    end
    total_cal
  end

end

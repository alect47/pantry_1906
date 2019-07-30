class CookBook

  attr_reader :summary

  def initialize
    @summary = []
  end

  def sort_ingredients_by_cal(recipe)
    recipe.ingredients_required.sort_by do |k, v|
      (k.calories * v * -1)
    end.to_h
  end

  def ingredients_hash(recipe)
    hash = {:ingredients => []}
    hash[:total_calories] = recipe.total_calories
    sort_ingredients_by_cal(recipe).each do |k, v|
      hash_2 = Hash.new(0)
      hash_2[:ingredient] = k.name
      hash_2[:amount] = v.to_s + " " + k.unit
      hash[:ingredients] << hash_2
    end
     hash
  end

  def recipe_hash(recipe)
    hash = Hash.new
    hash[:name] = recipe.name
    hash[:details] = ingredients_hash(recipe)
    hash
  end

  def add_recipe(recipe)
    @summary << recipe_hash(recipe)
  end

end

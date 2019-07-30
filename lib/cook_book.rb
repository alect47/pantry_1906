class CookBook

  attr_reader :summary

  def initialize
    @summary = [Hash.new(0)]
  end

  def ingredients_hash(recipe)
    hash = Hash.new(0)
    hash[:ingredients] = []
    recipe.ingredients_required.each do |k, v|
      hash[:ingredients] << (hash[:ingredient] = k.name)
      hash[:ingredients] << (hash[:amount] = v.to_s + " " + k.unit)
    end
  hash
  end

  def add_recipe(recipe)
    hash = Hash.new(0)
    hash_2 = Hash.new
    hash_2[:ingredients] = recipe.ingredients_required
    binding.pry
    hash[:name] = recipe.name
    hash[:details] = hash_2[:ingredients]
    @summary << recipe
  end



end

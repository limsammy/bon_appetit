class Pantry
  attr_reader :cookbook, :ingredients

  def initialize
    @cookbook = []
    @ingredients = []
  end

  def add_to_cookbook(recipe)
    cookbook << recipe
  end

  def restock(ingredient, unit)
    stock = [ingredient.to_s, unit]
    ingredients << stock
  end
end

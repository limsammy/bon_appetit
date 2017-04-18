class Pantry
  attr_reader :cookbook, :stock

  def initialize
    @cookbook = []
    @stock = {}
  end

  def add_to_cookbook(recipe)
    cookbook << recipe
  end

  def stock_check(ingredient)
    if stock.key?(ingredient)
      return stock[ingredient]
    else
      return 0
    end
  end

  def restock(ingredient, amount)
    if @stock.key?(ingredient)
      @stock[ingredient] += amount
    else
      @stock[ingredient] = amount
    end
  end

  def what_can_i_make
    @cookbook.map do |recipe|
      if @stock.key.include?(recipe.ingredient_types)

      end
    end
  end
end

class Pantry
  attr_reader :shopping_list, :stock, :cookbook

  def initialize
    @shopping_list = {}
    @stock = {}
    @cookbook = []
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

  def add_to_shopping_list(recipe)
    recipe.ingredient_types.each do |ingredient_type|
      @shopping_list[ingredient_type] = recipe.ingredients[ingredient_type]
    end
  end

  def print_shopping_list
    @shopping_list.each do |ingredient, amount|
      puts "*#{ingredient}: #{amount}"
    end
  end

  def add_to_cookbook(recipe)
    @cookbook << recipe
  end

  # def what_can_i_make
  #   @cookbook.map do |recipe|
  #     if @stock.key.include?(recipe.ingredient_types)

  #     end
  #   end
  # end
end

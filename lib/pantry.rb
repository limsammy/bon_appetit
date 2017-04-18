class Pantry
  attr_reader :cookbook

  def initialize
    @cookbook = []
  end

  def add_to_cookbook(recipe)
    cookbook << recipe
  end
end

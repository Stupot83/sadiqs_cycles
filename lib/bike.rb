class Bike
  def initialize
    repair
  end

  def damage
    @damaged = true
  end

  def damaged?
    @damaged
  end

  def repair
    @damaged = false
  end
end

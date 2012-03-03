
class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  
  def name=(name)
    @name = name
  end
  
  def name
    @name
  end
  
  def calories=(calories)
    @calories = calories
  end
  
  def calories
    @calories
  end
  
  def healthy?
    if @calories < 200
	  return true
	else
	  return false
	end
  end
	
  def delicious?
    return true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    @name = name
    @calories = calories
    @flavor = flavor
  end
  
  def flavor=(flavor)
    @flavor = flavor
  end
  
  def flavor
    @flavor
  end
  
  def delicious?
    if @flavor.eql?("black licorice")
	  return false
	else
	  return true
	end
  end
end

#-------------------
manzana = Dessert.new("manzana",50)
puts manzana.healthy?
puts manzana.delicious?
p manzana.name
p manzana.calories

dragon = JellyBean.new("dragon",300,"bitter")
p dragon.name
p dragon.calories
p dragon.delicious?
p dragon.healthy?
dragon.flavor = "black licorice"
p dragon.delicious?
class Item
  attr_accessor :name, :sell_in, :quality
  # this is dangerour stuff here. if there's attribute accessor for these items, anyone with an instance of an Item can just do: item.name = Cat.new() 

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

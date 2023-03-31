class GildedRose

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def alter_item_by_params(item, in_date_change = -1, out_of_date_change = -2)
    item.sell_in > 0 ? item.quality += in_date_change : item.quality += out_of_date_change
    item.quality = 50 if item.quality > 50
    item.quality = 0 if item.quality < 0
  end

  def update_quality()
    @items.each do |item|
      alter_item_by_params(item)
      item.sell_in -= 1
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
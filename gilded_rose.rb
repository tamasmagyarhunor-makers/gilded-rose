class GildedRose

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def alter_item_simple(item, in_date_change = -1, out_of_date_change = -2)
    item.sell_in > 0 ? item.quality += in_date_change : item.quality += out_of_date_change
  end

  def alter_item_complex(item, in_date_change = 1, value_1 = 2, day_1 = 10, value_2 = 3, day_2 = 5, value_3 = 0, day_3 = 0)
    item.quality += in_date_change if item.sell_in > day_1
    item.quality += value_1 if item.sell_in.between?(day_2 + 1, day_1)
    item.quality += value_2 if item.sell_in <= day_2
    item.quality = value_3 if item.sell_in <= day_3
  end

  def update_quality()
    @items.each do |item|
      case item.name
      when /Sulfuras/
        next
      when /Aged Brie/ 
        alter_item_simple(item, 1, 1)
      when /Backstage/ 
        alter_item_complex(item)
      when /Conjured/
        alter_item_simple(item, -2, -4)
      else 
        alter_item_simple(item)
      end 
      item.sell_in -= 1
      item.quality = 50 if item.quality > 50
      item.quality = 0 if item.quality < 0
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
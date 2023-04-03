class GildedRose
  
  attr_reader :items
  
  def initialize(items)
    @items = items
  end
  
  def update_quality()
    @items.each do |item|
      alter_indiv_params(item, *ITEM_PARAMS_HASH["#{item.name}"])
      alter_common_params(item)
    end
  end

  private

  def alter_indiv_params(item, in_date = -1, out_of_date = -2, qual_0_when_0 = false, ten_day_extra = 0, five_day_extra = 0)
    item.sell_in > 0 ? item.quality += in_date : item.quality += out_of_date
    item.quality += ten_day_extra if item.sell_in <= 10
    item.quality += five_day_extra if item.sell_in <= 5
    item.quality = 0 if qual_0_when_0 && item.sell_in <= 0
  end

  def alter_common_params(item)
      item.sell_in -= 1
      item.quality = 50 if item.quality > 50
      item.quality = 0 if item.quality < 0
  end

  # To add new item, all you need to do is add a new matching item name to the hash as a key, and an array of the paramaters you 
  # wish to assign to it as the value. These are passed to function 'alter_indiv_params', see arguments there for required list and defaults.

  ITEM_PARAMS_HASH = {
    "Aged Brie" => [1,1],
    "Backstage passes to a TAFKAL80ETC concert" => [1,0,true,1,1],
    "Sulfuras, Hand of Ragnaros" => [0,0],
    "Conjured Item" => [-2,-4]
  }

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
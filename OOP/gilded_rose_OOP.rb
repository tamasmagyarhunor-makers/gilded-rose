require_relative "./lib/item"
require_relative "./lib/generic_item"
require_relative "./lib/aged_brie"
require_relative "./lib/sulfuras"
require_relative "./lib/backstage"
require_relative "./lib/conjured_item"

class GildedRose
  
  attr_reader :items
  
  CLASS_CHOICE = {
    "Aged Brie" => AgedBrie,
    "Sulfuras, Hand of Ragnaros" => Sulfuras,
    "Backstage passes to a TAFKAL80ETC concert" => Backstage,
    "Conjured Item" => ConjuredItem
  }

  def initialize(items)
    @items = items
  end
  
  def update_quality()
    @items.each do |item|
      (CLASS_CHOICE[item.name] || GenericItem).new(item) 
    end
  end
end
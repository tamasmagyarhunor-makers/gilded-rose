class GenericItem
  def initialize(item)
    @item = item
    update_item
  end

  def update_item
    quality_change  
    bound_quality
    reduce_sell_in
    return @item
  end

  private

  def quality_change
     @item.sell_in > 0 ? @item.quality -= 1 : @item.quality -= 2
  end

  def reduce_sell_in
    @item.sell_in -= 1
  end

  def bound_quality
    @item.quality = 0 if @item.quality < 0
    @item.quality = 50 if @item.quality > 50
  end
end
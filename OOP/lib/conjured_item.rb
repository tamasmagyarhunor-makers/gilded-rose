class ConjuredItem < GenericItem
  private
  def quality_change
     @item.sell_in > 0 ? @item.quality -= 2 : @item.quality -= 4
  end
end
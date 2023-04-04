class Backstage < GenericItem
  private
  def quality_change
    @item.quality += 1
    @item.quality += 1 if @item.sell_in <= 10
    @item.quality += 1 if @item.sell_in <= 5
    @item.quality = 0 if @item.sell_in <= 0
  end
end
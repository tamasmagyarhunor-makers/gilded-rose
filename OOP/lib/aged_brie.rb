class AgedBrie < GenericItem
  private
  def quality_change
    @item.quality += 1
  end
end
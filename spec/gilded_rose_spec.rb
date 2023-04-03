require_relative "../gilded_rose."

RSpec.describe GildedRose do

  context "Plain items all work fine" do
    it "Any Other Item works correctly during normal countdown" do
      test_plain_item = Item.new("Beans", 10, 25)
      test_rose = GildedRose.new([test_plain_item])
      test_rose.update_quality
      expect(test_rose.items[0].to_s).to eq("Beans, 9, 24")
    end
    it "normal item on its last day sell by date" do
      test_plain_item = Item.new("Beans", 1, 25)
      test_rose = GildedRose.new([test_plain_item])
      test_rose.update_quality
      expect(test_rose.items[0].to_s).to eq("Beans, 0, 24")
    end
    it "normal item on sell by date" do
      test_plain_item = Item.new("Beans", 0, 25)
      test_rose = GildedRose.new([test_plain_item])
      test_rose.update_quality
      expect(test_rose.items[0].to_s).to eq("Beans, -1, 23")
    end
    it "normal item past its sell by date" do
      test_plain_item = Item.new("Beans", -4, 25)
      test_rose = GildedRose.new([test_plain_item])
      test_rose.update_quality
      expect(test_rose.items[0].to_s).to eq("Beans, -5, 23")
    end
    it "normal item approach quality 0" do
      test_plain_item = Item.new("Beans", 1, 1)
      test_rose = GildedRose.new([test_plain_item])
      test_rose.update_quality
      expect(test_rose.items[0].to_s).to eq("Beans, 0, 0")
    end
    it "normal item at quality 1 overdue" do
      test_plain_item = Item.new("Beans", -2, 1)
      test_rose = GildedRose.new([test_plain_item])
      test_rose.update_quality
      expect(test_rose.items[0].to_s).to eq("Beans, -3, 0")
    end
    it "normal item at quality 0 in date" do
      test_plain_item = Item.new("Beans", 2, 0)
      test_rose = GildedRose.new([test_plain_item])
      test_rose.update_quality
      expect(test_rose.items[0].to_s).to eq("Beans, 1, 0")
    end
  end

  context "Sulfaras items don't change anything" do
    it "sulfuras doesn't change" do
      test_sulfuras = Item.new("Sulfuras, Hand of Ragnaros", 5, 5)
      test_rose = GildedRose.new([test_sulfuras])
      test_rose.update_quality
      expect(test_rose.items[0].to_s).to eq("Sulfuras, Hand of Ragnaros, 4, 5")
    end
    it "sulfuras doesn't change" do
      test_sulfuras = Item.new("Sulfuras, Hand of Ragnaros", 5, 50)
      test_rose = GildedRose.new([test_sulfuras])
      test_rose.update_quality
      expect(test_rose.items[0].to_s).to eq("Sulfuras, Hand of Ragnaros, 4, 50")
    end
  end

  context "Aged Brie special rules" do
    it "quality always goes up 1" do
      test_brie = Item.new("Aged Brie", 5, 5)
      test_rose = GildedRose.new([test_brie])
      test_rose.update_quality
      expect(test_rose.items[0].to_s).to eq("Aged Brie, 4, 6")
    end
    it "quality can't rise more than 50" do
      test_brie = Item.new("Aged Brie", -2, 50)
      test_rose = GildedRose.new([test_brie])
      test_rose.update_quality
      expect(test_rose.items[0].to_s).to eq("Aged Brie, -3, 50")
    end
  end

  context "Backstage special rules" do
    it "quality always goes up 1 in normal lead in" do
      test_pass = Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 5)
      test_rose = GildedRose.new([test_pass])
      test_rose.update_quality
      expect(test_rose.items[0].to_s).to eq("Backstage passes to a TAFKAL80ETC concert, 10, 6")
    end
    it "quality goes up +2 at 10 days to go " do
      test_pass = Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 40)
      test_rose = GildedRose.new([test_pass])
      test_rose.update_quality
      expect(test_rose.items[0].to_s).to eq("Backstage passes to a TAFKAL80ETC concert, 9, 42")
    end
    it "quality goes up +2 at 6 days to go " do
      test_pass = Item.new("Backstage passes to a TAFKAL80ETC concert", 6, 40)
      test_rose = GildedRose.new([test_pass])
      test_rose.update_quality
      expect(test_rose.items[0].to_s).to eq("Backstage passes to a TAFKAL80ETC concert, 5, 42")
    end
    it "quality goes up +3 at 5 days to go " do
      test_pass = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 40)
      test_rose = GildedRose.new([test_pass])
      test_rose.update_quality
      expect(test_rose.items[0].to_s).to eq("Backstage passes to a TAFKAL80ETC concert, 4, 43")
    end
    it "quality goes up +3 at 1 days to go " do
      test_pass = Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 40)
      test_rose = GildedRose.new([test_pass])
      test_rose.update_quality
      expect(test_rose.items[0].to_s).to eq("Backstage passes to a TAFKAL80ETC concert, 0, 43")
    end
    it "quality goes to 0 on 0 day " do
      test_pass = Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 40)
      test_rose = GildedRose.new([test_pass])
      test_rose.update_quality
      expect(test_rose.items[0].to_s).to eq("Backstage passes to a TAFKAL80ETC concert, -1, 0")
    end
    it "quality stays at 0 past sell by date " do
      test_pass = Item.new("Backstage passes to a TAFKAL80ETC concert", -2, 0)
      test_rose = GildedRose.new([test_pass])
      test_rose.update_quality
      expect(test_rose.items[0].to_s).to eq("Backstage passes to a TAFKAL80ETC concert, -3, 0")
    end
    it "quality can't go past 50 " do
      test_pass = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 50)
      test_rose = GildedRose.new([test_pass])
      test_rose.update_quality
      expect(test_rose.items[0].to_s).to eq("Backstage passes to a TAFKAL80ETC concert, 4, 50")
    end
  end
  
  context "Add new item type" do
    it "Conjured data type degrades -2 before being out of date" do
      test_conjured = Item.new("Conjured Item", 5, 20)
      test_rose = GildedRose.new([test_conjured])
      test_rose.update_quality
      expect(test_rose.items[0].to_s).to eq("Conjured Item, 4, 18")
    end
    it "Conjured data type degrades -4 after going out of date" do
      test_conjured = Item.new("Conjured Item", -2, 20)
      test_rose = GildedRose.new([test_conjured])
      test_rose.update_quality
      expect(test_rose.items[0].to_s).to eq("Conjured Item, -3, 16")
    end
    it "Conjured data type can't go below 0 quality" do
      test_conjured = Item.new("Conjured Item", -2, 1)
      test_rose = GildedRose.new([test_conjured])
      test_rose.update_quality
      expect(test_rose.items[0].to_s).to eq("Conjured Item, -3, 0")
    end
  end

end
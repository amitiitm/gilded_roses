require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq 'foo'
    end
    it 'does not make quality negative' do
      items = [Item.new('Aged Brie', 3, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end
    it 'does changes the quality' do
      items = [Item.new('Aged Brie', 3, 1)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 2
    end
    it 'decrease the quality by 2 for Conjured' do
      items = [Item.new('Conjured', 3, 3)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 1
    end
    it 'decrease the quality by 4 for Conjured as sellin date passed' do
      items = [Item.new('Conjured', -1, 4)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end
  end
end

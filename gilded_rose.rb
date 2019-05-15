class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      next if item.quality < 1 || item.quality > 50 
      if item.name != 'Aged Brie' and item.name != 'Backstage passes to a TAFKAL80ETC concert'
        item.quality = item.quality - 1 if item.quality > 0 && item.name != 'Sulfuras, Hand of Ragnaros'
        item.quality = item.quality - 1 if item.quality > 0 && item.name == 'Conjured'
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == 'Backstage passes to a TAFKAL80ETC concert'
            item.quality = item.quality + 1 if item.sell_in < 11 && item.quality < 50
            item.quality = item.quality + 1 if item.sell_in < 6 && item.quality < 50
          end
        end
      end
      if item.name != 'Sulfuras, Hand of Ragnaros'
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != 'Aged Brie'
          if item.name == 'Conjured' && item.quality > 1
            item.quality = item.quality - 2
          elsif item.name != 'Conjured' && item.name != 'Backstage passes to a TAFKAL80ETC concert' && item.name != 'Sulfuras, Hand of Ragnaros' && item.quality > 0
            item.quality = item.quality - 1
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
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

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      case item.name
      when 'Aged Brie'
        update_aged_brie(item)
      when 'Backstage passes to a TAFKAL80ETC concert'
        update_backstage_pass(item)
      when 'Sulfuras, Hand of Ragnaros'
        # do nothing
      when 'Conjured Mana Cake'
        update_conjured_item(item)
      else
        update_normal_item(item)
      end
    end
  end

  private

  def update_aged_brie(aged_brie)
    aged_brie.sell_in -= 1

    quality_gain = (aged_brie.sell_in < 0) ? 2 : 1
    aged_brie.quality += quality_gain
    aged_brie.quality = 50 if aged_brie.quality > 50
  end

  def update_normal_item(item)
    item.sell_in -= 1

    quality_loss = (item.sell_in < 0) ? 2 : 1
    item.quality -= quality_loss
    item.quality = 0 if item.quality < 0
  end

  def update_backstage_pass(backstage_pass)
    backstage_pass.sell_in -= 1

    if backstage_pass.sell_in < 0
      backstage_pass.quality = 0
      return
    end

    quality_gain = if backstage_pass.sell_in < 5
                     3
                   elsif backstage_pass.sell_in < 10
                     2
                   else
                     1
                   end

    backstage_pass.quality += quality_gain
    backstage_pass.quality = 50 if backstage_pass.quality > 50
  end


  def update_conjured_item(conjured_item)
    conjured_item.sell_in -= 1

    quality_loss = (conjured_item.sell_in < 0) ? 4 : 2
    conjured_item.quality -= quality_loss
    conjured_item.quality = 0 if conjured_item.quality < 0
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name:, sell_in:, quality:)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
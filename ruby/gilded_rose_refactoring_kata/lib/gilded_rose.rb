class Inventory
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def tick()
  end
end

class Normal < Inventory
  def tick()
    item.quality -= 1 if item.sell_in <= 0
    item.sell_in -= 1
    item.quality -= 1
    item.quality = 0 if item.quality < 0
  end
end

class Brie < Inventory
  def tick()
    item.sell_in -= 1
    item.quality += 1
    item.quality += 1 if item.sell_in <= 0
    item.quality = [item.quality, 50].min
  end
end

class Sulfurus < Inventory
  def tick()
  end
end

class Pass < Inventory
  def tick()
    item.quality += 1 if item.sell_in <= 10
    item.quality += 1 if item.sell_in <= 5
    item.quality += 1
    item.quality = 0  if item.sell_in <= 0
    item.quality = [item.quality, 50].min
    item.sell_in -= 1
  end
end

class Cake < Inventory
  def tick()
    item.quality -= 2 if item.sell_in >= 0
    item.quality -= 2 if item.sell_in == 0
    item.quality -= 4 if item.sell_in <  0
    item.quality = [item.quality, 0].max
    item.sell_in -= 1
  end
end

INVENTORY_CLASS = {
  "NORMAL ITEM" => Normal,
  "Aged Brie" => Brie,
  "Sulfuras, Hand of Ragnaros" => Inventory,
  "Backstage passes to a TAFKAL80ETC concert" => Pass,
  "Conjured Mana Cake" => Cake
}

def update_quality(items)
  items.each do |item|
    INVENTORY_CLASS[item.name].new(item).tick
  end
end


# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]

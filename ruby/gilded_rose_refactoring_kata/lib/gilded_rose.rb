def update_quality(items)
  items.each do |item|
    if item.name == "NORMAL ITEM"
      normal_tick item
    end

    if item.name == "Aged Brie"
      brie_tick item
    end

    if item.name == "Sulfuras, Hand of Ragnaros"
      sulfuras_tick item
    end

    if item.name == "Backstage passes to a TAFKAL80ETC concert"
      pass_tick item
    end

    if item.name == "Conjured Mana Cake"
      cake_tick item
    end
  end
end

def normal_tick(item)
  item.quality -= 1 if item.sell_in <= 0
  item.sell_in -= 1
  item.quality -= 1
  item.quality = 0 if item.quality < 0
end

def brie_tick(item)
  item.sell_in -= 1
  item.quality += 1
  item.quality += 1 if item.sell_in <= 0
  item.quality = [item.quality, 50].min
end

def sulfuras_tick(item)
end

def pass_tick(item)
  item.quality += 1 if item.sell_in <= 10
  item.quality += 1 if item.sell_in <= 5
  item.quality += 1
  item.quality = 0  if item.sell_in <= 0
  item.quality = [item.quality, 50].min
  item.sell_in -= 1
end

def cake_tick(item)
  item.quality -= 2 if item.sell_in >= 0
  item.quality -= 2 if item.sell_in == 0
  item.quality -= 4 if item.sell_in <  0
  item.quality = [item.quality, 0].max
  item.sell_in -= 1
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

class ItemFactory

    def initialize()
        @items= {}
        @items['FR'] = Item.new('FR', 'Fruit Tea', 3.11)
        @items['SR'] = Item.new('SR', 'Strawberries', 5.00)
        @items['CF'] = Item.new('CF', 'Coffe', 11.23)
        @items['AJ'] = Item.new('AJ', 'Apple Juice', 7.25)
        @items['NT'] = Item.new('NT', 'Nuts', 2.10)
        @items['BR'] = Item.new('BR', 'Beer', 5.90)
    end
    
    def build(item_name)
        raise 'Cant build suсh product' unless @items.has_key?(item_name)
        @items[item_name]
    end
    
    
    
end    

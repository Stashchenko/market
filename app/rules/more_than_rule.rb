class MoreThanRule
 
    attr_accessor :item_name, :items_count, :price
    
    def initialize(item_name, count, price)
        @item_name = item_name
        @items_count = count
        @price = price
    end
    
    def can_apply?(items)
        items.count(@item_name) >= @items_count
    end
    
    def price(market, items)
        count = items.count(@item_name)
        @price * count
    end 
    
    
end    
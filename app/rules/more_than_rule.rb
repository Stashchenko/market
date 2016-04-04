class MoreThanRule
 
    attr_accessor :item_name, :items_count, :price
    
    def initialize(item_name, count, price)
        @item_name = item_name
        @items_count = count
        @price = price
    end
    
    def can_apply?(items)
        return false if items[@item_name] == nil
        items[@item_name].count >= @items_count
    end
    
    def modify_price!(items)
        items[@item_name].map! {|old_price| old_price=@price}
    end 
    
    
end    
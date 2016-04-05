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
        items[@item_name].each do |item| 
             item.price = @price
             item.add_discount_rules(self.class)
        end
    end 
    
    
end    
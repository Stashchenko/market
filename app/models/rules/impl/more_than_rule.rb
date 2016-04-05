class MoreThanRule < BaseRule
 
    attr_accessor :items_count, :price
    
    def initialize(item_name, count, price)
        @items_count = count
        @price = price
        super(item_name)
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
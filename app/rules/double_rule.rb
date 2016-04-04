class DoubleRule
 
    attr_accessor :first_item, :second_item , :price
    
    def initialize(first_item, second_item,  price)
        @first_item = first_item
        @second_item = second_item
    end
    
    def can_apply?(items)
     (items & @item_names) == @item_names
    end
    
    def price(market, items)
        items.count()
        count = items.count(@item_name)
        @price * count
    end 
    
    
end    
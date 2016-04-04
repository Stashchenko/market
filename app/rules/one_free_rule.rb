class OneFreeRule
 
    attr_accessor :item_name
    
    def initialize(item_name)
        @item_name = item_name
    end
    
    def can_apply?(items)
        items.count(@item_name) > 1 
    end
    
    def price(market, items)
        count = items.count(@item_name)
        multiplayer =(count / 2.0).round
        multiplayer * market.products[@item_name].price 
    end  
  
    
end    
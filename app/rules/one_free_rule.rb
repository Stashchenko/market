class OneFreeRule
 
    attr_accessor :item_name
    
    def initialize(item_name)
        @item_name = item_name
    end
    
    def can_apply?(items)
        return false if items[@item_name] == nil
        items[@item_name].count > 1 
    end
    
    def modify_price!(items)
        count = items[@item_name].count
        items[@item_name].each_with_index do |price, index|
            items[@item_name][index]= 0.00 if double_item?(index)
        end
    end
    
    private 
    
    def double_item?(index)
        ((index + 1) % 2)  == 0
    end    
   
  
    
end    
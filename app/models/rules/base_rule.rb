class BaseRule
    attr_accessor :item_name
    
    def initialize(name)
        @item_name = name
    end
    
    def can_apply?(items)
        raise 'Should implement'
    end  
    
    def modify_price!(items)
        raise 'Should implement'
    end
    
end
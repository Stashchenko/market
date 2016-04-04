class Market
    attr_accessor :products, :discount_rules
    
    def add_item(item)
        @products ||= {}
        @products[item.id]=item
    end

    def add_discount_rule(rule)
        @discount_rules ||= {} 
        @discount_rules[rule.item_name]= rule 
    end
    
    def discount_rules 
      @discount_rules.values
    end
    
    def create_checkout
        Checkout.new(self)
    end
    
    
end
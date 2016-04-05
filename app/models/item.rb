class Item
    attr_accessor :id, :name, :price, :discount_rules
    
    def initialize(id, name, price)
        @id = id
        @name = name
        @price = price
    end
    
    def add_discount_rules(rule_name)
        @discount_rules ||= []
        @discount_rules << rule_name
    end
    
    def inspect
      result  = "#{id}: $#{price}"
      result += ",discount: #{discount_rules}" if discount_rules
      result
    end        
    
end
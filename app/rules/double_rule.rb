class DoubleRule
 
    attr_accessor :item_name, :first_item, :second_item
    
    def initialize(first_item, second_item)
        @item_name = "#{first_item}_#{second_item}"
        @first_item = first_item
        @second_item = second_item
    end
    
    def can_apply?(items)
      items[@first_item] != nil && item_name[@second_item] != nil
    end
    
    def modify_price!(items)
        total_first_product = items[@first_item].count
        items[@second_item].each_with_index do |price, index|
            if index < total_first_product
                items[@second_item][index].price = 0.00
                items[@second_item][index].add_discount_rules(self.class)
            end    
        end
    end 
    
    
end    
class PriceCalculator
    attr_accessor :details_prices
    
    def initialize(market)
        @market = market
    end    
    
    def total(items)
        @details_prices = initial_prices(items)
        apply_rules!(@details_prices)
        sum = 0.0
        @details_prices.values.flatten.each { |item| sum += item.price }  
        sum.round(2)
    end
    


    private
    
    def initial_prices(items)
        result = {} 
        items.each do |item|
            result[item] ||= []
            result[item] << @market.products[item].clone
        end
        # result exmpl. {'FR' : [Item, Item..], 'SR': [Item]...}
        result
    end
    
    def apply_rules!(default_prices)
        @market.discount_rules.each do |rule|
            rule.modify_price!(default_prices) if rule.can_apply?(default_prices)
        end
    end    
  
end
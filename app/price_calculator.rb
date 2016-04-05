class PriceCalculator
    attr_accessor :details_prices
    
    def initialize(market)
        @market = market
    end    
    
    def total(items)
        @details_prices = items
        apply_rules!(@details_prices)
        sum(@details_prices) 
    end

    private
    
    def sum(items)
        sum = 0.0
        @details_prices.values.flatten.each { |item| sum += item.price }  
        sum.round(2)
    end
    
    def apply_rules!(default_prices)
        @market.discount_rules.each do |rule|
            rule.modify_price!(default_prices) if rule.can_apply?(default_prices)
        end
    end    
  
end
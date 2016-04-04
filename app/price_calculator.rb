class PriceCalculator
    attr_accessor :details_price
    
    def initialize(market)
        @market = market
    end    
    
    def total(items)
        @default_prices = {}
        items.each do |item|
            @default_prices[item] ||= []
            @default_prices[item] << @market.products[item].price
        end  
        apply_rules!(@default_prices)
        sum = 0.00
        @default_prices.values.flatten.inject(0, :+).round(2)
    end

    private
    
    def apply_rules!(default_prices)
        @market.discount_rules.each do |rule|
            rule.modify_price!(default_prices) if rule.can_apply?(default_prices)
        end
    end    
  
end
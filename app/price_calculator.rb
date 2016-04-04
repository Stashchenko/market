class PriceCalculator
    attr_accessor :details_price
    
    def initialize(market)
        @market = market
    end    
    
    def total(items)
        @grouped_price = apply_rules(items)
        sum = 0.00
        items.each do |item|
            unless @grouped_price.has_key?(item)
                @grouped_price[item]= @market.products[item].price 
            end
        end    
        sum += @grouped_price.values.inject(0, :+)
        sum.round(2)
    end

    private
    
    def apply_rules(items)
        grouped_price = {}
        @market.discount_rules.each do |rule|
            if rule.can_apply?(items)
                grouped_price[rule.item_name] = rule.price(@market,items)
            end  
        end
        grouped_price
    end    
  
end
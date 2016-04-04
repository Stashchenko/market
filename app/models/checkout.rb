class Checkout
    attr_accessor :items, :market
    
    def initialize(market)
        @market = market
    end
    
    def scan(item)
        @items ||= []
        @items << item
    end
    
    def total
        "Items: #{@items}  Total: $#{price}"
    end
    
    def price
        PriceCalculator.new(@market).total(@items)
    end
    
end
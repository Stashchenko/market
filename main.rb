Dir["app/**/*.rb"].each {|file| load file }

puts "Welcome to SMART Store)))"
factory = ItemFactory.new
market = Market.new
market.add_item(factory.build('FR'))
market.add_item(factory.build('SR'))
market.add_item(factory.build('CF'))
market.add_item(factory.build('AJ'))
market.add_item(factory.build('BR'))
market.add_item(factory.build('NT'))

market.add_discount_rule(OneFreeRule.new("FR"))
market.add_discount_rule(MoreThanRule.new("SR", 3, 4.50))

checkout = market.create_checkout

checkout.scan("FR")
checkout.scan("SR")
checkout.scan("FR")
checkout.scan("FR")
checkout.scan("CF")
puts checkout.total

checkout = market.create_checkout
checkout.scan("FR")
checkout.scan("FR")
puts checkout.total

checkout = market.create_checkout
checkout.scan("SR")
checkout.scan("SR")
checkout.scan("FR")
checkout.scan("SR")
puts checkout.total

puts 'My additional discount'
#Check for double rule discount, example for each beer you can get one free nuts 
market.add_discount_rule(DoubleRule.new("BR", "NT"))
checkout = market.create_checkout
checkout.scan("BR")
checkout.scan("NT")
puts checkout.total

checkout = market.create_checkout
checkout.scan("BR")
checkout.scan("NT")
checkout.scan("NT")
puts checkout.total



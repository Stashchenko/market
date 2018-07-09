# frozen_string_literal: true

Dir[File.join(File.expand_path(Dir.pwd), 'app/**/', '*.rb')].each { |file| require_relative file }

puts 'Welcome to SMART Store)))'
factory = ItemFactory.new
market = Market.new

factory.build('FR')
# add discounts
market.add_discount_rule(OneFreeRule.new('FR'))
market.add_discount_rule(MoreThanRule.new('SR', 3, 4.50))

checkout = market.create_checkout
fruit_tea = factory.build('FR')
checkout.scan(factory.build('SR'))
checkout.scan(factory.build('CF'))

puts checkout.total
puts " -> Details: #{checkout.details_price}"

barry = factory.build('SR')
checkout = market.create_checkout
checkout.scan(fruit_tea)
3.times { checkout.scan(barry.clone) }

puts checkout.total
puts " -> Details: #{checkout.details_price}"

puts '--My additional discount--'
# Check for double rule discount, example
# for each beer you can get one free nuts
market.add_discount_rule(DoubleRule.new('BR', 'NT'))
checkout = market.create_checkout
checkout.scan(factory.build('BR'))
checkout.scan(factory.build('NT'))
puts checkout.total

puts '--При покупке мыши и клавиатуры - 3%--'
# Check for double rule discount, example
# for each beer you can get one free nuts
market.add_discount_rule(DiscountForPairRule.new('MS', 'KB', 3))
checkout = market.create_checkout
checkout.scan(factory.build('MS'))
checkout.scan(factory.build('KB'))
puts checkout.total
puts " -> Details: #{checkout.details_price}"

puts 'При покупке товаров в категории "Еда" после 6ти вечера - 5%'
time = Time.new(Time.now.year, Time.now.month, Time.now.day, Time.now.hour - 1, 0o0)
market.add_discount_rule(CategoryTimeRule.new(:food, time, 5))
checkout = market.create_checkout
nuts = factory.build('AJ')
nuts.category = :food
2.times { checkout.scan(nuts.clone) }
puts checkout.total
puts " -> Details: #{checkout.details_price}"

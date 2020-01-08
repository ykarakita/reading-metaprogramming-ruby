class Roulette
  def method_missing(name, *args)
    person = name.to_s.capitalize
    super unless %w(Bob Frank Bill).include?(person)
    number = 0
    3.times do
      number = rand(10) + 1
      puts "#{number}..."
    end
    "#{person} got a #{number}"
  end
end

# irb
# >> >> require './my_workspace/03_method/roulette_failure.rb'
# require './my_workspace/03_method/roulette_failure.rb'
# => true
# >> >> number_of = Roulette.new
# number_of = Roulette.new
# => #<Roulette:0x00007fcefe03bf90>
# >> >> number_of.bob
# number_of.bob
# 9...
# 4...
# 3...
# => "Bob got a 3"
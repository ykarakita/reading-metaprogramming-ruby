class DS
  def self.mouse_price; 1500; end
  def self.keyboard_price; 20000; end
end

class Computer
  def initialize(data_source)
    @data_source = data_source
    data_source.methods.grep(/(.*)_price$/) { Computer.define_component $1 }
  end

  def self.define_component(name)
    define_method("get_#{name}_price") do
      @data_source.send "#{name}_price"
    end
  end

  #define_component(:mouse)
  #define_component(:keyboard)
end

# computer.get_mouse_price 的な感じで取得できるようにする

# irb
#require './my_workspace/03_method/define_methods'
#=> true
#computer = Computer.new(DS)
#=> #<Computer:0x00007fd003074448 @data_source=DS>
#computer.get_mouse_price
#=> 1500
#computer.get_keyboard_price
#=> 20000

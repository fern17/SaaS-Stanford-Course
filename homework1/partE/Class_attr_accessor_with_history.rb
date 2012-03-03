class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s
    attr_reader attr_name
    attr_reader attr_name+"_history"
    class_eval %Q{
      @#{attr_name}_history = Array.new
      def #{attr_name}=(value)
        oldvalue = @#{attr_name}
        p @old_value
        @#{attr_name}_history.push(old_value)
        @#{attr_name} = value
      end
    }
  end
end

class Foo
  attr_accessor_with_history :bar
end

f = Foo.new
f.bar = 1
f.bar
f.bar = 2
f.bar
f.bar_history

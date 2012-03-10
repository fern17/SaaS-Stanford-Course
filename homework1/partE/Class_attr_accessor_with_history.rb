class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s
    attr_reader attr_name
    attr_reader attr_name+"_history"

    class_eval %Q{
      def #{attr_name}=(value)
        if @#{attr_name}_history == nil
          @#{attr_name}_history = Array.new
          @#{attr_name}_history << nil
        end
        if @#{attr_name} == nil
          @#{attr_name} = value
        else
          old_value = @#{attr_name}
          @#{attr_name} = value
        end
        @#{attr_name}_history.push(value)
      end
    }
  end
end

class Foo
  attr_accessor_with_history :bar
end

f = Foo.new
f.bar = 1
p f.bar
f.bar = 2
p f.bar
p f.bar_history

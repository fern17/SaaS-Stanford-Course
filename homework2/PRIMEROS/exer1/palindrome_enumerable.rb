module Enumerable
  def palindrome?
    a = Array.new
    self.reverse_each { |v| a << v }
    b = Array.new
    self.each { |v| b << v }
    return a.eql? b
  end
end


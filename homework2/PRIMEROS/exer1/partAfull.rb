module Enumerable
  def palindrome?
    a = Array.new
    self.reverse_each { |v| a << v }
    b = Array.new
    self.each { |v| b << v }
    return a.eql? b
  end
end

class String
  def palindrome?
    w = self.gsub(/\W/,'')
    return w.downcase.eql?(w.downcase.reverse)
  end
end

class Numeric
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub(/s$/,'')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
  def in (conversion)
    self.send (conversion)
  end
end


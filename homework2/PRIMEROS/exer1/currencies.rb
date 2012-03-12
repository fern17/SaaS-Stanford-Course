class Numeric
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 
              'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub(/s$/,'')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
  def in (conversion)
    self.rupees.send (conversion)
  end
end

p 5.rupees.in(:yen).between?(7.2, 7.4)

p 5.rupees.in(:yen)

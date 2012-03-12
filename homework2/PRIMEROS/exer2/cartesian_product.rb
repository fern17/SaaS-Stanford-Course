class CartesianProduct
  include Enumerable
  def initialize(a,b)
    @a = a
    @b = b
  end
  def each
    @a.each do |a|
      @b.each do |b|
        yield [a,b]
      end
    end
  end
end

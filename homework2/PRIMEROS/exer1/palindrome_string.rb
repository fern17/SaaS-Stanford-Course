class String
  def palindrome?
    w = gsub(/\W/,'')
    return w.downcase.eql?(w.downcase.reverse)
  end
end


def combine_anagrams(words)
  result = Array.new
  words.each do |pattern|
    pattern_new = pattern.downcase.split(//).sort.join
	temp = Array.new
	words.each do |x|
	  x_old = x
	  x = x.downcase.split(//).sort.join
	  if x.eql?(pattern_new)
	    temp << x_old
	  end
	end
	result << temp
  end
  result.uniq!
  p result
end

combine_anagrams(['Cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream'])
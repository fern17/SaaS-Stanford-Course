def count_words(string)
  str = string.gsub(/\W/, ' ')
  str.downcase!
  a = str.split
  hash = Hash.new
  a.each{ |word| hash[word] = a.count(word)}
  p hash
end

def palindrome?(string)
  w = string.gsub(/\W/,'')
  w.downcase!
  p w.eql?(w.reverse)
end


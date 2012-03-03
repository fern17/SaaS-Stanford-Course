def count_words(string)
  str = string.gsub(/\W/, ' ')
  str.downcase!
  a = str.split
  hash = Hash.new
  a.each{ |word| hash[word] = a.count(word)}
  puts hash
end

def palindrome?(string)
  w = string.gsub(/\W/,'')
  w.downcase!
  puts w.eql?(w.reverse)
end

palindrome?("hoh")
count_words("a b a b")

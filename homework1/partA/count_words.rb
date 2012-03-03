def count_words(string)
  str = string.gsub(/\W/, ' ')
  str.downcase!
  a = str.split
  hash = Hash.new
  a.each{ |word| hash[word] = a.count(word)}
  print hash
end

count_words("A man, a plan, a canal -- Panama")


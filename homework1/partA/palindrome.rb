def palindrome?(string)
    w = string.gsub(/\W/,'')
    w.downcase!
    w.eql?(w.reverse)
end

p palindrome?("Madam, I'm Adam!")
p palindrome?("A man, a plan, a canal -- Panama")
p palindrome?("Abracadabra")
p palindrome?("  ")


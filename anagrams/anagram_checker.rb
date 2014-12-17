
def anagram_checker(word1, word2)

  word_1 = word1.gsub(/[\s^A-Za-z]/,"").downcase
  word_2 = word2.gsub(/[\s^A-Za-z]/,"").downcase

  word_1_arr = word_1.split("").sort
  word_2_arr = word_2.split("").sort

  result = (word_1_arr == word_2_arr) && (word_1_arr.count == word_2_arr.count)
  result
end

def anagram_checker_dawg(word1, word2)

  word_1 = word1.gsub(/[\s^A-Za-z]/,"").downcase
  word_2 = word2.gsub(/[\s^A-Za-z]/,"").downcase

  word_1_arr = word_1.split("").sort
  word_2_arr = word_2.split("").sort

  if (word_1_arr == word_2_arr) && (word_1_arr.count == word_2_arr.count)
    return "Yo dawg, yo words be anagrams, dawg."
  else
    return "Sorry dawg, yo words aint anagrams, dawg."
  end

end

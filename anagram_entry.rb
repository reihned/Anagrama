require 'active_record'
require './anagram_checker.rb'
require './lib/connection.rb'
require './lib/anagram_class.rb'

word1 = ARGV[0]
word2 = ARGV[1]

if anagram_checker(word1,word2)
  Anagram.create( word1: word1, word2: word2 )
  puts "Yo dawg, I heard you like anagrams, so I put yo anagrams in 'Anagrams'."
else
  puts "Dawg, what are you doing? These ain't anagrams, dawg."
  puts "How I am supposed to put anagrams in 'Anagrams' if they ain't anagrams, dawg."
end

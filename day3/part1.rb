require 'pry'

ALPHABET = ('a'..'z').to_a + ('A'..'Z').to_a

p (File.open('input.txt').sum do |line|
  halved = line.strip.chars.each_slice(line.size/2).to_a
  a1 = halved.first
  a2 = halved.last
  common = a1 & a2
  ALPHABET.index(common.first) + 1
end)

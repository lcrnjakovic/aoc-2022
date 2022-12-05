require 'pry'

ALPHABET = ('a'..'z').to_a + ('A'..'Z').to_a

sum = 0

File.open('input.txt').each_slice(3) do |line|
  arrays = line.map { |x| x.strip.chars }
  common = arrays[0] & arrays[1] & arrays[2]
  sum += ALPHABET.index(common.first) + 1
end

p sum

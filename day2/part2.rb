require 'pry'

SIGN_VALUE = {
  'A' => 1,
  'B' => 2,
  'C' => 3
}.freeze

OUTCOME_VALUE = {
  'X' => [0, -1],
  'Y' => [3, 0],
  'Z' => [6, 1]
}.freeze

p (File.open('input.txt').sum do |line|
  signs = line.split
  index = (SIGN_VALUE.keys.index(signs.first) + OUTCOME_VALUE[signs.last].last) % 3
  SIGN_VALUE[SIGN_VALUE.keys[index]] + OUTCOME_VALUE[signs.last].first
end)

require 'pry'

OUTCOME_MAP = {
  'AX' => 3,
  'AY' => 6,
  'AZ' => 0,
  'BX' => 0,
  'BY' => 3,
  'BZ' => 6,
  'CX' => 6,
  'CY' => 0,
  'CZ' => 3
}.freeze

SIGN_VALUE = {
  'X' => 1,
  'Y' => 2,
  'Z' => 3
}.freeze

p (File.open('input.txt').sum do |line|
  signs = line.split
  SIGN_VALUE[signs.last] + OUTCOME_MAP[signs.join]
end)

require 'pry'

counter = 0

File.open('input.txt').each do |line|
  array = line.scan /\d+/
  r1 = (array[0]..array[1]).to_a
  r2 = (array[2]..array[3]).to_a
  counter += 1 if (r1 - r2).empty? || (r2 - r1).empty?
end

p counter

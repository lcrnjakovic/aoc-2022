require 'pry'

grid = Array.new(99) { Array.new(99) }
scores = Array.new(99) { Array.new(99) }

File.open('input.txt').each_with_index do |line, i|
  grid[i] = line.strip.chars.map(&:to_i)
end

99.times do |x|
  99.times do |y|
    neighbors = []
    neighbors << grid[x][0...y]
    neighbors << grid[x][y+1..]
    neighbors << grid.transpose[y][0...x]
    neighbors << grid.transpose[y][x+1..]

    counts = neighbors.map.with_index do |arr, i|
      arr = arr.reverse if i.zero? || i == 2
      arr[0..arr.find_index { |w| w >= grid[x][y] }].count
    end

    scores[x][y] = counts.inject(:*)
  end
end

p scores.flatten.max

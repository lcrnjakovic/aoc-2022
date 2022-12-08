require 'pry'

grid = Array.new(99) { Array.new(99) }
visible = Array.new(99) { Array.new(99) }

File.open('input.txt').each_with_index do |line, i|
  grid[i] = line.strip.chars.map(&:to_i)
end

99.times do |x|
  99.times do |y|
    if x.zero? || x == 98 || y.zero? || y == 98
      visible[x][y] = true
    else
      neighbors = []
      neighbors << grid[x][0...y]
      neighbors << grid[x][y+1..]
      neighbors << grid.transpose[y][0...x]
      neighbors << grid.transpose[y][x+1..]

      visible[x][y] = neighbors.any? { |w| w.all? { |z| z < grid[x][y] }}
    end
  end
end

p visible.flatten.count(true)

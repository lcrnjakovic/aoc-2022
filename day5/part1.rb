require 'pry'

num_stacks = File.open('input.txt') {|f| f.readline }.size / 4
num_stacks.times { |i| instance_variable_set("@stack#{i+1}", []) }

File.open('input.txt').each do |line|
  if line.include?('[')
    row = line.gsub("\n", ' ').scan(/(.{3}) /)
    row.flatten.each_with_index do |e, i|
      eval("@stack#{i+1}").unshift(e) if e.match?(/\w/)
    end
  end

  if line.include?('move')
    line.match(/(\d+).+(\d+).+(\d+)/)
    $1.to_i.times do
      eval("@stack#{$3}").push(eval("@stack#{$2}").pop)
    end
  end
end

num_stacks.times { |i| print eval("@stack#{i+1}").last[1] }

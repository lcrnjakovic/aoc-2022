require 'pry'

max_calories = 0
elf_sum = 0
File.open('input.txt').each do |line|
  calories = line.to_i
  if calories == 0
    max_calories = elf_sum if elf_sum > max_calories
    elf_sum = 0
  else
    elf_sum += calories
  end
end

p max_calories

require 'pry'

max_calories = []
elf_sum = 0
File.open('input.txt').each do |line|
  calories = line.to_i
  if calories == 0
    if max_calories.size < 3
      max_calories << elf_sum
    else
      max_calories[max_calories.index(max_calories.min)] = elf_sum if max_calories.min < elf_sum
    end
    elf_sum = 0
  else
    elf_sum += calories
  end
end

p max_calories.sum

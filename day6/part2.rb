require 'pry'

counter = 14

File.open('input.txt').each do |line|
  line.chars.each_cons(14) do |seq|
    if seq == seq.uniq
      p counter
      return
    end
    counter += 1
  end
end

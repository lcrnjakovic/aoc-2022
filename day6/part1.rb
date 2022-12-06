require 'pry'

counter = 4

File.open('input.txt').each do |line|
  line.chars.each_cons(4) do |seq|
    if seq == seq.uniq
      p counter
      return
    end
    counter += 1
  end
end

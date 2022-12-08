require 'pry'

class Tree
  attr_accessor :children, :files, :parent, :collection
  attr_reader :path

  def initialize(p, parent)
    @path = p
    @files = []
    @children = []
    @parent = parent
    @collection = []
  end

  def size
    files.sum { |x| x.size.to_i } + children.sum(&:size)
  end

  def collect
    [{ path => size }] + children.map(&:collect)
  end

end

structure = nil
current = nil
current_tree = nil

File.open('input.txt').each do |line|
  if line[0] == '$'
    if line [2..3] == 'cd'
      if line.strip[5..] == '..'
        current_tree = current_tree.parent
      else
        current = line.strip[5..]
        parent = current_tree
        current_tree = parent&.children&.find { |x| x.path == current } || Tree.new(current, parent)
        structure ||= current_tree
      end
    end
  else
    if line[0..2] == 'dir'
      parent = current_tree
      current_tree.children << Tree.new(line.strip[4..], parent)
    else
      current_tree.files << OpenStruct.new(size: line.strip.split.first, name: line.strip.split.last)
    end
  end
end

p structure.collect.flatten.map(&:values).select { |x| x.first <= 100000 }.flatten.sum

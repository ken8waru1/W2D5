class Node

  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  
  def initialize
    @head = Node.new
    @tail = Node.new

    @head.next = @tail
    @tail.prev = @head

  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    if !empty?
      @head.next
    end
  end

  def last
    if !empty?
      @tail.prev
    end
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each {|node| return node.val if node.key == key }
    nil
  end

  def include?(key)
  end

  def append(key, val)
    new_node = Node.new(key, val)
    @tail.prev.next = new_node
    new_node.next = @tail
    new_node.prev = @tail.prev
    @tail.prev = new_node
  end

  def update(key, val)
    self.each { |node| node.val = val if node.key == key }
  end

  def remove(key)
  end

  def each(&prc)
    iter = @head.next
    while iter != @tail
      prc.call(iter)
      iter = iter.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end

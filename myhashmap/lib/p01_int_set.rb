class MaxIntSet

  attr_reader :store
  def initialize(max)
    @store = Array.new(max,false)
    @max = max
  end

  def insert(num)
    validate!(num)
    @store[num] = true 
    true
  end

  def remove(num)
    validate!(num)  
    @store[num] = false  
  end

  def include?(num)
    validate!(num)    
    @store[num]
  end

  private

  def is_valid?(num)
    return false if num < 0 || num >= @max
    true
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    idx = num % @store.length
    @store[idx] << num
  end

  def remove(num)
    idx = num % @store.length   
    @store[idx].delete(num)
  end

  def include?(num)
    idx = num % @store.length   
    @store[idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    idx = num % @store.length
    unless include?(num)
      @store[idx] << num
      @count += 1
      resize! if @count == num_buckets
    end
  end

  def remove(num)
    idx = num % @store.length   
    if include?(num)
      @store[idx].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    idx = num % @store.length   
    @store[idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_arr = Array.new(num_buckets * 2) { Array.new }
    @store.each do |bucket|
      bucket.each do |el|
        idx = el % new_arr.length
        new_arr[idx] << el
      end
    end
    
    @store = new_arr
  end
end

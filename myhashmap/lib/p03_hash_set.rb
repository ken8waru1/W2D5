class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key)
      idx = key.hash % num_buckets
      @store[idx] << key
      @count += 1
      resize! if @count == num_buckets
      return true
    end
  
  end

  def include?(key)
    idx = key.hash % num_buckets
    @store[idx].include?(key)
  end

  def remove(key)
    if include?(key)
      idx = key.hash % num_buckets
      @store[idx].delete(key)
      @count -= 1
    end
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
        idx = el.hash % new_arr.length
        new_arr[idx] << el
      end
    end
    
    @store = new_arr
  end
end

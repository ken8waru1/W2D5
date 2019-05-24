class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    total = 1
    self.each { |ele| total = ele * total - 1 }
    total
  end
end

class String
  def hash
    bytes = []
    self.each_byte {|byte| bytes << byte}
    bytes.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    # product = 1
    # self.each do |key,value|

    #   if key.is_a?(Symbol) 
    #     product = product * key.to_s.bytes[0] * 3 - 1
    #   elsif key.is_a?(Integer)
    #     product = product * key
    #   else
    #     product = product * key.bytes[0] -1
    #   end

    #   if value.is_a?(Symbol) 
    #     product = product * value.to_s.bytes[0] * 3 - 1
    #   elsif value.is_a?(Integer)
    #     product = product * value
    #   else
    #     product = product * value.bytes[0] -1
    #   end
    # end
  end
end

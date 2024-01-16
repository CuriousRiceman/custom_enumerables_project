module Enumerable
  def my_each
    for elem in self
      yield(elem)
    end
  end

  def my_all?
    my_each { |elem| return false unless yield(elem) }
    true
  end

  def my_any?
    my_each { |elem| return true if yield(elem) }
    false
  end

  def my_count
    count = 0
    if block_given?
      my_each { |elem| count += 1 if yield(elem)}
      return count
    else
      count = self.size
      return count
    end
  end

  def my_each_with_index
    index = 0
    my_each { |elem| yield(elem, index); index += 1 }
  end

  def my_inject(initial = nil)
    accumulator = initial.nil? ? first : initial
    my_each { |elem| accumulator = yield(accumulator, elem) }
    accumulator
  end

  def my_map
    result = []
    my_each { |elem| result << yield(elem) }
    result
  end

  def my_none?
    my_each { |elem| return false if yield(elem) }
    true
  end

  def my_select
    result = []
    my_each { |elem| result << elem if yield(elem) }
    result
  end
end

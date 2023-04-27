# frozen_string_literal: true

module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    length.times do
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    i = 0
    res = []
    length.times do
      res << self[i] if yield(self[i])
      i += 1
    end
    res
  end

  def my_all?
    i = 0
    length.times do
      return false unless yield(self[i])

      i += 1
    end
    true
  end

  def my_any?
    i = 0
    length.times do
      return true if yield(self[i])

      i += 1
    end
    false
  end

  def my_none?
    i = 0
    length.times do
      return false if yield(self[i])

      i += 1
    end
    true
  end

  def my_count
    i = 0
    if block_given?
      count = 0
      length.times do
        count += 1 if yield(self[i])
        i += 1
      end
      return count
    end
    length
  end

  def my_map
    i = 0
    res = []
    length.times do
      res << yield(self[i])
      i += 1
    end
    res
  end

  def my_inject(init)
    i = 0
    length.times do
      init = yield(init, self[i])
      i += 1
    end
    init
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    i = 0

    length.times do
      yield(self[i])
      i += 1
    end
    self
  end
end

class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    @map.each do |kv|
      if kv[0] == key
        kv[1] = value
        return true
      end
    end
    @map << [key, value]
    false
  end

  def lookup(key)
    @map.each do |kv|
      if kv[0] == key
        return kv[1]
      end
    end
    nil
  end

  def remove(key)
    del_idx = nil
    @map.each_with_index do |kv, idx|
      if kv[0] == key
        del_idx = idx
      end
    end
    del_idx && @map.delete_at(del_idx)
  end

  def show
    @map.dup
  end
end

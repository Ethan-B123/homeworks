class LRUCache
  def initialize(size)
    @cache = []
    @size =size
  end

  def count # returns number of elements currently in cache
    @cache.length
  end

  def add(el) # adds element to cache according to LRU principle
    if @cache.include?(el)
      remove(el)
    end
    @cache.push(el)
    @cache.shift if count > @size
  end

  def show # shows the items in the cache, with the LRU item first
    @cache.dup
  end

  private # helper methods go here!
  def remove(el)
    index = @cache.index(el)
    @cache.delete_at(index)
  end
end

require_relative "node"

class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    # if we have a head i.e. list exists , we set the node as the new tail
    if @head
      find_tail.next = Node.new(value)
    # if no list we set the value as the head
    else
      @head = Node.new(value)
    end
  end

  def find_tail
    node = @head
    # returns the head if there is no tail
    return node unless node.next
    # loops through node until the next node doesnt exits therefore it is tail and returns it
    return node unless node.next while (node = node.next)
  end

  def append_after(target, value)
    # first look for the target value
    node = find(target)
    # return if it doesnt exist
    return unless node
    # track the old next node
    old_next = node.next
    # create a new next node for the target using the value
    node.next = Node.new(value)
    # reconnect the old node to the end of the new one
    node.next.next = old_next
  end

  def find(value)
    node = @head
    # return false if there is only the head
    return false unless node.next
    # return the head if it matches the required value
    return node if node.value == value
    # loop  through list and return the node when we find the value
    while (node = node.next)
      return node if node.value == value
    end
  end

  def delete(value)
    # if the head is the one to be deleted set the head to be the value next to the head
    if @head.value == value
      @head = @head.next
      return
    end
    # re assign the nodes
    node = find_before(value)
    node.next = node.next.next
  end

  def find_before(value)
    node = @head
    # return false if there is no next node
    return false unless node.next
    # return the previous node if the next node matches the required value
    return node if node.next.value == value

    # loops through nodes and checks next value to return the node before
    while (node = node.next)
      return node if node.next && node.next.value == value
    end
  end

  def print
    node = @head
    puts node

    while (node = node.next)
      puts node
    end
  end
end

# list = LinkedList.new

# list.append(10)
# list.append(20)
# list.append(30)

# list.append_after(10, 15)
# list.append_after(20, 25)

# list.print

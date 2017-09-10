class Node
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end

  def children
    [@left, @right].compact #return array with nil values removed
  end
end

class BinarySearchTree
  attr_accessor :head

  def initialize(val)
    @head = Node.new(val)
  end

  def insert(val)
    current = @head

    while !current.nil?
      if val <= current.val && current.left.nil?
        current = current.left
      elsif val > current.val && current.right.nil?
        current = current.right
      end
    end

    current = Node.new(val)
  end

  def collect_nodes
    #begin dfs traversal with current as head and no previous visited nodes
    nodes = dfs_traversal(@head, [])
    return nodes
  end

  def dfs_traversal(node, nodes)
    nodes.push(node)
    node.children.each do |child|
      dfs_traversal(child)
    end
  end

  # def dfs_search(val)
  # end

  def delete(val)
    #search for value
    #remove node
    #rearrange nodes
  end
end

bst = BinarySearchTree.new(0)
bst.insert(1)
bst.insert(2)
bst.insert(3)
bst.insert(4)
bst.insert(5)
print bst.collect_nodes.length
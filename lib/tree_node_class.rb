class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val 
    @left, @right = nil, nil
    @result = []
  end
  
  def binary_tree_path(root, value = root.val)
    arr = check_for_branch(root)
    fill_results(arr, value, root)
  end

  def check_for_branch(root)
    arr = []
    arr.push(root.left) if root.left
    arr.push(root.right) if root.right
    arr
  end

  def fill_results(arr, value, root)
    @result.push(value) unless root.left || root.right
    arr.each do |i|
      binary_tree_path(i, value.to_s + '->' + i.val.to_s)
    end
    @result
  end
end

# root = TreeNode.new(10)
# l14 = root.left = TreeNode.new(14)
# r17 = root.right = TreeNode.new(17)
# r61 = l14.right = TreeNode.new(61)
# l65 = l14.left = TreeNode.new(65)
# l31 = r61.left = TreeNode.new(31)
# r35 = r61.right = TreeNode.new(35)
# r49 = r35.right = TreeNode.new(49)
# l65 = r35.left = TreeNode.new(65)
# p root.binary_tree_path(root)
# p r61.binary_tree_path(r61)
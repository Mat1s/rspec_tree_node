require_relative '../lib/tree_node_class'
RSpec.describe TreeNode do
  context 'when created all leaf,' do
    let(:root) { TreeNode.new(31) }
    let(:left1) { TreeNode.new(1) }
    let(:right3) { TreeNode.new(3) }
    let(:lleft4) { TreeNode.new(4) }
    
    before do 
      root.left = left1
      root.right = right3
      left1.left = lleft4
    end
    
    it 'render all leafs from node root' do
      expect(root.binary_tree_path(root)).to eq(["31->1->4", "31->3"])
    end

    it 'render leaf from node left1' do
      expect(left1.binary_tree_path(left1)).to eq(["1->4"])
    end
  end

  context 'when created all leaf,' do
    let(:root_true) { TreeNode.new(3) }
    let(:root_false) { TreeNode.new() }
    
    it 'render if not other leaf and nodes' do
      expect(root_true.binary_tree_path(root_true)).to eq([3])
    end
    
    it 'render root node if not given params in method #binary_tree_path()' do
      expect(root_false.binary_tree_path()).to eq([10])
    end
  end
end
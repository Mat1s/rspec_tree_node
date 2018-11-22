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
    	expect(0).to eq(1)
      #expect(left1.binary_tree_path(left1)).to eq(["1->4"])
    end
  end
end
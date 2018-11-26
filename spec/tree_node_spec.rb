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

    context 'run #binary_tree_path()' do
      it 'render all leafs from node root' do
        res = root.binary_tree_path(root)
        expect(res).to eq(['31->1->4', '31->3'])
      end

      it 'render leaf from node left1' do
        res = left1.binary_tree_path(left1)
        expect(res).to eq(['1->4'])
      end
    end

    context 'run #check_for_branch()' do
      let(:res_root) { root.check_for_branch(root) }

      it 'return array.length of class > 1' do
        expect(res_root.length).to be > 1
      end

      it 'return array of type class' do
        expect(res_root[0].class).to_not be_an_instance_of(String)
      end

      it 'return array of type class' do
        expect(res_root[0].class).to be_an_instance_of(Class)
      end

      it 'return [] when it hasn\'t nested class' do
        res_right3 = right3.check_for_branch(right3)
        expect(res_right3).to match_array([])
      end
    end

    context 'run #fill_results()' do
      let(:arr_root) { root.check_for_branch(root) }
      let(:arr_right3) { right3.check_for_branch(right3) }

      it 'return a right result of array from branch right3' do
        final = right3.fill_results(arr_right3, right3.val, right3)
        expect(final).to match_array(['3'])
      end

      it 'return a right result of array' do
        final = right3.fill_results(arr_right3, right3.val, right3)
        expect(final).to_not match_array([2])
      end

      it 'return a right result of array from root' do
        final = root.fill_results(arr_root, root.val, root)
        expect(final).to match_array(['31->1->4', '31->3'])
      end
    end
  end

  context 'when no created any leaf,' do
    let(:root_true) { TreeNode.new(3) }

    it 'render if not other leaf and nodes' do
      res = root_true.binary_tree_path(root_true)
      expect(res).to eq(['3'])
    end
  end
end

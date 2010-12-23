require 'test_helper'
class ExtensionsTest < Test::Unit::TestCase
  context 'float' do
    setup do
      @float = 1.123456789
    end
    should 'round of at 0' do
      assert_equal 1, @float.round_to_places(0)
    end
    should 'round of at 1' do
      assert_equal 1.1, @float.round_to_places(1)
    end
    should 'round of at 2' do
      assert_equal 1.12, @float.round_to_places(2)
    end
  end
end
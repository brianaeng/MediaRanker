require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "A Book should have a title" do
    assert_not books(:book2).valid? "A book without a title is invalid"
    books(:book2).title = "Title"
    assert books(:book2).valid? "For some reason the title is not valid"
  end
end

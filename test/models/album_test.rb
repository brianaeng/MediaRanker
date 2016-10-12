require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "An Album should have a title" do
    assert_not albums(:album2).valid? "An album without a title is invalid"
    albums(:album2).title = "Title"
    assert albums(:album2).valid? "For some reason the title is not valid"
  end
end

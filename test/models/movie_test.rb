require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "A Movie should have a title" do
    assert_not movies(:movie2).valid? "A book without a title is invalid"
    movies(:movie2).title = "Title"
    assert movies(:movie2).valid? "For some reason the title is not valid"
  end
end

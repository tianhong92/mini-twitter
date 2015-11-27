# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  message    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  test "should not save post without message" do
    post=Post.new
    assert_not post.save, "save without a message"
  end
  test "should save post with message" do
    assert posts(:one).save
  end
end

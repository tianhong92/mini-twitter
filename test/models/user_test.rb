# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  email             :string
#  first_name        :string
#  last_name         :string
#  crypted_password  :string(128)      default(""), not null
#  password_salt     :string(128)      default(""), not null
#  persistence_token :string
#  login_count       :integer          default(0)
#  last_request_at   :datetime
#  current_login_at  :datetime
#  last_login_at     :datetime
#  current_login_ip  :string
#  last_login_ip     :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save post without email" do
    user=User.new
    assert_not user.save, "save without a email, first_name, last_name"
  end
  test "should save user" do
    assert users(:ben).save
  end
end

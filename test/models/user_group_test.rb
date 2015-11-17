# == Schema Information
#
# Table name: user_groups
#
#  id           :integer          not null, primary key
#  name         :string
#  description  :text
#  is_an_admin  :boolean
#  is_a_manager :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class UserGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

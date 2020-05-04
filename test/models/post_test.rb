# == Schema Information
#
# Table name: posts
#
#  id             :bigint           not null, primary key
#  title          :string           not null
#  url            :string
#  content        :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  post_author_id :integer
#
require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

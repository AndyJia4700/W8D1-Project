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
class Post < ApplicationRecord
    validates :title, presence: true

    belongs_to :user, 
    class_name: "User", 
    foreign_key: "post_author_id"

    has_many :sub_ids,
    foreign_key: :post_id,
    class_name: "PostSubJoin",
    inverse_of: :post

    # Post.first.sub_ids.post
end

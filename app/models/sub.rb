# == Schema Information
#
# Table name: subs
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  description :text             not null
#  author_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Sub < ApplicationRecord
    validates :title, :description, presence: true, uniqueness: true

    belongs_to :moderator, 
    class_name: "User", 
    foreign_key: "author_id"

    has_many :post_ids,
    foreign_key: :sub_id,
    class_name: "PostSubJoin"

end

# cat, user
# toy, postable
# tag, subable_id, subable_type



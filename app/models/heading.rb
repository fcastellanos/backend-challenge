class Heading < ApplicationRecord
  include PgSearch::Model

  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true

  multisearchable(
    against: :content,
    additional_attributes: -> (heading) { { user_id: heading.user_id } }
  )
end

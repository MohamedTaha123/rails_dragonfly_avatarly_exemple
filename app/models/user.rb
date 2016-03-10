class User < ActiveRecord::Base
  has_attached_file :avatar, styles: { thumb: '250x250#' }

  validates :first_name, presence: true
  validates_attachment :avatar,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end

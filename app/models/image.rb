class Image < ActiveRecord::Base

  belongs_to :product
  has_attached_file :image1
  validates_attachment_content_type :image1, :content_type => /\Aimage\/.*\Z/
end

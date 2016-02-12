class Image < ActiveRecord::Base

  belongs_to :product
  has_attached_file :image1, :s3_protocol => :https
  has_attached_file :image2, :s3_protocol => :https
  has_attached_file :image3, :s3_protocol => :https
  has_attached_file :image4, :s3_protocol => :https

  validates_attachment_content_type :image1,:image2, :image3,
  :image4,  :content_type => /\Aimage\/.*\Z/
  validates :image1, :image2, :image3, :image4, :presence => true

end

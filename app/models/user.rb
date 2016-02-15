class User < ActiveRecord::Base
  has_secure_password
  has_many :products

  before_save :to_lower
  before_create :to_lower

  def to_lower
    self.username = self.username.downcase
  end
end

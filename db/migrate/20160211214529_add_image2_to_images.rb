class AddImage2ToImages < ActiveRecord::Migration
  def self.up
    add_attachment :images, :image2
  end

  def self.down
    remove_attachment :images, :image2
  end
end

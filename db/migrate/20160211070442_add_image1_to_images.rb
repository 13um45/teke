class AddImage1ToImages < ActiveRecord::Migration
  def self.up
    add_attachment :images, :image1
  end

  def self.down
    remove_attachment :images, :image1
  end
end

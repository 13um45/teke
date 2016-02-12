class AddImage3ToImages < ActiveRecord::Migration
  def self.up
    add_attachment :images, :image3
  end

  def self.down
    remove_attachment :images, :image3
  end
end

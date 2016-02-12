class AddImage4ToImages < ActiveRecord::Migration
  def self.up
    add_attachment :images, :image4
  end

  def self.down
    remove_attachment :images, :image4
  end
end

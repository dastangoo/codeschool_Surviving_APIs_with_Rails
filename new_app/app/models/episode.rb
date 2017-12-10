class Episode < ApplicationRecord
  validates :title, length: { minimum: 10 }
  
  def self.find_unarchived(id)
    find_by!(id: id, archived: false)
  end
  
  def archive
    self.archived = true
    self.save
  end
  
  
end

class Staff < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :title, :bio]

  validates :name, :presence => true, :uniqueness => true
  
  belongs_to :thumbnail, :class_name => 'Image'
  belongs_to :image
end

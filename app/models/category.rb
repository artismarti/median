class Category < ActiveRecord::Base
  attr_accessible :title, :image

  has_many :posts

  has_attached_file :image, styles: {
	  large: "960x320#",
	  medium: "200x100#",
	  thumbnail: "50x50#"
  }

  validates :title, presence: true, uniqueness: true
  validates :image, attachment_presence: true
end

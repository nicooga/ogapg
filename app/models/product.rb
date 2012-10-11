class Product < ActiveRecord::Base
  has_many :properties
  has_one :price
  
  accepts_nested_attributes_for :properties
  accepts_nested_attributes_for :price

  attr_accessible :name, :category, :description, :image
  
#   mount_uploader :image, ImageUploader
  
  CATEGORIES= %w( Folletos Tarjetas\ Personales Imanes Stickers Gigantografias Banners )
end

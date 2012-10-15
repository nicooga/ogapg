class Product < ActiveRecord::Base
  has_many :properties, :dependent => :destroy
  has_many :prices, :dependent => :destroy
  
  accepts_nested_attributes_for :prices, :properties, :allow_destroy => :destroy

  attr_accessible :name, :category, :description, :image, :prices_attributes, :properties_attributes
  
  mount_uploader :image, ImageUploader
  
  validates_presence_of :name, :category, :description, :image
  
  CATEGORIES= %w( Folletos Tarjetas\ Personales Imanes Stickers Gigantografias Banners )
end

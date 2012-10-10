class Property < ActiveRecord::Base
  belongs_to :product
  attr_accessible :name, :value
end

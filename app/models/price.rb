class Price < ActiveRecord::Base
  belongs_to :product
  
  attr_accessible :quantity, :amount
  
  validates_presence_of :amount, :quantity
  validates :quantity, :numericality => { :only_integer => true }
  validates :amount, :numericality => { :only_integer => true }
end

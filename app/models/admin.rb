class Admin < ActiveRecord::Base
  attr_accessible :email, :name, :password, :surname
end

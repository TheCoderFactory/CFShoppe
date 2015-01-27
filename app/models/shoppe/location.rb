module Shoppe
  class Location < ActiveRecord::Base
  	has_many :products, class_name: "Shoppe:Product"

  	
  end
end

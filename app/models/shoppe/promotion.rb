module Shoppe
  class Promotion < ActiveRecord::Base

  	belongs_to :user, class_name: 'Shoppe::User'

  	def is_valid?
  		number_used.to_i < usage_limit && expiry_date >= Date.today && start_date <= Date.today
  	end

  	def promo_code_redeemed
  		update_attributes(used_date: Date.today, number_used: number_used.to_i + 1)
  	end
  end
end

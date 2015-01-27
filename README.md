# Shoppe

Shoppe is an Rails-based e-commerce platform which allows you to easily introduce a
catalogue-based store into your Rails 4 applications. 

![GemVersion](https://badge.fury.io/rb/shoppe.png)
[![Code Climate](https://codeclimate.com/github/tryshoppe/core/badges/gpa.svg)](https://codeclimate.com/github/tryshoppe/core)
[![Build Status](https://travis-ci.org/tryshoppe/core.svg?branch=master)](https://travis-ci.org/tryshoppe/core)

* [Check out the website](http://tryshoppe.com)
* [View the demo site](http://demo.tryshoppe.com)
* [Check out the demo site source](http://github.com/tryshoppe/example-store)
* [Read the release notes](https://github.com/tryshoppe/core/blob/master/CHANGELOG.md)
* [Read API documentation](http://api.tryshoppe.com)

## Features

* An attractive & easy to use admin interface with integrated authentication
* Full product/catalogue management
* Stock control
* Tax management
* Flexible & customisable order flow
* Delivery/shipping control, management & weight-based calculation

## Getting Started

Shoppe provides the core framework for the store and you're responsible for creating
the storefront which your customers will use to purchase products. In addition to
creating the UI for the frontend, you are also responsible for integrating with whatever
payment gateway takes your fancy.

### Installing into a new Rails application

To get up and running with Shoppe in a new Rails application is simple. Just follow the
instructions below and you'll be up and running in minutes.

    rails new my_store
    cd my_store
    echo "gem 'shoppe', '~> 1.0'" >> Gemfile
    bundle
    rails generate shoppe:setup
    rails generate nifty:attachments:migration
    rails generate nifty:key_value_store:migration
    rake db:migrate shoppe:setup
    rails server

## Contribution

If you'd like to help with this project, please get in touch with me. The best place is on
Twitter (@adamcooke) or by e-mail to adam@atechmedia.com.

## License

Shoppe is licenced under the MIT license. Full details can be found in the MIT-LICENSE
file in the root of the repository.

## Add to app application_controller:
''''
	before_action :capture_promotion_code

  # Returns the active order for this session
  def current_order
    @current_order ||= begin
      if has_order?
        @current_order
      else
        order = Shoppe::Order.create(:ip_address => request.ip, :billing_country => Shoppe::Country.where(:name => "Australia").first)
        session[:order_id] = order.id
        order
      end
    end
  end
  
  # Has an active order?
  def has_order?
    session[:order_id] && @current_order = Shoppe::Order.includes(:order_items => :ordered_item).find_by_id(session[:order_id])
  end

  
 	helper_method :current_order, :has_order?, :promotion_value

	def capture_promotion_code
  	session[:promo_code] = params[:promo_code] if params[:promo_code]
    @promotion = Shoppe::Promotion.find_by(code: session[:promo_code])
  end

  def promotion_value
  	if @promotion.is_valid?
  		@promotion.value
  	else
  		0
  	end
  end
''''
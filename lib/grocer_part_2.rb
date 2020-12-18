require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  hash = {}
  coupon_cart = []
  if coupons 
    coupons.each do |coupon|
      cart.collect do |item|
        coupon[:item] == item[:item]
      end
      
      coupon_applier(cart, coupons)
          hash[:item] = "#{coupon[:item]} W/COUPON"
          hash[:count] = coupon[:num]
          hash[:clearance] = item[:clearance]
          hash[:price] = coupon[:cost] / coupon[:num]
          item[:count] -= coupon[:num]
          
          end
      end    
      end
  end
  coupon_cart
end


def apply_clearance(cart)
  clearance_cart = []  
  new_cart = consolidate_cart(cart).each do |item|
    if item[:clearance]
      item[:price] -= item[:price] * 0.2
    end
      clearance_cart << item
    end
  clearance_cart
end

def checkout(cart, coupons)
 sub_cart = []
 new_cart = []
 consolidated_cart = consolidate_cart(cart)
 consolidated_cart.map do |item|
    if item[:clearance] == "false"
    new_cart << item[:price]
    
 end

 #new_cart << apply_coupons(consolidated_cart, coupons)
 #binding.pry
 apply_clearance(cart).each do |item|
    
  # new_cart << item[:price]
   #binding.pry
  end 
 
   total = new_cart.sum
    if total > 100
      total -= total * 0.1 
  end
  total
 end
   
   
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers

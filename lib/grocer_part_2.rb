require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  cart.each do |item|
    coupons.each do |coupon|
      if coupon[:item] == item[:item]
        hash = {item: "#{item[:item]} W/COUPON", price: coupon[:cost]/coupon[:num], count: coupon[:num], clearance: item[:clearance] }
        item[:count] -= coupon[:num]
        cart << hash
      end
    end
  end
end

def apply_clearance(cart)
  new_cart = []
  cart.map do |item|
    if item[:clearance]
      item[:price] *= 0.8
    end
    new_cart << item
  end
  new_cart
end

def checkout(cart, coupons)
  subtotal = consolidate_cart(cart).map {|cart| cart[:price]}.sum
  coupon_cart = apply_coupons(cart, coupons).map {|cart| cart[:price]}.sum
  clearance_cart = apply_clearance(cart).map {|cart| cart[:price]}.sum
  
  
  
end


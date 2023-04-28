# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Spree::Core::Engine.load_seed
Spree::Auth::Engine.load_seed

# frozen_string_literal: true

require 'thor'
shell = Thor::Base.shell.new

%w(
  stores
  store_credit
  countries
  return_reasons
  states
  stock_locations
  zones
  refund_reasons
  roles
  shipping_categories
).each do |seed|
  shell.say_status :seed, seed
  require_relative "default/spree/#{seed}"
end

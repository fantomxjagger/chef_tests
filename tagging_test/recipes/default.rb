# frozen_string_literal: true

#
# Cookbook Name:: tagging_test
# Recipes:: default
#
#
#

tag('tagaroo')
tag('production') if node.chef_environment == 'production'
tag('test') unless node.chef_environment == 'production'

gateways = node['tagging_test']['p_default_gateways']
gateways.each do |gateway|
  tag('p') if node['network']['default_gateway'] == gateway
  untag('nonp') if node['network']['default_gateway'] == gateway
  tag('nonp') unless tagged?('p')
end

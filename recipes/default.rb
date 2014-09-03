#
# Cookbook Name:: compass
# Recipe:: default
#

package 'rubygems'

execute 'Update Gems' do
  command 'gem update --system'
  action :run
end

execute 'Install Sass' do
  command 'gem install sass'
  action :run
  not_if 'which sass'
end

execute 'Install Compass' do
  command 'gem install compass'
  action :run
  not_if 'which compass'
end

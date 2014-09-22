#
# Cookbook Name:: compass
# Recipe:: default
#

package 'ruby'
package 'ruby-dev'

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

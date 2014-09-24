#
# Cookbook Name:: compass
# Resource:: project
#

actions :compile

default_action :compile

attribute :name, kind_of: String, name_attribute: true
attribute :path, kind_of: String, default: nil
attribute :environment, kind_of: String, default: nil
attribute :user, kind_of: String, default: 'root'

def path(arg = nil)
  if arg.nil? && @path.nil?
    set_or_return(:path, @name, kind_of: String)
  else
    set_or_return(:path, arg, kind_of: String)
  end
end

def environment(arg = nil)
  unless arg.nil? && @environment.nil?
    set_or_return(:environment, arg, kind_of: String)
    return
  end
  if node.chef_environment == 'production'
    set_or_return(:environment, node.chef_environment, kind_of: String)
  else
    set_or_return(:environment, 'development', kind_of: String)
  end
end

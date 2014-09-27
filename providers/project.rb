#
# Cookbook Name:: compass
# Provider:: project
#

def whyrun_supported?
  true
end

action :compile do
  unless ::File.exist?(new_resource.path)
    Chef::Log.warn "#{@new_resource} doesn't exist at '#{new_resource.path}'."
    return
  end

  execute "Compile #{new_resource.name} with Compass" do
    command "compass compile -q -e #{new_resource.environment} #{new_resource.path}" # rubocop:disable LineLength
    user new_resource.user
    action :run
  end

end

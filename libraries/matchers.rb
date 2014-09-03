if defined?(ChefSpec)
  def compile_compass_project(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(
      :compass_project, :compile, resource_name
    )
  end
end

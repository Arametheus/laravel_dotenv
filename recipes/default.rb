#chef 11
#node[:deploy].each do |application, deploy|
  # write out .env file
#  template "#{deploy[:deploy_to]}/current/.env" do
#    source 'env.erb'
#    mode '0660'
#    user deploy[:user]
#    group deploy[:group]
#    variables(
#      :env => deploy[:environment_variables]
#    )
#  end
#end

#chef12
search("aws_opsworks_app").each do |app|
    # write out .env file
  template "/srv/www/#{app[:shortname]}/current/.env" do
    source 'env.erb'
    mode '0660'
    user 'deploy'
    group 'apache'
    variables(
      :env => app[:environment]
    )
  end
end

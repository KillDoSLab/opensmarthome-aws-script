node[:deploy].each do |app_name, deploy|

  template "mongodb:set yum" do
  	path value_fro_platform( 'default' => '/etc/yum.repos.d/mongodb.repo' )
  	source 'mongodb.repo.erb'
  	backup false
  	owner 'root'
  	group 'root'
  	mode 0644
  end
  
  script "install mongodb" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    yum -y install mongodb-org
    EOH
  end
  
  script "set chkconfig" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    chkconfig mongod on
    EOH
  end
  
  template "mongodb:set yum" do
  	path value_fro_platform( 'default' => '/etc/mongod.conf' )
  	source 'mongod.conf.erb'
  	backup false
  	owner 'root'
  	group 'root'
  	mode 0644
  end
end
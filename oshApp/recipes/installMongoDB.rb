node[:deploy].each do |app_name, deploy|

  template "/etc/yum.repos.d/mongodb.repo" do
  	source 'mongodb.repo.erb'
  	backup false
  	owner 'root'
  	group 'root'
  	mode 0644
  end
  
end

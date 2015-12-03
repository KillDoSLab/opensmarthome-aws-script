node[:deploy].each do |app_name, deploy|
  cookbook_file "/etc/yum.repos.d/mongodb.repo" do
    	source 'mongodb.repo.erb'
    	owner 'root'
    	group 'root'
    	mode 0644
  end
  
  script "install mongodb" do
      interpreter "bash"
      user "root"
      cwd "#{deploy[:deploy_to]}/current"
      code"yum -y install mongodb-org"
      
  end
end

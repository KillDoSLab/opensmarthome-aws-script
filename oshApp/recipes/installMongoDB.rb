node[:deploy].each do |app_name, deploy|
  cookbook_file "/etc/yum.repos.d/mongodb.repo" do
    	source 'mongodb.repo.erb'
    	owner 'root'
    	group 'root'
    	mode 0644
  end
  
  yum_package 'mongodb-org' do 
  end
  
end

cookbook_file "/etc/yum.repos.d/mongodb.repo" do
  	source 'mongodb.repo.erb'
  	owner 'root'
  	group 'root'
  	mode 0644
end

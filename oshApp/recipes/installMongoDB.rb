cookbook_file "/etc/yum.repos.d/mongodb.repo" do
    	source 'mongodb.repo.erb'
    	owner 'root'
    	group 'root'
    	mode 0644
end

package 'mongodb-org' do
    action :install
end

script "set chkconfig" do
    interpreter "bash"
    user "root"
    cwd "/tmp"
    code <<-EOH
    chkconfig mongod on
    EOH
end

cookbook_file "/etc/mongod.conf" do
  	source 'mongod.conf.erb'
  	owner 'root'
    group 'root'
end

script "service restart" do
    interpreter "bash"
    user "root"
    cwd "/tmp"
    code <<-EOH
    service mongod restart
    EOH
end

package 'php-pear' do
    action :install
end

package 'php-devel' do
    action :install
end

script "service restart" do
    interpreter "bash"
    user "root"
    cwd "/tmp"
    code <<-EOH
    pecl install mongo
    EOH
end

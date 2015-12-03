package 'nodejs' do
    action :install
end

package 'npm' do
    action :install
end

script "update new version" do
    interpreter "bash"
    user "root"
    cwd "/tmp"
    code <<-EOH
    npm cache clean -f
    npm install -g n
    n stable
    npm update npm -g
    npm install pm2 -g
    wget http://people.centos.org/tru/devtools-2/devtools-2.repo -O /etc/yum.repos.d/devtools-2.repo
    yum -y install devtoolset-2-gcc devtoolset-2-binutils devtoolset-2-gcc-c++
    ln -s /opt/rh/devtoolset-2/root/usr/bin/* /usr/local/bin
    hash -r
    
    EOH
end

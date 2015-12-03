package "install node js" do
    package_name ["nodejs", "npm"]
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
    EOH
end


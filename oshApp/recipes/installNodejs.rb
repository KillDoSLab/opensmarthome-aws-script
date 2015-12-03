package ['nodejs','npm'] do
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


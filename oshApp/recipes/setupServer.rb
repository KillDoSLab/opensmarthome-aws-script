node[:deploy].each do |app_name, deploy|
  script "install_package" do
      interpreter "bash"
      user "root"
      cwd "#{deploy[:deploy_to]}/current"
      code <<-EOH
      npm install
      pm2 start server.js --watch
      EOH
    end
end

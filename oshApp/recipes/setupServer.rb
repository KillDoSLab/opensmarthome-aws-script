node[:deploy].each do |app_name, deploy|
  script "install_package" do
      interpreter "bash"
      user "root"
      cwd "#{deploy[:deploy_to]}/current"
      code <<-EOH
      npm install
      EOH
    end
  
  script "run_Server" do
      interpreter "bash"
      user "root"
      cwd "#{deploy[:deploy_to]}/current"
      code <<-EOH
      pm2 start server.js --watch
      EOH
    end
end

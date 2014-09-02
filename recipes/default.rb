#
# Cookbook Name:: service_restart
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#Method #1
for pkg in [ "httpd", "hwconfig" ] do
service "#{pkg}" do
  service_name "#{pkg}"
  supports :restart => true, :reload => true
  action :restart
  end
end

#Method #2
bash "Restart Services" do
  code <<-EOF
  sudo service httpd restart
  sudo service hwconfig restart
  EOF
end

#Method #3
%w{httpd hwconfig}.each do |servc_name|
  execute "#{servc_name}" do
    command "sudo service '#{servc_name}' restart"
    action :run
  end
end

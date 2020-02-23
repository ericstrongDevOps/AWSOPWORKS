#
# Cookbook Name:: simple_demo
# Recipe:: default
#
# All rights reserved - Do Not Redistribute
#

execute "yum update" do
    command "yum update"
end

package "apache2" do
    action :install
end

service "apache2" do
    action [:start, :enable]
end

cookbook_file "/var/www/html/index.html" do
    source "index.html"
    mode "0644"
end

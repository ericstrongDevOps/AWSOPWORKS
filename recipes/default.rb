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

directory '/home/ec2-user' do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end


file '/home/ec2-user/configurationmanagement' do
    content '<html>This is a placeholder for the home page.</html>'
    mode '0755'
    owner 'web_admin'
    group 'web_admin'
end
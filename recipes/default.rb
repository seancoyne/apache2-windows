#
# Cookbook Name:: apache_win
# Recipe:: default
#
# Copyright 2013, Opscode, Inc.
#
# All rights reserved - Do Not Redistribute
#

# Copy required packages to server
%w{httpd-2.4.4-win32.zip php-5.4.13-win32-vc9-x86.zip vcredist_x86.exe}.each do |p|
  cookbook_file "c:\\#{p}" do
    source p
    action :create
  end
end

# Create required directories
%w{Apache24 PHP}.each do |d|
  directory "c:\\#{d}" do
    action :create
  end
end

# Unzip Apache into c:\Apache2.4
windows_zipfile "c:/" do
  source "c:/httpd-2.4.4-win32.zip"
  action :unzip
  not_if {::File.exists?("c:/Apache24/bin/httpd.exe")}
end

# Unzip PHP to c:\PHP
windows_zipfile "c:/PHP" do
  source "c:/php-5.4.13-win32-vc9-x86.zip"
  action :unzip
  not_if {::File.exists?("c:/PHP/php.ini")}
end

# Install Microsoft VC redistributable
windows_batch "install_ms_vc" do
  code <<-EOH
  c:\\vcredist_x86.exe /q
  EOH
end

# Add PHP directory to system path
windows_path "C:\\PHP" do
  action :add
end

# Create httpd.conf
template "c:\\Apache24\\conf\\httpd.conf" do
  source "httpd.conf"
  action :create
end

# Copy php.ini
cookbook_file "c:\\php\\php.ini" do
  source "php.ini"
  action :create
end

# Install Apache service
windows_batch "install_apache_svc" do
  creates "c:\\apachesvc.log"
  code <<-EOH
  c:\\Apache24\\bin\\httpd -k install
  touch c:\\apachesvc.log"
  EOH
end

# Start apache service
service "Apache2.4" do
  action [ :enable, :start ]
end

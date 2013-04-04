#
# Cookbook Name:: apache_win
# Recipe:: default
#
# Copyright 2013, Opscode, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'vcredist'

distfilename = ::File.basename node['apache2']['windows']['source']
distzipfile = ::File.join(Chef::Config[:file_cache_path],distfilename)

remote_file distzipfile do
  source node['apache2']['windows']['source']
  checksum node['apache2']['windows']['checksum']
end

directory node['apache2']['windows']['path'] do
  action :create
end

windows_zipfile node['apache2']['windows']['path'] do
  source distzipfile
  action :unzip
  not_if {::File.exists?(::File.join(node['apache2']['windows']['path'],'bin','httpd.exe'))}
end

template ::File.join(node['apache2']['windows']['path'],'conf','httpd.conf') do
  source "httpd.conf"
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

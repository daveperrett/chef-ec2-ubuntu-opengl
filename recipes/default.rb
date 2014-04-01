#
# Cookbook Name:: chef-ec2-ubuntu-opengl
# Recipe:: default
#
# Copyright 2014, Dave Perrett
#
# Licensed under http://opensource.org/licenses/MIT
#

include_recipe 'apt'

# Add the x-updates repository.
apt_repository 'ubuntu-x-swat-x-updates-ppa' do
  uri 'http://ppa.launchpad.net/ubuntu-x-swat/x-updates/ubuntu/'
  distribution node['lsb']['codename']
  components ['main']
  keyserver 'keyserver.ubuntu.com'
  key 'AF1CDFA9'
  action :add
  notifies :run, 'execute[apt-get update]', :immediately
end

# Install packages.
PACKAGES = %w(nvidia-current xserver-xorg libglu1-mesa-dev freeglut3-dev mesa-common-dev libxmu-dev libxi-dev)

PACKAGES.each do |package|
  apt_package package do
    action :install
  end
end

execute 'configure nvidia' do
  command 'nvidia-xconfig -a --use-display-device=None --virtual=1280x1024'
  not_if { ::File.exists?('/etc/X11/xorg.conf')}
end
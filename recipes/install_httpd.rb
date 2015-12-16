#---------------------------------------------------------------------------------------------------------------
# Author: Gowrish.Mallipattana
#
# Install httpd
#
#---------------------------------------------------------------------------------------------------------------

# Install httpd software - by calling yum specifically
bash 'install httpd' do
 user "root"
  code <<-EOH
    yum -y install httpd > #{node[:httpdInstallLog]} 2>> #{node[:httpdInstallLog]}
  EOH
end

# If installing from source:  http://www.us.apache.org/dist//httpd/httpd-2.4.18.tar.bz2
# Refer to notes

## Install httpd by using chef rerouce 'package'
#package 'Install Apache' do
#    package_name 'httpd'
#end

#package 'Install Apache' do
#  case node[:platform]
#  when 'redhat', 'centos'
#    package_name 'httpd'
#  when 'ubuntu', 'debian'
#    package_name 'apache2'
#  end
#end

# Start httpd service
bash 'start httpd' do
  user "root"
  code <<-EOH
    sudo service httpd start >> #{node[:httpdInstallLog]} 2>> #{node[:httpdInstallLog]}
  EOH
end

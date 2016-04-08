name 'rotate-passwords'
maintainer 'Danny Roberts'
maintainer_email 'danny@thefallenphoenix.net'
license 'BSD-2-Clause'
description 'Installs/Configures rotate-passwords'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.1'

%w(centos oracle redhat scientific).each do |os|
  supports os, '>= 6.0'
end
supports 'ubuntu', '>= 12.04'
supports 'debian', '>= 7.0'

source_url 'https://github.com/kemra102/rotate-passwords-cookbook' if
  respond_to?(:source_url)
issues_url 'https://github.com/kemra102/rotate-passwords-cookbook/issues' if
  respond_to?(:issues_url)

depends 'chef-vault', '>= 1.2.5'

name 'rotate-passwords'
maintainer 'Sky Betting & Gaming'
maintainer_email 'danny.roberts@skybettingandgaming.com'
license 'BSD-2-Clause'
description 'Installs/Configures rotate-passwords'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.1'

%w(centos oracle redhat scientific).each do |os|
  supports os, '>= 6.0'
end
supports 'ubuntu', '>= 14.04'
supports 'debian', '>= 7.0'

source_url 'https://github.com/skybet/rotate-passwords-cookbook' if
  respond_to?(:source_url)
issues_url 'https://github.com/skybet/rotate-passwords-cookbook/issues' if
  respond_to?(:issues_url)

depends 'chef-vault', '>= 1.2.5'

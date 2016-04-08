resource_name :rotate_password

property :name, [String, Symbol], required: true, name_property: true
property :max_age, Fixnum, required: true, default: 30
property :password_length, Fixnum, required: true, default: 30
property :vault_name, String, required: true, default: 'vault-passwords'
property :vault_admins, [String, Array], required: true

default_action :rotate

def real_name
  name
end

action :rotate do
  include_recipe 'chef-vault::default'

  password = RotatePasswords::Helpers.getpasswd(password_length)

  int_real_name = real_name

  chef_vault_secret "set-password-for-#{int_real_name}" do
    id "#{node['hostname']}-#{int_real_name}"
    data_bag vault_name
    admins vault_admins
    search "name:#{node['name']}"
    raw_data('password' => password)
    action :create
    only_if { RotatePasswords::Helpers.check_age(int_real_name, max_age) }
  end

  user name do
    password password
    action :manage
  end
end

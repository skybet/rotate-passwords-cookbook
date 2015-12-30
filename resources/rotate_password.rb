resource_name :rotate_password

property :name, [String, Symbol], required: true, name_property: true
property :user, String, required: false
property :max_age, Fixnum, required: true, default: 30
property :password_length, Fixnum, required: true, default: 30
property :vault_name, String, required: true, default: 'vault-passwords'
property :vault_admins, [String, Array], required: true

def real_user
  user || name
end

action :rotate do
  # execute real_user do
  #   command RotatePasswords::Helpers.rotate_password(real_user, vault_name, "#{node['name']}")
  #   only_if RotatePasswords::Helpers.check_age(real_user, max_age)
  # end
  include_recipe 'chef-vault::default'

  password = RotatePasswords::Helpers.getpasswd(password_length)

  chef_vault_secret "set password for #{real_user}" do
    id "#{node['name']}-#{real_user}"
    data_bag vault_name
    admins vault_admins
    search "name:#{node['name']}"
    raw_data({'password' => password})
    action :create
    only_if { RotatePasswords::Helpers.check_age(real_user, max_age) }
  end

  user real_user do
    password password
    action :manage
  end
end

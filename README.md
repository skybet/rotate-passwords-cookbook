# rotate-passwords Cookbook
[![Build Status](https://travis-ci.org/kemra102/rotate-passwords-cookbook.svg?branch=master)](https://travis-ci.org/kemra102/rotate-passwords-cookbook)

#### Table of Contents

1. [Overview](#overview)
2. [Requirements](#requirements)
3. [Usage](#usage)
4. [Contributing](#contributing)
5. [License & Authors](#license-and-authors)

## Overview

This cookbook provides a custom resource that allows you to automatically rotate the password for a local user after it has aged past a pre-determined time and store those passwords in Chef Vault.

## Requirements

Requires Chef 12.5 or later as this cookbook makes use of [Custom Resources](https://www.chef.io/blog/2015/10/08/chef-client-12-5-released/).

## Usage

### rotate_password

For each user you want to rotate the password for you must declare a `rotate_password` resource.

Each `rotate_password` has the following attributes:

| Attribute         | Type                 | Description                                                      | Default           |
|:-----------------:|:--------------------:|:----------------------------------------------------------------:|:-----------------:|
| `name`            | `String` or `Symbol` | Resource name.                                                   | `N/A`             |
| `max_age`         | `Integer`            | How old the defined user's password can be before it is rotated. | `30`              |
| `password_length` | `Integer`            | The length of the randomly generated password.                   | `30`              |
| `vault_name`      | `String`             | Name of the Vault passwords should be stored in.                 | `vault-passwords` |
| `vault_admins`    | `String` or `Array`  | A comma seperated string or Array of Vault admins.               | `N/A`             |

To rotate the password of the root user for example:

```ruby
rotate_password 'root' do
  vault_admins ['jbloggs', 'mrossi']
end
```

## Contributing

If you would like to contribute to this cookbook please follow these steps;

1. Fork the repository on Github.
2. Create a named feature branch (like `add_component_x`).
3. Write your change.
4. Write tests for your change (if applicable).
5. Run the tests, ensuring they all pass.
6. Submit a Pull Request using Github.

## License and Authors

License: [BSD 2-clause](https://tldrlegal.com/license/bsd-2-clause-license-\(freebsd\))

Authors:

  * [Danny Roberts](https://github.com/kemra102)
  * [All Contributors](https://github.com/kemra102/yumserver-cookbook/graphs/contributors)

Props to [this cookbook](https://github.com/karthik-altiscale/chef-vault_kitchen_spec) for showing how to use Test Kitchen with Chef Vault.

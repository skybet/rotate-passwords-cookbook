## 2016-04-08 (v1.0.1)
### Summary
Multiple bugfixes and typos in docs.

#### Bugfixes
- Fix typos in attribute descriptions for `roatte_password` in the docs.
- Fix usage of user provided name inside the `rotate_password` resource.
- Fix search to consistently use the `name` node attribute in the `rotate_password` resource.

## 2016-02-10 (v1.0.0)
### Summary
Initial release.

#### Features
- Provides resource for rotating a user's passwords.
 - Can define how old a password can be before it is rotated.
 - Define the length of the randomly generated password.
 - Define the Vault that should be used to store the password.
 - Define the Admins that can access the vaulted password.

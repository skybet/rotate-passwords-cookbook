require 'securerandom'
require 'time'

module RotatePasswords
  # Helper module that does the hard work
  module Helpers
    def self.getpasswd(password_length)
      bytes = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
      plaintext = (0...password_length).map { bytes[rand(bytes.length)] }.join
      plaintext.crypt("$6$#{SecureRandom.hex}")
    end

    def self.check_age(user, max_age)
      today = Time.now.utc.to_date
      days = open('/etc/shadow').grep(/#{user}/).to_s.split(':')[2]
      last_set = Time.parse('1970-01-01').utc.to_date + days.to_i
      age = (today - last_set).to_i
      return true if age > max_age
      false
    end
  end
end

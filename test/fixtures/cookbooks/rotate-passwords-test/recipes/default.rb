ruby_block 'set password age' do
  block do
    require 'tempfile'
    require 'fileutils'

    age = open('/etc/shadow').grep(/root/).to_s.split(':')[2]
    path = '/etc/shadow'
    temp_file = Tempfile.new('shadow')
    begin
      File.open(path, 'r') do |file|
        file.each_line do |line|
          temp_file.puts line.gsub(age, '1')
        end
      end
      temp_file.close
      FileUtils.mv(temp_file.path, path)
    ensure
      temp_file.close
      temp_file.unlink
    end
  end
end

chef_data_bag 'vault-passwords'

rotate_password 'root' do
  vault_admins 'zero-client'
end

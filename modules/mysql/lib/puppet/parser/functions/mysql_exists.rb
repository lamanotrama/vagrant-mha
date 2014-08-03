module Puppet::Parser::Functions
  newfunction(:mysql_exists, :type => :rvalue) do |args|
    ENV["PATH"]="/bin:/sbin:/usr/bin:/usr/sbin"
    system "which mysql >/dev/null 2>&1"
    $?.success?
  end
end

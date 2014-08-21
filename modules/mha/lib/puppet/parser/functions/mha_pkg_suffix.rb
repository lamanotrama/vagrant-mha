module Puppet::Parser::Functions
  newfunction(:mha_pkg_suffix, :type => :rvalue) do
    case lookupvar('osfamily')
    when 'Debian'
      '_all.dev'
    when 'RedHat'
      ".el#{lookupvar('operatingsystemmajrelease')}.noarch.rpm"
    else
      raise 'This Operating Systems is not supported by masterha.'
    end
  end
end

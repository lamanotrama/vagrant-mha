Facter.add('mha_pkg_suffix') do
  setcode do
    case Facter.value(:osfamily)
    when 'Debian'
      '_all.dev'
    when 'RedHat'
      ".el#{Facter.value(:operatingsystemmajrelease)}.noarch.rpm"
    else
      raise 'This Operating Systems is not supported by masterha.'
    end
  end
end

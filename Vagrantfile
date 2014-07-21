# -*- coding: utf-8 -*-
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box     = "CentOS6.5-x86_64"
  config.vm.box_url = "https://s3-ap-northeast-1.amazonaws.com/paperboy-vagrant-boxes/CentOS-6.5-x86_64-minimal.box"
  config.vm.synced_folder ".", "/vagrant"

  config.vm.define :percona1 do |c|
    c.vm.host_name  = "percona1"
    c.ssh.max_tries = 100
    c.vm.customize ["modifyvm", :id, "--memory", "256"]
    c.vm.network :hostonly, "192.168.80.2"

    c.vm.provision :puppet do |puppet|
      puppet.pp_path        = "/tmp/vagrant-puppet"
      puppet.manifests_path = "manifests"
      puppet.module_path    = "modules"
      puppet.manifest_file  = "site.pp"
      puppet.options        = "--verbose"
    end
  end

  config.vm.define :percona2 do |c|
    c.vm.host_name  = "percona2"
    c.ssh.max_tries = 100
    c.vm.customize ["modifyvm", :id, "--memory", "256"]
    c.vm.network :hostonly, "192.168.80.3"

    c.vm.provision :puppet do |puppet|
      puppet.pp_path        = "/tmp/vagrant-puppet"
      puppet.manifests_path = "manifests"
      puppet.module_path    = "modules"
      puppet.manifest_file  = "site.pp"
      puppet.options        = "--verbose"
    end
  end

  config.vm.define :percona3 do |c|
    c.vm.host_name  = "percona3"
    c.ssh.max_tries = 100
    c.vm.customize ["modifyvm", :id, "--memory", "256"]
    c.vm.network :hostonly, "192.168.80.4"

    c.vm.provision :puppet do |puppet|
      puppet.pp_path        = "/tmp/vagrant-puppet"
      puppet.manifests_path = "manifests"
      puppet.module_path    = "modules"
      puppet.manifest_file  = "site.pp"
      puppet.options        = "--verbose"
    end
  end
end

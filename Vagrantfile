ENV["LC_ALL"] = "en_US.UTF-8"

# Required plugin
[
    { :name => "vagrant-vbguest" }, 
    {:name => "vagrant-hostmanager"}
].each do |plugin|
    if not Vagrant.has_plugin?(plugin[:name], plugin[:version])
        raise "#{plugin[:name]} is required. Please run `vagrant plugin install #{plugin[:name]}`"
    end
end


Vagrant.configure("2") do |config|

    Vagrant.require_version ">= 1.9.7"

    os = "bento/ubuntu-17.04"
    
    # vagrant-hostmanager configuration
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.manage_guest = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true

    # master and resources node - used for services, storage etc.
    config.vm.define "saltmaster-res1" do |masternode|
        
        masternode.vm.box = "#{os}"
        
        masternode.vm.host_name = 'saltmaster-res1.local'
        masternode.vm.synced_folder "./saltstack/salt", "/srv/salt", type: "nfs"
        masternode.vm.synced_folder "./saltstack/pillar", "/srv/pillar", type: "nfs"
        masternode.vm.synced_folder "../mnt", "/home/vagrant/mnt", type: "nfs" #for other synchronized files like www data
        masternode.vm.network "private_network", ip: "192.168.56.121"
        masternode.vm.provider "virtualbox" do |v|
            v.memory = 2048
            v.cpus = 2
            v.name = "saltmaster-res1"
        end

        masternode.vm.provision :salt do |salt|
            salt.master_config = "saltstack/etc/master_dev"
            salt.minion_config = "saltstack/etc/minion_res_dev"
            salt.master_key = "devkeys/master.pem"
            salt.master_pub = "devkeys/master.pub"
            salt.minion_key = "devkeys/master.pem"
            salt.minion_pub = "devkeys/master.pub"
            salt.minion_id = "saltmaster-res1"
            salt.seed_master = {
                                "saltmaster-res1" => "devkeys/master.pub",
                                "db-1" => "devkeys/minion.pub"
                               }
    
            salt.install_type = "stable"
            salt.install_master = true
            salt.run_overstate = true
            salt.verbose = true
            salt.colorize = true
            salt.bootstrap_options = "-P -c /tmp "
          end

          
    end 
    

    #db node
    config.vm.define "db-1" do |dbnode|
        
        dbnode.vm.box = "#{os}"
        
        dbnode.vm.host_name = 'db-1.local'
        dbnode.vm.network "private_network", ip: "192.168.56.122"
        dbnode.vm.provider "virtualbox" do |v|
            v.memory = 2048
            v.cpus = 1
            v.name = "db-1"
        end

        dbnode.vm.provision :salt do |salt|
            salt.minion_config = "saltstack/etc/minion_db_dev"
            salt.minion_key = "devkeys/minion.pem"
            salt.minion_pub = "devkeys/minion.pub"
            salt.minion_id = "db-1"
            salt.install_type = "stable"
            salt.verbose = true
            salt.colorize = true
            salt.bootstrap_options = "-P -c /tmp"
          end

    end


end
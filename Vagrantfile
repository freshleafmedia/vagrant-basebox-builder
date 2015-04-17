# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

boxBase = {
    "MyNewBox" =>
        {
            :name => "CentOS-6.5.3-x86_64",
            :url => "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box",
            :checksum => "3c2628e9b07d7b0ec6e1f2738a5ffce180e46568",
            :checksum_type => "sha1"
        }
}

#Set the minimum Vagrant version
Vagrant.require_version ">= 1.6.3"

#build the boxes!
Vagrant.configure("2") do |config|

    boxBase.each do |boxBaseArray|

        #Get the name of the base box
        boxBaseName = boxBaseArray[0].to_s

        boxDef = boxBase[boxBaseName]

        #Define the box
        config.vm.define boxBaseName do |boxConfig|

            #Configure the location and checksum of the base box to use
            boxConfig.vm.box = boxDef[:name]
            boxConfig.vm.box_url = boxDef[:url]
            boxConfig.vm.box_download_checksum = boxDef[:checksum]
            boxConfig.vm.box_download_checksum_type = boxDef[:checksum_type]

            boxConfig.vm.provider :virtualbox do |vb|
                vb.name = boxBaseName
            end

            #Let SSH use insecure keys, at least for the time being...
            #TODO: get Vagrant to work with secure keys
            boxConfig.ssh.insert_key = false

            #Set the location of the provisioner shell script
            boxConfig.vm.provision "shell" do |s|
                s.path = boxBaseName + "/provision/base.sh"
                s.args = boxBaseName
            end
        end
    end
end

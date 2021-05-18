# packer-ubuntu
Ubuntu Focal 20.04 (LTS)

[Ubuntu Releases](https://ubuntu.com/about/release-cycle)

    packer build -force ubuntu.pkr.hcl
    
    vagrant box add ubuntu packer_ubuntu-20-04-LTS_virtualbox.box 

[Install Docker Engine Ubuntu](https://docs.docker.com/engine/install/ubuntu/)

    printf 'packer' | openssl passwd -6 -salt 'FhcddHFVZ7ABA4Gi' -stdin

## References

https://medium.com/@tlhakhan/ubuntu-server-20-04-autoinstall-2e5f772b655a

https://ubuntu.com/server/docs/install/autoinstall

https://github.com/tylert/packer-build/tree/master/source/ubuntu/20.04_focal

https://www.packer.io/docs/builders/virtualbox/iso

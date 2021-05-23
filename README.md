# packer-ubuntu
Ubuntu Focal 20.04 (LTS)

[Ubuntu Releases](https://ubuntu.com/about/release-cycle)

    packer build -force ubuntu.pkr.hcl
    
    vagrant box add ubuntu packer_ubuntu-20-04-LTS_virtualbox.box --force

[Install Docker Engine Ubuntu](https://docs.docker.com/engine/install/ubuntu/)

Note: passing -1 will generate an MD5 password, -5 a SHA256 and -6 SHA512 (recommended)

    printf 'vagrant' | openssl passwd -6 -salt 'FhcddHFVZ7ABA4Gi' -stdin

On macOS (brew installed openssl)

    printf 'vagrant' | /usr/local/Cellar/openssl@1.1/1.1.1j/bin/openssl passwd -6 -salt 'FhcddHFVZ7ABA4Gi' -stdin

Test ansible playbook

    ansible-playbook playbook.yml -i ./hosts --private-key .vagrant/machines/default/virtualbox/private_key

## References

[kubernetes_config_cluster_configuration](https://medium.com/@tlhakhan/ubuntu-server-20-04-autoinstall-2e5f772b655a)

[Ubuntu - Automated Server Installs](https://ubuntu.com/server/docs/install/autoinstall)

https://github.com/tylert/packer-build/tree/master/source/ubuntu/20.04_focal

https://www.packer.io/docs/builders/virtualbox/iso

https://galaxy.ansible.com/geerlingguy/kubernetes

https://docs.docker.com/engine/install/ubuntu/

https://github.com/flannel-io/flannel/blob/master/Documentation/configuration.md

[Ansible - role-kubernetes](https://github.com/geerlingguy/ansible-role-kubernetes)

This command will give you the pod CIDR addresses for each of the nodes in your cluster:

    sudo kubectl get nodes -o jsonpath='{.items[*].spec.podCIDR}'

[Helm - Traefik](https://artifacthub.io/packages/helm/traefik/traefik)

    helm install traefik traefik/traefik -f traefik.yml --dry-run

helm install my-release bitnami/nginx
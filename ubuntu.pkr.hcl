# source blocks configure your builder plugins; your source is then used inside
# build blocks to create resources. A build block runs provisioners and
# post-processors on an instance created by the source.
source "virtualbox-iso" "ubuntu-20-04-LTS" {
    guest_os_type = "Ubuntu_64"
    # https://releases.ubuntu.com/20.04/
    iso_url = "https://releases.ubuntu.com/20.04/ubuntu-20.04.2-live-server-amd64.iso"
    iso_checksum = "sha256:d1f2bf834bbe9bb43faf16f9be992a6f3935e65be0edece1dee2aa6eb1767423"
    ssh_username = "ubuntu"
    ssh_password = "ubuntu"
    shutdown_command = "echo 'ubuntu' | sudo -S shutdown -P now"
    boot_wait = "5s"
    boot_command = [
        "<esc><esc><esc>",
        "<enter><wait>",
        "/casper/vmlinuz ",
        "root=/dev/sr0 ",
        "initrd=/casper/initrd ",
        "autoinstall ",
        "ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
        "<enter>"
    ]
    http_directory = "http"
}

# https://www.packer.io/docs/builders/virtualbox/iso
build {
    sources = ["sources.virtualbox-iso.ubuntu-20-04-LTS"]

    post-processor "vagrant" {
        keep_input_artifact = true
        provider_override = "virtualbox"
    }
}

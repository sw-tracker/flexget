#Maintenance

##Updating Linux

If we get the error that there is not enough space in `/boot`.
Is there enough space in `/boot`?

```
:~$ df -h
Filesystem                   Size  Used Avail Use% Mounted on
udev                         1.9G   12K  1.9G   1% /dev
tmpfs                        385M  1.2M  384M   1% /run
/dev/mapper/ubuntu--vg-root  225G   88G  126G  41% /
none                         4.0K     0  4.0K   0% /sys/fs/cgroup
none                         5.0M     0  5.0M   0% /run/lock
none                         1.9G   16M  1.9G   1% /run/shm
none                         100M   40K  100M   1% /run/user
/dev/sda2                    237M  150M   75M  67% /boot
/dev/sda1                    511M  3.4M  508M   1% /boot/efi
```

If boot is too full we should remove old kernels and update files. This cleans up update files:
```
sudo apt-get clean
```

Lets check how many kernels we have installed:
```
:~$ ls /boot/
abi-3.13.0-24-generic     config-3.13.0-45-generic  initrd.img-3.13.0-24-generic  memtest86+.bin                System.map-3.13.0-71-generic          vmlinuz-3.13.0-53-generic
abi-3.13.0-45-generic     config-3.13.0-53-generic  initrd.img-3.13.0-45-generic  memtest86+.elf                System.map-3.13.0-79-generic          vmlinuz-3.13.0-53-generic.efi.signed
abi-3.13.0-53-generic     config-3.13.0-71-generic  initrd.img-3.13.0-53-generic  memtest86+_multiboot.bin      vmlinuz-3.13.0-24-generic             vmlinuz-3.13.0-71-generic
abi-3.13.0-71-generic     config-3.13.0-79-generic  initrd.img-3.13.0-71-generic  System.map-3.13.0-24-generic  vmlinuz-3.13.0-24-generic.efi.signed  vmlinuz-3.13.0-71-generic.efi.signed
abi-3.13.0-79-generic     efi                       initrd.img-3.13.0-79-generic  System.map-3.13.0-45-generic  vmlinuz-3.13.0-45-generic             vmlinuz-3.13.0-79-generic
config-3.13.0-24-generic  grub                      lost+found                    System.map-3.13.0-53-generic  vmlinuz-3.13.0-45-generic.efi.signed  vmlinuz-3.13.0-79-generic.efi.signed
```

We can see I have too many unused kernels installed: 3.13.0-24 to 3.13.0-71. Lets delete them:
```
:~$ sudo apt-get purge linux-image-3.13.0-24
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Note, selecting 'linux-image-3.13.0-24-generic' for regex 'linux-image-3.13.0-24'
Note, selecting 'linux-image-3.13.0-24-lowlatency' for regex 'linux-image-3.13.0-24'
Package 'linux-image-3.13.0-24-lowlatency' is not installed, so not removed
The following packages will be REMOVED:
  linux-image-3.13.0-24-generic* linux-image-extra-3.13.0-24-generic*
  linux-signed-image-3.13.0-24-generic*
0 upgraded, 0 newly installed, 3 to remove and 86 not upgraded.
After this operation, 193 MB disk space will be freed.
Do you want to continue? [Y/n]
```

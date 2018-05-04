## Install Wizard

1. Choose `Install CentOS 7` option and press enter
2. Select language or click on `Continue`
3. Click on `INSTALLATION DESTINATION`
4. Select the `ATA VBOX HARDDISK` and click on `Done`
5. Click on `Begin Installation`
6. Click on `ROOT PASSWORD`
7. Set `Root Password` and `Confirm` to `root` and double click on `Done`
    - due to short password is required to double click on `Done`
8. Wait until installation will finish
9. Click on `Reboot`
10. After the reboot log into the virtual machine
    - username `root`
    - password `root`
11. Go to `/etc/sysconfig/network-scripts`
    - execute `cd /etc/sysconfig/network-scripts`
12. Open configuration file for network interface
    - execute `ip addr show` and find the network interface name e.g. `enp0s3`
    - open the configuration file `ifcfg-enp0s3` of `enp0s3` via text editor eg `vi`
        - execute `vi ifcfg-enp0s3`
13. Change the last line of file
    - change the `ONBOOT=no` to `ONBOOT=yes`
14. Save and exit and reboot
    - press the escape button
    - write `:x`
    - press enter
    - execute `reboot`
15. The virtual machine is set
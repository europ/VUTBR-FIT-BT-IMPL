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
12. Edit configuration file for two network interfaces
    - execute `ip addr show` and find the two network interface names e.g. `enp0s3` and `enp0s8`
    - edit `enp0s3`
        - open the configuration file `ifcfg-enp0s3` via text editor eg `vi`
            - execute `vi ifcfg-enp0s3`
        - change the last line of file
            - change the `ONBOOT=no` to `ONBOOT=yes`
    - edit `enp0s8`
        - open the configuration file `ifcfg-enp0s8` via text editor eg `vi`
            - execute `vi ifcfg-enp0s8`
        - change the last line of file
            - change the `ONBOOT=no` to `ONBOOT=yes`
13. Save and exit and reboot
    - press the escape button
    - write `:x`
    - press enter
    - execute `reboot`
14. The virtual machine is set.
    - you can connect to the virtual machine from outside
        - search for the IP via executing `ip addr show` in the virtual machine
        - execute `ssh root@192.168.X.X` in host not virtual machine
15. Continue in [README.md](https://github.com/europ/VUTBR-FIT-BT-IMPL/blob/master/README.md)

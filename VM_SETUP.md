## Setup Wizard

1. Run installed `Oracle VM VirtualBox`
2. Click on `New`
3. Customize the virtual machine
    - add name `test`
    - choose type `Linux`
    - choose version `Other Linux (64bit)`
4. Set memory size e.g. `4096` MB
5. Choose `Create a virtual hard disk now` and click on `Create`
6. Choose `VDI (VirtualBox Disk Image)` and press `Next`
7. Choose `Dynamically allocated` and press `Next`
8. Set the size of the virtual hard disk to `30 GB` and click on `Create`
9. Select the `test` virtual machine and click on `Settings`
10. Choose `Storage` option in the left side panel
11. In `Storage Tree` select the `Empty` option
12. In `Attributes` click on the button with CD icon
13. Select the `Choose Virtual Optical Disk File...` and navigate to the downloaded ISO file
    - navigate to `CentOS-7-x86_64-Minimal-1708.iso`
14. Click on `OK`
15. Again select the `test` virtual machine and click on `Settings`
16. Choose `Network` option in the left side panel
17. Select the `Adapter 2` tab
18. Check the box option for `Enable Network Adapter`
19. For `Attached to:` select `Host-only Adapter`
20. Click on `OK`
21. Again select the `test` virtual machine and click on `Start`
22. Follow the instruction in [VM_INSTALL.md](https://github.com/europ/VUTBR-FIT-BT-IMPL/blob/master/VM_INSTALL.md)

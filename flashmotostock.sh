#!/bin/bash
fastboot flash partition gpt.bin
fastboot flash bootloader bootloader.img
fastboot flash logo logo.bin
fastboot flash boot boot.img
fastboot flash recovery recovery.img
fastboot flash system system.img_sparsechunk.0
fastboot flash system system.img_sparsechunk.1
fastboot flash system system.img_sparsechunk.2
fastboot flash system system.img_sparsechunk.3
fastboot flash system system.img_sparsechunk.4
fastboot flash system system.img_sparsechunk.5
fastboot flash system system.img_sparsechunk.6
fastboot flash system system.img_sparsechunk.7
fastboot flash modem NON-HLOS.bin
fastboot erase modemst1
fastboot erase modemst2
fastboot flash fsg fsg.mbn
fastboot erase cache
fastboot erase userdata
fastboot reboot

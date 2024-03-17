# TWRP Device Tree
To download an already built TWRP image, go to [Releases](https://github.com/TBT8A10/android_device_rockchip_rk3368a/releases).

### Known issues
* MTP doesn't work
* `product` partition can't be mounted

### Build process
* Prepare sources
    1. Sync [TWRP Minimal Manifest (`twrp-11` branch)](https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp/tree/twrp-11)
    2. Replace TWRP (`bootable/recovery/`) with [my fork (`android-11` branch)](https://github.com/TBT8A10/android_bootable_recovery/tree/android-11)
    3. Clone [common tree (`twrp-11` branch)](https://github.com/TBT8A10/android_device_rockchip_common/tree/twrp-11) and this tree (twrp-11 branch) into `device/rockchip/`
* Build
    1. `. build/envsetup.sh`
    2. `lunch lineage_rk3368a_Android10-userdebug`
    3. `mka recoveryimage`
* Done! The image should be at `out/target/product/rk3368a_Android10/recovery.img`
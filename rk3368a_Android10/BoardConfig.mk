include device/rockchip/rk3368a/BoardConfig.mk

BOARD_USES_AB_IMAGE := false
BOARD_RECORD_COMMIT_ID := false
BOARD_SENSOR_COMPASS_AK8963-64 := false

ifeq ($(strip $(BOARD_USES_AB_IMAGE)), true)
TARGET_RECOVERY_FSTAB := device/rockchip/rk3368a/rk3368_Android10/fstab.rk30board_AB
endif

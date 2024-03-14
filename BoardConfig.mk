#
# Copyright 2014 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

CURRENT_SDK_VERSION := RK3368_ANDROID10.0_MID_V1.0

TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_SMP := true

TARGET_PREBUILT_KERNEL := device/rockchip/rk3368a/prebuilt/kernel
BOARD_PREBUILT_DTBIMAGE_DIR := device/rockchip/rk3368a/prebuilt/dtbs
# Not sure why, but we need to set this on the common tree
# TARGET_PREBUILT_RESOURCE := device/rockchip/rk3368a/prebuilt/second
PRODUCT_KERNEL_DTS ?= rk3368-tablet
PRODUCT_KERNEL_CONFIG ?= rockchip_defconfig android-10.config
PRODUCT_UBOOT_CONFIG ?= rk3368
PRODUCT_KERNEL_ARCH ?= arm64

PRODUCT_SDMMC_DEVICE ?= ff0c0000.dwmmc
PRODUCT_BOOT_DEVICE ?= ff0f0000.dwmmc,ff400000.nandc

TARGET_BOARD_HARDWARE_EGL := POWERVR_ROGUE

SF_PRIMARY_DISPLAY_ORIENTATION := 0

BOARD_AVB_ENABLE := false

# Disable emulator for "make dist" until there is a 64-bit qemu kernel
BUILD_EMULATOR := false
TARGET_BOARD_PLATFORM := rk3368
TARGET_BOARD_PLATFORM_GPU := G6110
BOARD_USE_DRM := true

# RenderScript
# OVERRIDE_RS_DRIVER := libnvRSDriver.so
BOARD_OVERRIDE_RS_CPU_VARIANT_32 := cortex-a53
BOARD_OVERRIDE_RS_CPU_VARIANT_64 := cortex-a53
# DISABLE_RS_64_BIT_DRIVER := true

TARGET_USES_64_BIT_BCMDHD := true
TARGET_USES_64_BIT_BINDER := true

# HACK: Build apps as 64b for volantis_64_only
ifneq (,$(filter ro.zygote=zygote64, $(PRODUCT_DEFAULT_PROPERTY_OVERRIDES)))
TARGET_PREFER_32_BIT_APPS :=
TARGET_SUPPORTS_64_BIT_APPS := true
endif

# Sensors
BOARD_SENSOR_ST := true
BOARD_SENSOR_MPU_VR := false
BOARD_SENSOR_MPU_PAD := false

BOARD_USES_GENERIC_INVENSENSE := false


ifneq ($(filter %box, $(TARGET_PRODUCT)), )
TARGET_BOARD_PLATFORM_PRODUCT ?= box
else
 ifneq ($(filter %vr, $(TARGET_PRODUCT)), )
   TARGET_BOARD_PLATFORM_PRODUCT ?= vr
else
TARGET_BOARD_PLATFORM_PRODUCT ?= tablet
endif
endif

ENABLE_CPUSETS := true

# Enable Dex compile opt as default
WITH_DEXPREOPT := true

BOARD_NFC_SUPPORT := false
BOARD_HAS_GPS := false

BOARD_GRAVITY_SENSOR_SUPPORT := true
BOARD_COMPASS_SENSOR_SUPPORT := false
BOARD_GYROSCOPE_SENSOR_SUPPORT := false
BOARD_PROXIMITY_SENSOR_SUPPORT := false
BOARD_LIGHT_SENSOR_SUPPORT := false
BOARD_PRESSURE_SENSOR_SUPPORT := false
BOARD_TEMPERATURE_SENSOR_SUPPORT := false
BOARD_USB_HOST_SUPPORT := true

#for optee support
PRODUCT_HAVE_OPTEE ?= true
BOARD_USE_SPARSE_SYSTEM_IMAGE := true

# Google Service and frp overlay
BUILD_WITH_GOOGLE_MARKET := false
BUILD_WITH_GOOGLE_MARKET_ALL := false
BUILD_WITH_GOOGLE_GMS_EXPRESS := false
BUILD_WITH_GOOGLE_FRP := false

# Add widevine L3 support
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 3

# camera enable
BOARD_CAMERA_SUPPORT := true
ALLOW_MISSING_DEPENDENCIES=true

# enable SVELTE malloc
MALLOC_SVELTE := true

#Config omx to support codec type.
BOARD_SUPPORT_VP9 := false
BOARD_SUPPORT_VP6 := false

#for camera autofocus support
CAMERA_SUPPORT_AUTOFOCUS=false

# TWRP
TARGET_SCREEN_WIDTH := 800
TARGET_SCREEN_HEIGHT := 1280
TW_NO_HAPTICS := true
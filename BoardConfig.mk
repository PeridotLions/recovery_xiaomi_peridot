#
# Copyright (C) 2024 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/peridot

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    system \
    product \
    system_ext \
    vendor \
    odm

# Really cool device, VAB + Recovery partition
BOARD_USES_RECOVERY_AS_BOOT := false

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# AVB 2.0
BOARD_AVB_ENABLE := true
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1


# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := peridot
TARGET_USES_UEFI := true
TARGET_NO_BOOTLOADER := true

# Display
TARGET_USES_ION := true
TARGET_USES_NEW_ION := true
TARGET_USES_NEW_ION_API := true
TARGET_USES_SMMU_PROXY := true

USE_OPENGL_RENDERER := true

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_CONFIG := peridot_defconfig
TARGET_KERNEL_SOURCE :=

# Ramdisk compression
BOARD_RAMDISK_USE_LZ4 := true

# Partitions
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := xiaomi_dynamic_partitions
BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    product \
    system_ext \
    vendor \
    odm \
    vendor_dlkm
BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

TARGET_COPY_OUT_VENDOR := vendor

BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x06400000
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_EXT4_SHARE_DUP_BLOCKS := true

# Platform
TARGET_BOARD_PLATFORM := pineapple
BOARD_USES_QCOM_HARDWARE := true

# Props
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/configs/props/system.prop


# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
TARGET_USES_LOGD := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_INCLUDE_REPACKTOOLS := true
TW_MAX_BRIGHTNESS := 200
TW_EXCLUDE_DEFAULT_USB_INIT := true

# OrangeFox configuration
OF_DEFAULT_KEYMASTER_VERSION := 4.1

# HIDL
#DEVICE_FRAMEWORK_MANIFEST_FILE := $(DEVICE_PATH)/configs/hidl/framework_manifest.xml
DEVICE_MANIFEST_FILE := $(LOCAL_PATH)/recovery/root/system/etc/vintg/manifest.xml
#DEVICE_MATRIX_FILE   := hardware/interfaces/compatibility_matrices/compatibility_matrix.8.xml
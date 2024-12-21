#
# Copyright (C) 2024 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# 64bit only device
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# VAB
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

LOCAL_PATH := device/xiaomi/peridot

#API
PRODUCT_SHIPPING_API_LEVEL  := 34

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot-service.qti.recovery

PRODUCT_PACKAGES += \
    bootctrl

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

# FastbootD
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot-service.example_recovery

# Paritions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION  := false

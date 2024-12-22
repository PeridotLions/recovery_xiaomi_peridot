#
# Copyright (C) 2024 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# VAB
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 34

LOCAL_PATH := device/xiaomi/peridot

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

# Crypto
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe
    
PRODUCT_PACKAGES += \
    android.system.keystore2 \
    libbinder_ndk

# Keymint
PRODUCT_PACKAGES += \
    android.hardware.security.keymint \
    android.hardware.security.keymint-ndk_platform \
    android.hardware.security.keymint-V1-ndk_platform \
    android.hardware.security.keymint-service \
    android.hardware.security.keymint-service.trusty \
    android.hardware.security.secureclock \
    android.hardware.security.secureclock-V1-ndk_platform \
    android.hardware.security.sharedsecret \
    android.hardware.keymaster-V3-ndk_platform \
    android.hardware.keymaster@4.1 \
    android.hardware.keymaster@4.0 \
    libkeymint \
    libpuresoftkeymasterdevice


TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_METADATA_PARTITION := true
BOARD_USES_QCOM_FBE_DECRYPTION := true

# FastbootD
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot-service.example_recovery

# Logcat
TWRP_INCLUDE_LOGCAT := true


# Paritions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION  := false

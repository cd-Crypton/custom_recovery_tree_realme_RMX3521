# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
# SPDX-License-Identifier: Apache-2.0

PRODUCT_RELEASE_NAME := RMX3521
PRODUCT_DEVICE := $(PRODUCT_RELEASE_NAME)
PRODUCT_NAME := twrp_$(PRODUCT_RELEASE_NAME)
PRODUCT_BRAND := Realme
PRODUCT_MODEL := Realme 9
PRODUCT_MANUFACTURER := realme

PRODUCT_GMS_CLIENTID_BASE := android-$(PRODUCT_MANUFACTURER)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="$(PRODUCT_RELEASE_NAME)-user 12 RKQ1.211119.001 1666261300680 release-keys"

BUILD_FINGERPRINT := $(PRODUCT_MANUFACTURER)/$(PRODUCT_RELEASE_NAME)/$(PRODUCT_RELEASE_NAME):12/RKQ1.211119.001/1666261300680:user/release-keys

# Inherit from RMX3521 Device
$(call inherit-product, device/$(PRODUCT_BRAND)/$(PRODUCT_RELEASE_NAME)/device.mk)

# Inherit from those products. Most specific first.
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit some common twrp/pb/omni stuff.
$(call inherit-product-if-exists, vendor/twrp/config/common.mk)
$(call inherit-product-if-exists, vendor/pb/config/common.mk)
$(call inherit-product-if-exists, vendor/omni/config/common.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
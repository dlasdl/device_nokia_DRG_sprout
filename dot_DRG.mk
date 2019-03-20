# 
# Copyright (C) 2018 The LineageOS Project
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_n_mr1.mk)

# Inherit from DRG device
$(call inherit-product, device/nokia/DRG/device.mk)

# Inherit some common Dot stuff.
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_GAPPS_ARCH := arm64
$(call inherit-product, vendor/dot/config/common.mk)

# A/B updater
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

# The following modules are included in debuggable builds only.
PRODUCT_PACKAGES_DEBUG += \
    bootctl \
    update_engine_client

# Boot control HAL
PRODUCT_PACKAGES += \
    bootctrl.sdm660

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.sdm660 \
    libcutils \
    libgptutils \
    libz

# Device identifiers
PRODUCT_NAME := dot_DRG
PRODUCT_BRAND := nokia
PRODUCT_DEVICE := DRG
PRODUCT_MANUFACTURER := nokia
PRODUCT_MODEL := Nokia 6.1 Plus

PRODUCT_GMS_CLIENTID_BASE := android-nokia

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE="DRG" \
    PRODUCT_NAME="DRG" \
    PRIVATE_BUILD_DESC="DRG-user 9.0.0 OPN1.121119.012 V8.5.12.0.OELSIFA release-keys"

BUILD_FINGERPRINT := nokia/DRG/DRG:9.0.0/OPN1.121119.012/V8.5.12.0.OELSIFA:user/release-keys

TARGET_VENDOR := nokia
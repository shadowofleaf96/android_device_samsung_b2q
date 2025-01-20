#
# Copyright (C) 2023 The LineageOS Project
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

DEVICE_PATH := device/samsung/b2q

include device/samsung/sm8350-common/BoardConfigCommon.mk

# Kernel
TARGET_KERNEL_CONFIG        := b2q_defconfig
BOARD_NAME                  := SRPUC03A010

# Kernel modules
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load))
BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.recovery))
RECOVERY_KERNEL_MODULES := $(BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD)
TARGET_MODULE_ALIASES += wlan.ko:qca_cld3_wlan.ko

# Recovery
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

# Display
TARGET_SCREEN_DENSITY := 480

# OTA assert
TARGET_OTA_ASSERT_DEVICE := b2q

# Fingerprint
TARGET_SEC_FP_HAS_FINGERPRINT_GESTURES := true

# Security patch
VENDOR_SECURITY_PATCH := 2024-10-20

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Copyright (C) 2014 The Android Open Source Project
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

$(call inherit-product, device/sony/common/common.mk)

SOMC_PLATFORM := lagan

SONY_ROOT := device/sony/lagan/rootdir

# Media
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(SONY_ROOT)/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(SONY_ROOT)/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(SONY_ROOT)/system/etc/media_profiles.xml:system/etc/media_profiles.xml

# Qualcom WiFi
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(SONY_ROOT)/system/etc/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

# Qualcom BT
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh

# IDC
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/usr/idc/clearpad.idc:system/usr/idc/clearpad.idc 

# Keylayout
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/usr/keylayout/apq8064-tabla-snd-card_Button_Jack.kl:system/usr/keylayout/apq8064-tabla-snd-card_Button_Jack.kl \
    $(SONY_ROOT)/system/usr/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
    $(SONY_ROOT)/system/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(SONY_ROOT)/system/usr/keylayout/mhl-rcp.kl:system/usr/keylayout/mhl-rcp.kl

# Device Specific Hardware
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

# Platform Init
PRODUCT_PACKAGES += \
    fstab.lagan \
    init.lagan.pwr

# NFC packages
PRODUCT_PACKAGES += \
    nfc.lagan \
    com.android.nfc_extras \
    libnfc_jni \
    libnfc \
    Nfc

# Audio
PRODUCT_PACKAGES += \
    audio.primary.msm8960

# GFX
PRODUCT_PACKAGES += \
    copybit.msm8960 \
    gralloc.msm8960 \
    hwcomposer.msm8960 \
    memtrack.msm8960
	
#Sensors
PRODUCT_PACKAGES += \
    sensors.default

# GPS
PRODUCT_PACKAGES += \
    gps.msm8960

# CAMERA
PRODUCT_PACKAGES += \
    camera.msm8960

# Keymaster
PRODUCT_PACKAGES += \
    keystore.msm8960

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.bt.hci_transport=smd

# RILD
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/vendor/lib/libril-qc-qmi-1.so \
    rild.libargs=-d /dev/smd0 \
    ril.subscription.types=NV,RUIM

# system prop for opengles version
# 196608 is decimal for 0x30000 to
# report major/minor versions as 3
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608

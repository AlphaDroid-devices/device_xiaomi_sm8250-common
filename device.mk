#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Inherit virtual_ab_ota product
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# A/B
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-service \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio.service.mediatek \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.bluetooth.audio-impl \
    android.hardware.soundtrigger@2.3-impl

PRODUCT_PACKAGES += \
    audio.bluetooth.default \
    audio.primary.default \
    audio.r_submix.default \
    audio.usb.default

PRODUCT_PACKAGES += \
    libshim_audio

PRODUCT_PACKAGES += \
    libalsautils_legacy \
    libtinycompress \
    libtinyxml \
    tinymix

PRODUCT_PACKAGES += \
    MtkInCallService

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_device.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_device.xml \
    $(LOCAL_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/configs/audio/audio_em.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_em.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration_bluetooth_legacy_hal.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_bluetooth_legacy_hal.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/configs/audio/usb_audio_accessory_only_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_accessory_only_policy_configuration.xml

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0.vendor \
    android.hardware.bluetooth@1.1.vendor \
    libbluetooth_audio_session

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.common@1.0.vendor \
    android.hardware.camera.device@3.3.vendor \
    android.hardware.camera.device@3.4.vendor \
    android.hardware.camera.device@3.5.vendor \
    android.hardware.camera.device@3.6.vendor \
    android.hardware.camera.provider@2.4.vendor \
    android.hardware.camera.provider@2.5.vendor \
    android.hardware.camera.provider@2.6.vendor \

PRODUCT_PACKAGES += \
    libdng_sdk.vendor

PRODUCT_PACKAGES += \
    libshim_utils

# Charger
PRODUCT_PACKAGES += \
    libsuspend

PRODUCT_PACKAGES += \
    libshim_showlogo

# Display
TARGET_SCREEN_DENSITY := 440
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4-service.clearkey

PRODUCT_PACKAGES += \
    libmockdrmcryptoplugin

PRODUCT_PACKAGES += \
    android.hardware.drm@1.0.vendor \
    android.hardware.drm@1.1.vendor \
    android.hardware.drm@1.2.vendor \
    android.hardware.drm@1.3.vendor

# Disable SF configstore
PRODUCT_PACKAGES += \
    disable_configstore

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.1-service

PRODUCT_PACKAGES += \
    android.hardware.memtrack-service.mediatek-mali

PRODUCT_PACKAGES += \
    android.hardware.graphics.common@1.2.vendor \
    android.hardware.graphics.mapper@4.0.vendor \
    android.hardware.graphics.allocator@4.0.vendor

PRODUCT_PACKAGES += \
    libdrm.vendor

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.xiaomi

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-goodix.kl

# FM Radio
PRODUCT_PACKAGES += \
    FMRadio

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0.vendor \
    android.hardware.gnss@1.1.vendor \
    android.hardware.gnss@2.0.vendor \
    android.hardware.gnss@2.1.vendor \
    android.hardware.gnss.measurement_corrections@1.0.vendor \
    android.hardware.gnss.measurement_corrections@1.1.vendor \
    android.hardware.gnss.visibility_control@1.0.vendor

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

PRODUCT_PACKAGES += \
    android.hardware.health@2.0

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.allocator@1.0 \
    android.hidl.base@1.0.vendor \
    android.hidl.allocator@1.0.vendor \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder \
    libhwbinder.vendor

# Hotword Enrollment
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/hiddenapi-package-allowlist-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/hotword-hiddenapi-package-allowlist.xml \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# IMS
PRODUCT_BOOT_JARS += \
    mediatek-common \
    mediatek-framework \
    mediatek-ims-base \
    mediatek-ims-common \
    mediatek-telecom-common \
    mediatek-telephony-base \
    mediatek-telephony-common

PRODUCT_PACKAGES += \
    libshim_vtservice

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-com.mediatek.ims.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-com.mediatek.ims.xml
	
# Call recording
PRODUCT_PACKAGES += \
    com.google.android.apps.dialer.call_recording_audio.features.xml

# IR
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.0.vendor

PRODUCT_PACKAGES += \
    libkeymaster4.vendor \
    libkeymaster4support.vendor \
    libpuresoftkeymasterdevice.vendor \
    libsoft_attestation_cert.vendor

PRODUCT_PACKAGES += \
    libshim_beanpod

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.rosemary

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_mediatek_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_mediatek_audio.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_mediatek_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_mediatek_video.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_PATH)/configs/seccomp/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy \
    $(LOCAL_PATH)/configs/seccomp/mediaswcodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaswcodec.policy

# Neural Networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.0.vendor \
    android.hardware.neuralnetworks@1.1.vendor \
    android.hardware.neuralnetworks@1.2.vendor \
    android.hardware.neuralnetworks@1.3.vendor

PRODUCT_PACKAGES += \
    libtextclassifier_hash.vendor

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    libchrome.vendor \
    NfcNci \
    SecureElement \
    Tag \
    android.hardware.nfc@1.0.vendor \
    android.hardware.nfc@1.1.vendor \
    android.hardware.nfc@1.2.vendor \
    android.hardware.secure_element@1.0.vendor \
    android.hardware.secure_element@1.1.vendor \
    android.hardware.secure_element@1.2.vendor

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.se.omapi.ese.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/com.android.nfc_extras.xml

# Pcap
PRODUCT_PACKAGES += \
    libpcap.vendor

# Public libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt
	
# Device-specific settings
PRODUCT_PACKAGES += \
    XiaomiParts

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage \
    $(LOCAL_PATH)/overlay

PRODUCT_ENFORCE_RRO_TARGETS := *

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage \
    $(LOCAL_PATH)/overlay

PRODUCT_PACKAGES += \
    CarrierConfigOverlayRosemary \
    FrameworksResOverlayRosemary \
    SystemUIOverlayRosemary \
    TelephonyOverlayRosemary \
    TetheringConfigOverlayRosemary \
    WifiOverlayRosemary

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.mediatek-libperfmgr

PRODUCT_PACKAGES += \
    libmtkperf_client_vendor \
    libmtkperf_client

PRODUCT_PACKAGES += \
    vendor.mediatek.hardware.mtkpower@1.0.vendor \
    vendor.mediatek.hardware.mtkpower@1.1.vendor \
    vendor.mediatek.hardware.mtkpower@1.2-service.stub

PRODUCT_PACKAGES += \
    android.hardware.power@1.0.vendor \
    android.hardware.power@1.1.vendor \
    android.hardware.power@1.2.vendor \
    android.hardware.power@1.3.vendor

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Properties
include $(LOCAL_PATH)/vendor_logtag.mk

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.faketouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.faketouch.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# Radio
PRODUCT_PACKAGES += \
    android.hardware.radio@1.0.vendor \
    android.hardware.radio@1.1.vendor \
    android.hardware.radio@1.2.vendor \
    android.hardware.radio@1.3.vendor \
    android.hardware.radio@1.4.vendor \
    android.hardware.radio@1.5.vendor \
    android.hardware.radio.config@1.0.vendor \
    android.hardware.radio.config@1.1.vendor \
    android.hardware.radio.config@1.2.vendor \
    android.hardware.radio.deprecated@1.0.vendor \
    android.hardware.radio-V1.4-java

# Rootdir
PRODUCT_PACKAGES += \
    fstab.mt6785 \
    fstab.mt6785.ramdisk \
    init.ago.rc \
    init.connectivity.rc \
    init.modem.rc \
    init.mt6785.rc \
    init.mt6785.usb.rc \
    init.project.rc \
    init.sensor_1_0.rc \
    init.stnfc.rc \
    init.target.rc \
    ueventd.mtk.rc

PRODUCT_PACKAGES += \
    init.recovery.mt6785.rc \
    init.recovery.mt6785.sh

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.1-service.multihal \
    android.hardware.sensors@1.0.vendor \
    android.hardware.sensors@2.0.vendor \
    android.hardware.sensors@2.0-ScopedWakelock.vendor \
    android.frameworks.sensorservice@1.0

PRODUCT_PACKAGES += \
    libsensorndkbridge

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 30

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/google/interfaces \
    hardware/google/pixel \
    hardware/mediatek \
    hardware/xiaomi

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl

PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0.vendor

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.1-service.rosemary

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.rosemary

# VNDK
PRODUCT_PACKAGES += \
    libutils-v32 \
    libhidlbase-v32 \
    libui-v32

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi.supplicant@1.0.vendor \
    android.hardware.wifi.supplicant@1.1.vendor \
    android.hardware.wifi.supplicant@1.2.vendor \
    android.hardware.wifi.supplicant@1.3.vendor \
    android.hardware.wifi.hostapd@1.0.vendor \
    android.hardware.wifi.hostapd@1.1.vendor \
    android.hardware.wifi.hostapd@1.2.vendor

PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service-lazy.rosemary

PRODUCT_PACKAGES += \
    libkeystore-wifi-hidl \
    libkeystore-engine-wifi-hidl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/rosemary/rosemary-vendor.mk)

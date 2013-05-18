# audio
include frameworks/base/data/sounds/NewAudio.mk

# common
$(call inherit-product, vendor/axi0m/config/common.mk)

# gps
PRODUCT_COPY_FILES += \
    vendor/axi0m/prebuilt/common/etc/gps.conf:system/etc/gps.conf

# bluetooth
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf

# ringtones
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Hydra.ogg \
    ro.config.notification_sound=Proxima.ogg \
    ro.config.alarm_alert=Cesium.ogg


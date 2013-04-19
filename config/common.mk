SUPERUSER_EMBEDDED := true

# brand
PRODUCT_BRAND ?= Codex

# overrides general
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# overrides codex
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.nocheckin=1 \
    debug.performance.tuning=1 \
    persist.sys.purgeable_assets=1 \
    ro.ril.disable.power.collapse=0 \
    ro.config.hw_fast_dormancy=1 \
    dalvik.vm.execution-mode=int:jit \
    windowsmgr.max_events_per_sec=512 \
    dalvik.vm.dexopt-flags=m=y,v=n,o=v

# packages
PRODUCT_PACKAGES += \
    Camera \
    DSPManager \
    DashClock \
    LiveWallpapers \
    LiveWallpapersPicker \
    PhotoTable \
    Torch \
    Superuser \
    su

# codex
PRODUCT_PACKAGES += \
    LatinIME \
    Trebuchet \
    LockClock \
    PerformanceControl

# tools
PRODUCT_PACKAGES += \
    CellBroadcastReceiver

PRODUCT_PACKAGES += \
    armzipalign \
    e2fsck \
    mke2fs \
    tune2fs \
    nano
	
# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# themes
include vendor/codex/config/theme_chooser.mk

# overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/codex/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/codex/overlay/common

# bin
PRODUCT_COPY_FILES += \
    vendor/codex/prebuilt/common/bin/sysinit:system/bin/sysinit

# etc
PRODUCT_COPY_FILES += \
    vendor/codex/prebuilt/common/etc/init.codex.rc:root/init.codex.rc

# initd
PRODUCT_COPY_FILES += \
    vendor/codex/prebuilt/common/etc/init.d/01cxbomb:system/etc/init.d/01cxbomb \
    vendor/codex/prebuilt/common/etc/init.d/02cxkernel:system/etc/init.d/02cxkernel \
    vendor/codex/prebuilt/common/etc/init.d/99cxsystem:system/etc/init.d/99cxsystem \
    vendor/codex/prebuilt/common/etc/init.d/05cxfs:system/etc/init.d/05cxfs \
    vendor/codex/prebuilt/common/etc/init.d/91cxzipalign:system/etc/init.d/91cxzipalign

# prebuilt
PRODUCT_COPY_FILES += \
    vendor/codex/prebuilt/common/xbin/sysro:system/xbin/sysro \
    vendor/codex/prebuilt/common/xbin/sysrw:system/xbin/sysrw \
    vendor/codex/prebuilt/common/xbin/zipalign:system/xbin/zipalign \
    vendor/codex/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/codex/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# sip/voip
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# version
RELEASE = false
CODEX_VERSION_MAJOR = 1
CODEX_VERSION_MINOR = 6

ifeq ($(RELEASE),true)
    CODEX_VERSION := "CODEX-4.2.2-v"$(CODEX_VERSION_MAJOR).$(CODEX_VERSION_MINOR)
else
    CODEX_VERSION := "CODEX-4.2.2"-$(shell date +%0d%^b%Y-%H%M%S)
endif

PRODUCT_PROPERTY_OVERRIDES += \
  ro.codex.version=$(CODEX_VERSION)

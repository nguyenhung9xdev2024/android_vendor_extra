# Build system
BUILD_BROKEN_DUP_RULES := true

# Debugging
ifeq ($(WITH_DEBUGGING), true)
PRODUCT_PRODUCT_PROPERTIES += \
    ro.adb.secure=0 \
    persist.sys.usb.config=adb \
    service.adb.root=1
endif
PRODUCT_PACKAGES += \
    iperf3

# Extra
PRODUCT_PACKAGES += \
    extra.rc

# Google Apps
ifeq ($(WITH_GMS), true)
$(call inherit-product, vendor/gapps/common/common-vendor.mk)
endif

# Signing
ifeq ($(SIGN_BUILD), true)
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/certs/releasekey
endif


include $(sort $(wildcard $(BR2_EXTERNAL_CDX_BUILD_PATH)/package/*/*.mk))
include $(sort $(wildcard $(BR2_EXTERNAL_CDX_BUILD_PATH)/package/*/*/*.mk))

# Extra logic - Additional infrastructure.
-include $(BR2_EXTERNAL_CDX_BUILD_PATH)/core/pkg-cdxvirt.mk
-include $(BR2_EXTERNAL_CDX_BUILD_PATH)/core/system.mk
-include $(BR2_EXTERNAL_CDX_BUILD_PATH)/core/system-extra.mk

# Utilize user - defined custom directory.
include $(sort $(wildcard $(BR2_EXTERNAL_CDX_BUILD_PATH)/custom/*.mk))
BR2_GLOBAL_PATCH_DIR += "$(BR2_EXTERNAL_CDX_BUILD_PATH)/package $(BR2_EXTERNAL_CDX_BUILD_PATH)/custom/package $(BR2_EXTERNAL_CDX_BUILD_PATH)/custom/patches"

################################################################################
#
# ramspeed
#
################################################################################
HPMICRO_LOADER_VERSION = 5acfbb3dd810b56ea1e7837b00660c79d8975d9a
HPMICRO_LOADER_SITE = https://github.com/hpmicro/hpm_opensbi_loader.git
HPMICRO_LOADER_SITE_METHOD = git
HPMICRO_LOADER_GIT_SUBMODULES = YES
HPMICRO_LOADER_CMAKE_BACKEND = ninja
HPMICRO_LOADER_SUPPORTS_IN_SOURCE_BUILD = No

HPMICRO_LOADER_CONF_OPTS = -DBOARD=$(BR2_TARGET_HPMICRO_BOARD_NAME) -DHPM_BUILD_TYPE=flash_xip -DCMAKE_BUILD_TYPE=debug -DCMAKE_C_FLAGS="-g" -DCMAKE_EXE_LINKER_FLAGS="" -DCMAKE_SHARED_LINKER_FLAGS="" -DCMAKE_MODULE_LINKER_FLAGS="" 
HPMICRO_LOADER_CONF_ENV = HPM_SDK_BASE=$(@D)/hpm_sdk HPM_SDK_TOOLCHAIN_VARIANT=gcc

define HPMICRO_LOADER_INSTALL_TARGET_CMDS
	dd if=/dev/zero of=$(@D)/buildroot-build/output/temp.bin bs=1 count=1024
	cat $(@D)/buildroot-build/output/temp.bin $(@D)/buildroot-build/output/demo.bin > $(@D)/buildroot-build/output/opensbiloader.bin
	$(INSTALL) -D -m 0644 $(@D)/buildroot-build/output/opensbiloader.bin $(BINARIES_DIR)/opensbiloader.bin
endef

$(eval $(cmake-package))

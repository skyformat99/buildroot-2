################################################################################
#
# axfsutils
#
################################################################################

AXFSUTILS_VERSION = 719ab26ca3e61200adc1d643dc89d494a75ee59f
AXFSUTILS_SITE = $(call github,jaredeh,axfs,$(AXFSUTILS_VERSION))
AXFSUTILS_LICENSE = GPL-2.0
AXFSUTILS_LICENSE_FILES = mkfs.axfs-legacy/COPYING
HOST_AXFSUTILS_DEPENDENCIES = host-zlib

# The 'new' mkfs.axfs version requires GNUstep which is not a buildroot
# prerequisite. The 'legacy' one works just as well without that requirement.
define HOST_AXFSUTILS_BUILD_CMDS
	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/mkfs.axfs-legacy
endef

define HOST_AXFSUTILS_INSTALL_CMDS
	$(INSTALL) -D -m 0755 $(@D)/mkfs.axfs-legacy/mkfs.axfs \
		$(HOST_DIR)/bin/mkfs.axfs
endef

$(eval $(host-generic-package))

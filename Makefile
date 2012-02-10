ifeq ($(shell [ -f ./framework/makefiles/common.mk ] && echo 1 || echo 0),0)
all clean package install::
	git submodule update --init
	./framework/git-submodule-recur.sh init
	$(MAKE) $(MAKEFLAGS) MAKELEVEL=0 $@
else

TWEAK_NAME = NCColors
NCColors_FILES = Tweak.x
NCColors_FRAMEWORKS = UIKit QuartzCore

TARGET_IPHONEOS_DEPLOYMENT_VERSION = 5.0
SDKVERSION=4.2

include framework/makefiles/common.mk
include framework/makefiles/tweak.mk

endif

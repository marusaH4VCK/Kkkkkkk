
ARCHS = arm64 

DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1
TARGET = iphone:clang

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = IGGTables


IGGTables_EXTRA_FRAMEWORKS += 
IGGTables_CCFLAGS = -std=c++11 -fno-rtti -fno-exceptions -DNDEBUG
IGGTables_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value
IGGTables_FILES = IGGView.mm 
IGGTables_LDFLAGS += a.a

include $(THEOS_MAKE_PATH)/tweak.mk
MOONCAKE_PATH ?= ${shell pwd}/base

ASRCS += $(shell find $(MOONCAKE_PATH)/src -type f -name '*.S')
CSRCS += $(shell find $(MOONCAKE_PATH)/src -type f -name '*.c')
CXXEXT := .cpp
CXXSRCS += $(shell find $(MOONCAKE_PATH)/src -type f -name '*${CXXEXT}')

AFLAGS += "-I$(MOONCAKE_PATH)"
CFLAGS += "-I$(MOONCAKE_PATH)"
CXXFLAGS += "-I$(MOONCAKE_PATH)"

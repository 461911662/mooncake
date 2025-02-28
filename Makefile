############################################################################
# apps/watch-ui/apps/base/Makefile
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.  The
# ASF licenses this file to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance with the
# License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations
# under the License.
#
############################################################################

include $(APPDIR)/Make.defs

# LVGL graphic library

MOONCAKE_DIR = .
MOONCAKE_PATH ?= ${shell pwd}

-include $(MOONCAKE_DIR)/mooncake.mk

ifneq ($(wildcard $(MOONCAKE_DIR)/.git),)

include $(APPDIR)/Application.mk

SUOBJS :=
ifneq ($(EXTRA),)
$(eval $(call SPLITVARIABLE,OBJS_SPILT,$(SORTOBJS),100))
$(foreach BATCH, $(OBJS_SPILT_TOTAL), \
	$(foreach obj, $(OBJS_SPILT_$(BATCH)), \
		$(foreach EXT, $(EXTRA), \
			$(eval substitute := $(patsubst %$(SUFFIX)$(OBJEXT),%$(SUFFIX)$(EXT),$(obj))) \
			$(eval SUOBJS += $(substitute)) \
		) \
	) \
)
endif

clean::
	$(eval $(call SPLITVARIABLE,SUOBJS_SPILT,$(SUOBJS),100))
	$(foreach BATCH, $(SUOBJS_SPILT_TOTAL), \
		$(foreach obj, $(SUOBJS_SPILT_$(BATCH)), \
			$(shell rm -rf $(obj)) \
		) \
	)

distclean::

endif

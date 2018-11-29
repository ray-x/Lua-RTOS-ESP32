#
# Component Makefile
#

ifdef CONFIG_LUA_RTOS_LUA_USE_CURL_NET

COMPONENT_SRCDIRS:=lib/vauth lib/vtls lib src
COMPONENT_PRIV_INCLUDEDIRS:=lib include src
CFLAGS+=-DHAVE_CONFIG_H -DBUILDING_LIBCURL

else

# disable CURL support
COMPONENT_SRCDIRS :=
COMPONENT_PRIV_INCLUDEDIRS :=

endif

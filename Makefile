# SPDX-License-Identifier: GPL-2.0
#
# Makefile for the touchscreen drivers.
#

# Each configuration option enables a list of files.

obj-$(CONFIG_TOUCHSCREEN_GOODIX)	+= goodix.o

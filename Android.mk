#
# Copyright (c) 2015 Alexey Kuzin <amkuzink@gmail.com>.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
# 1. Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
# notice, this list of conditions and the following disclaimer in the
# documentation and/or other materials provided with the distribution.
# 3. Neither the name of the Winpcap Android nor the names of its
# contributors may be used to endorse or promote products derived from
# this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	pcap-linux.c \
	fad-gifc.c \
	pcap.c \
	inet.c \
	gencode.c \
	optimize.c \
	nametoaddr.c \
	etherent.c \
	savefile.c \
	bpf/net/bpf_filter.c \
	bpf_image.c \
	bpf_dump.c \
	scanner.c \
	grammar.c \
	version.c \
	pcap-new.c \
	pcap-remote.c \
	sockutils.c

LOCAL_CFLAGS :=-O2 -fPIC
LOCAL_CFLAGS += -DHAVE_CONFIG_H -D_U_="__attribute__((unused))" -Dlinux -D__GLIBC__ -D_GNU_SOURCE \
	-DHAVE_REMOTE

LOCAL_MODULE := winpcap

include $(BUILD_STATIC_LIBRARY)

# Include rpcapd make file
include $(LOCAL_PATH)/rpcapd/Android.mk

#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

#add istore
echo 'src-git istore https://github.com/linkease/istore;main' >> feeds.conf.default

# add modemfeed
echo 'src-git modemfeed https://github.com/koshev-msk/modemfeed.git' >> feeds.conf.default

#5G信号插件，拨号工具，驱动
rm -rf package/wwan
git clone --depth=1 https://github.com/dumpmemory/5G-Modem-Support package/wwan
rm -rf package/wwan/rooter
git clone --depth=1 https://github.com/Siriling/OpenWRT-MyConfig 
cp OpenWRT-MyConfig/configs/lede/private/applications/luci-app-sms-tool/root/etc/config/* package/wwan/luci-app-sms-tool/root/etc/config



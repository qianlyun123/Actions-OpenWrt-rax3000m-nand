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

# 添加第三方应用
mkdir kiddin9
pushd kiddin9
git clone --depth=1 https://github.com/kiddin9/openwrt-packages .
popd

mkdir Modem-Support
pushd Modem-Support
git clone --depth=1 https://github.com/Siriling/5G-Modem-Support .
popd

mkdir MyConfig
pushd MyConfig
git clone --depth=1 https://github.com/Siriling/OpenWRT-MyConfig .
popd

# mkdir package/community
pushd package

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

#add istore
echo 'src-git istore https://github.com/linkease/istore;main' >> feeds.conf.default

# add modemfeed
echo 'src-git modemfeed https://github.com/koshev-msk/modemfeed.git' >> feeds.conf.default

# 存储相关应用
# mkdir autoshare-samba
# mkdir luci-app-samba4
#cp -rf ../kiddin9/autoshare-samba/* autoshare-samba
# cp -rf ../kiddin9/luci-app-samba4/* luci-app-samba4

# 5G通信模组拨号工具
# mkdir quectel_QMI_WWAN
# mkdir quectel_cm_5G
# mkdir quectel_MHI
# mkdir luci-app-hypermodem
# cp -rf ../Modem-Support/quectel_QMI_WWAN/* quectel_QMI_WWAN
# cp -rf ../Modem-Support/quectel_cm_5G/* quectel_cm_5G
# cp -rf ../Modem-Support/quectel_MHI/* quectel_MHI
# cp -rf ../Modem-Support/luci-app-hypermodem/* luci-app-hypermodem

# 5G模组短信插件
mkdir sms-tool
mkdir luci-app-sms-tool
cp -rf ../Modem-Support/sms-tool/* sms-tool
cp -rf ../Modem-Support/luci-app-sms-tool/* luci-app-sms-tool
cp -rf ../MyConfig/configs/istoreos/general/applications/luci-app-sms-tool/* luci-app-sms-tool

# 5G模组管理插件+AT工具
mkdir luci-app-modem
cp -rf ../Modem-Support/luci-app-modem/* luci-app-modem
sed -i "/kmod-pcie_mhi/d" luci-app-modem/Makefile
popd

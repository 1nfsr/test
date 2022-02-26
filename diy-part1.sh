#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# fw876/helloworld
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.defaultault

#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default

#sed -i 's@coolsnowwolf/packages@P3TERX/packages@' feeds.conf.default

#sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default

#sed -i '$a src-git helloworld https://github.com/P3TERX/helloworld' feeds.conf.default

#
rm -rf package/lean/ddns-scripts_{aliyun,dnspod}
rm -rf package/lean/n2n_v2
rm -rf package/lean/autosamba
sed -i 's/+luci-base +luci //g' package/lean/default-settings/Makefile
rm -rf package/lean/mt
rm -rf package/firmware/quantenna
rm -rf package/network/services/noddos

svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/other/luci-app-openclash

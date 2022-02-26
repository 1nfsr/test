#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# Modify default IP
sed -i 's/192.168.1.1/192.168.77.1/g' package/base-files/files/bin/config_generate

# Modify hostname
sed -i 's/OpenWrt/x86/g' package/base-files/files/bin/config_generate

# Modify the version number
sed -i "s/OpenWrt /Infsr build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Add kernel build user
[ -z $(grep "CONFIG_KERNEL_BUILD_USER=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_USER="Infsr"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_USER=\).*@\1$"Infsr"@' .config

# Add kernel build domain
[ -z $(grep "CONFIG_KERNEL_BUILD_DOMAIN=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_DOMAIN="GitHub Actions"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_DOMAIN=\).*@\1$"GitHub Actions"@' .config

#
rm -rf package/lean/ddns-scripts_{aliyun,dnspod}
rm -rf package/lean/n2n_v2
rm -rf package/lean/autosamba
sed -i 's/+luci-base +luci //g' package/lean/default-settings/Makefile
rm -rf package/lean/mt
rm -rf package/firmware/quantenna
rm -rf package/network/services/noddos
rm -rf package/feeds/luci/luci-app-n2n_v2
rm -rf package/feeds/luci/luci-app-noddos

svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/other/luci-app-openclash

rm -rf feeds/packages/net/nginx-util/files/nginx.config
mv ${GITHUB_WORKSPACE}/nginx.config feeds/packages/net/nginx-util/files/nginx.config
#!/bin/bash
# Z423-EC-Patches 自动安装脚本 (Initramfs 优化版)

if [ "$EUID" -ne 0 ]; then 
  echo "Please use sudo to run the script."
  exit
fi

echo "Installing Z423 HW Patches..."

# 1. 部署 initramfs 早期启动脚本 (核心：开启硬盘供电)
echo "Patching for HDD Power..."
cp z423_hw_init /etc/initramfs-tools/scripts/init-top/
chmod +x /etc/initramfs-tools/scripts/init-top/z423_hw_init

# 2. 更新 initramfs 镜像 (让补丁进入内核启动流程)
echo "Updating initramfs..."
update-initramfs -u

# 3. 部署系统层守护进程
echo "Patching for LED and Fan Control Daemon"
cp z423-fan-daemon /usr/local/sbin/
cp z423-ledd /usr/local/sbin/
chmod +x /usr/local/sbin/z423-fan-daemon
chmod +x /usr/local/sbin/z423-ledd

# 4. 部署并启动服务
cp *.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable --now z423-fans.service
systemctl enable --now z423-ledd.service

echo "Finished. Please reboot your device."

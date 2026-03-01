# Z423-EC-Patches
Patches ZSpace Z423 for HDDs Fans LEDs to function well. No kernel module needed.

Tested on Z423, for other devices use it at your own risk.

# Usage
1. Enter root environment
```bash
sudo -i
```
2. Run the command
```bash
cd /tmp
wget -O Z423-EC-Patches.zip https://github.com/oaooi/Z423-EC-Patches/archive/refs/heads/main.zip
unzip Z423-EC-Patches.zip
cd Z423-EC-Patches-main
chmod +x install.sh
./install.sh
```

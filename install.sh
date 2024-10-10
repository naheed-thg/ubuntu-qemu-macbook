# IMG = /path/to/your/ubuntu-22.04.1-live-server-arm64.iso

IMG=/Users/naheed.tayab36/vms/ubuntu-24.04.1-live-server-arm64.iso

BIOS=/opt/homebrew/share/qemu/edk2-aarch64-code.fd


qemu-img create -f qcow2 ubuntu.qcow2 20G

qemu-system-aarch64 -m 8G -cpu cortex-a57 -M virt  \
	-smp 2 \
        -bios $BIOS -serial telnet::4444,server -nographic \
	-drive if=none,format=qcow2,file=ubuntu.qcow2,id=hd0 \
        -device virtio-blk-device,drive=hd0 \
        -device virtio-net-device,netdev=net0 \
        -netdev user,id=net0,hostfwd=tcp::10022-:22 \
	-cdrom $IMG



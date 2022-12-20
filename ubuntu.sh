BIOS=/opt/homebrew/share/qemu/edk2-aarch64-code.fd

qemu-system-aarch64 -m 8G -cpu host -M virt,accel=hvf \
        -smp 2 \
        -bios $BIOS -serial telnet::4444,server,nowait -nographic \
        -drive if=none,format=qcow2,file=ubuntu.qcow2,id=hd0 \
        -device virtio-blk-device,drive=hd0 \
        -device virtio-net-device,netdev=net0 \
        -netdev user,id=net0,hostfwd=tcp::20022-:22

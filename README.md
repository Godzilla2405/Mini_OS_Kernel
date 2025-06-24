# Simple-OS: A Self-Hosting x86-32 Hobby Operating System

**Developers:**  
- Mayank Mahtolia – mahtoliamayank404@gmail.com  
- Akash Singh – akrawat0056@gmail.com  
- Priyanshu Pundir – priyanshupundir779@gmail.com  
- Krish Gupta – krigup789@gmail.com

---

## 📌 Project Overview

Simple-OS is a 32-bit educational operating system built from scratch for the x86 architecture. It aims to become self-hosting—capable of compiling its own source code. Designed primarily for learning, Simple-OS implements core OS features progressively through milestone-based development.

### 🔧 Key Characteristics
- Custom non-GRUB bootloader for full hardware control  
- Shell/terminal interface  
- Hybrid kernel (monolithic + modular design)  
- Preemptive multitasking and virtual memory  
- FAT32 filesystem and networking support  
- Not intended for production use  

---

## ✅ Current Status

- ✅ Custom protected-mode bootloader with ELF loading  
- ✅ Preemptive multitasking kernel with paging  
- ✅ FAT32 read/write filesystem support  
- ✅ User programs: shell, editor (Kilo), file utilities  
- ✅ Networking: Ethernet, IPv4, ICMP, ping utility  
- 🚧 UDP protocol support  
- 🚧 SmallerC compiler port  
- 🚧 Basic GUI/window manager  
- ⏳ TCP stack, self-hosting, and GUI apps (planned)

---

## 🧠 Features

### Core System
- ELF loading in custom bootloader  
- Higher-half kernel (3GB+ virtual memory)  
- Preemptive multitasking, context switching  
- Paging-based memory protection  
- System calls: `fork`, `exec`, `yield`

### Storage & I/O
- FAT32 read/write driver  
- ATA PIO disk driver  
- VGA text mode and VESA graphics (1024×768)  
- PS/2 keyboard driver  
- Serial port output for logging/debugging  

### Userland
- VT100-compatible terminal  
- Command shell  
- Kilo text editor with syntax highlighting  
- File utilities: `ls`, `cp`, `mv`, `rm`, `mkdir`  
- Image viewer using stb_image

### Networking
- RTL8139 network card support  
- Ethernet, IPv4, ICMP stack  
- `ping` utility  
- Basic socket API

---

## 🖥️ System Requirements

**Target Hardware:**  
- 32-bit x86 processor  
- 128MB RAM minimum  
- VGA-compatible graphics  
- RTL8139 network card

**Build Host (Linux):**  
- Ubuntu/Debian-based system  
- 4GB RAM minimum (8GB recommended)  
- 10GB free disk space  
- Internet connection for dependencies

---

## ⚙️ Installation & Build Instructions

### Step 1: Install Dependencies
sudo apt update
sudo apt install -y build-essential bison flex libgmp-dev libmpc-dev libmpfr-dev texinfo nasm qemu-system-x86 gcc-multilib dosfstools git mtools

### Step 2: Clone Repository

### Step 3: Build Toolchain 
./build-toolchain.sh | tee build.log

### Step 4: Build the OS
dd if=/dev/zero of=testfs.fat bs=1M count=512
mkfs.vfat testfs.fat
./build.sh

## ▶️ Running Simple-OS
### Option 1: Using QEMU Script
./qemu.sh

### Option 2: Option 2: Manual QEMU Launch
qemu-system-i386 -drive format=raw,file=bootable_kernel.bin -hda testfs.fat -serial stdio -m 512M -vga std -net nic,model=rtl8139 -net user

## 🐞 Debugging
### Start QEMU in Debug Mode:
./qemu.sh debug

### Attach GDB:
gdb -ex "target remote localhost:1234" -ex "symbol-file sysroot/boot/simple_os.kernel"

### Other Symbol Files for Debugging:
symbol-file bootloader/bootloader.elf
add-symbol-file applications/shell/shell.elf

## 💻 VSCode Setup

### Install extensions:
Remote - SSH
Native Debug

### Configure .vscode/launch.json for GDB remote debugging

### Use built-in tasks to build/run/debug

## Key Files:
bootloader/arch/i386/bootloader.asm: Bootloader entry
kernel/kernel.c: Kernel main function
kernel/arch/i386/process/switch_kernel_context.asm: Context switching
kernel/fat/fat32.c: FAT32 implementation
applications/shell/main.c: Shell source

## 🛣️ Development Roadmap
✅ Bootloader with ELF loading
✅ Kernel base: IDT, paging, interrupts
✅ Multitasking with fork/exec
✅ Filesystem (FAT32) and hosted GCC
✅ Shell, editor, file utilities
✅ IPC (pipes, mutexes, RW locks)
✅ VESA graphics and double buffering
🚧 UDP protocol
🚧 SmallerC port
🚧 Window manager
⏳ TCP support
⏳ Full self-hosting
⏳ GUI apps
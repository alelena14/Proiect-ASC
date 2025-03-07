# Conway's Game of Life (Assembly - AT&T Syntax)

## Overview
This project implements **Conway's Game of Life** using assembly language (AT&T syntax) on a **32-bit Linux** system.

## Requirements
- A **Linux** system (preferably Ubuntu)
- **GNU Assembler (GAS)**
- **GCC** with 32-bit support
- **Python 3** (for running test scripts)

## Installation & Compilation

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/alelena14/Proiect-ASC
cd Proiect-ASC
```

### 2️⃣ Install Dependencies
Ensure you have the required tools installed:
```bash
sudo apt update && sudo apt install gcc-multilib binutils-multiarch python3
```

### 3️⃣ Compile the Program (32-bit Assembly)
```bash
as --32 -o ex1.o ex1.s
gcc -m32 -o ex1 ex1.o -no-pie
```

If the program uses `scanf`, `printf`, or other standard C functions, link it with libc:
```bash
gcc -m32 -o ex1 ex1.o -no-pie
```

## Running the Program

### 4️⃣ Run the Program with Manual Input
```bash
./ex1
```
Manually enter the required inputs.

### 5️⃣ Run the Program with Input Files
```bash
./ex1 < test0_0.in
```

## Running Tests
A Python script (`tests.py`) automates testing with multiple input files.

### 6️⃣ Run All Tests
```bash
python3 tests.py
```

If `tests.py` is not executable, grant execution permission:
```bash
chmod +x tests.py
./tests.py
```

## Troubleshooting
If you encounter issues with 32-bit support, ensure you have `gcc-multilib` installed:
```bash
sudo apt install gcc-multilib
```

If there are linking issues, try adding `-nostartfiles`:
```bash
gcc -m32 -o ex1 ex1.o -nostartfiles -no-pie
```



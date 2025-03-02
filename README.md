# Proiect-ASC
# Conway's Game of Life Encryption System

## Overview
This project implements an encryption system based on Conway's Game of Life. The system uses an initial configuration of a matrix and evolves it over `k` iterations following the standard Game of Life rules. The final state of the matrix is used as a key to perform XOR-based encryption and decryption.

## Requirements
The program must read input from `STDIN`, including:
1. Number of rows (`m`) and columns (`n`)
2. Number of alive cells (`p`) and their positions
3. Number of iterations (`k`)
4. A mode flag (`0` for encryption, `1` for decryption)
5. A message to encrypt (plaintext) or decrypt (hexadecimal encoded ciphertext)

## Task 0x00 - System Evolution
The program should simulate `k` iterations of Conway's Game of Life on an `m x n` grid, considering the following rules:
- Each live cell with fewer than 2 or more than 3 live neighbors dies.
- Each dead cell with exactly 3 live neighbors becomes alive.
- All other cells remain unchanged.

The program should print the resulting matrix after `k` iterations with spaces between elements and a newline at the end of each row.

## Task 0x01 - Encryption & Decryption
The encryption process is based on XOR-ing a given plaintext with the computed key from the matrix evolution. The key is obtained by flattening the evolved matrix into a binary sequence. If the message is longer than the key, the key is repeated as needed.

**Encryption Example:**
Input:
```
3 4  
5  
0 1  
0 2  
1 0  
2 2  
2 3  
1  
0  
password
```
Output:
```
0x70E1F26F6E63
```

**Decryption Example:**
Input:
```
3 4  
5  
0 1  
0 2  
1 0  
2 2  
2 3  
1  
1  
0x70E1F26F6E63
```
Output:
```
password
```

## Constraints
- `1 ≤ m, n ≤ 18`
- `p ≤ m × n`
- `k ≤ 15`
- The plaintext is alphanumeric with a maximum length of 10 characters.
- The ciphertext is a valid hexadecimal string prefixed with `0x`.



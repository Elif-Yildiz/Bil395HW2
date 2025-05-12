
# Multi-Language Simple Calculator
by Elif Yıldız

This repository contains implementations of a simple arithmetic calculator in various programming languages. Each program allows users to input basic arithmetic expressions (addition, subtraction, multiplication, and division) and returns the computed result. The user can exit the program by typing "exit".

## Supported Operations
- Addition (`+`)
- Subtraction (`-`)
- Multiplication (`*`)
- Division (`/`) (Handles division by zero errors)

## Supported Languages & Instructions

### **Perl (`perlcalcelif.pl`)**
- Run the program using:
  ```sh
  perl perlcalcelif.pl
  ```

### **Scheme (`schemecalcelif.scm`)**
- Requires a Scheme interpreter such as MIT/GNU Scheme or Racket.
- (I used Racket)
- Run the program using:
  ```sh
  mit-scheme --load schemecalcelif.scm
  ```

### **Prolog (`prologcalcelif.pl`)**
- Requires SWI-Prolog.
- Run the program using:
  ```sh
  swipl -f prologcalcelif.pl
  ```

### **Ada (`calculator.adb`)**
-Requires GNAT.
- Compile and run using:
  ```sh
  gcc -c calculator.adb
  gnatmake calculator.adb
  ./calculator
  ```

### **Rust (`rustcalcelif.rs`)**
- Requires Rust compiler (`cargo` toolchain).
- Compile and run using:
  ```sh
  rustc rustcalcelif.rs -o calculator
  ./rustcalcelif
  ```

## Features
- Reads user input for an arithmetic expression.
- Parses the input and performs the appropriate calculation.
- Handles division by zero safely.
- Allows users to exit by typing "exit".
- Simple and interactive command-line interface.

## Notes
- Ensure you have the required compilers/interpreters installed before running the programs.
- The syntax and exact execution methods may slightly differ depending on the programming language.
- These implementations focus on simplicity and readability.

🚀


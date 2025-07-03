# Nanoprocessor Design Project


This repository contains the VHDL files for the Nanoprocessor Design. The Nanoprocessor is a 4-bit processor that is capable of performing basic arithmetic. The processor is designed to be implemented on a Xilinx Vivado.


## Technologies Used
<!-- Images -->
<!-- Vivado Logo -->
<img src="https://maker-hub.georgefox.edu/w/images/8/85/Xilinx_image.jpg" height="100" />


# 4-Bit Nano Processor Design

[![VHDL](https://img.shields.io/badge/Language-VHDL-blue.svg)](https://www.vhdl.org/)
[![FPGA](https://img.shields.io/badge/Hardware-Basys3-green.svg)](https://store.digilentinc.com/basys-3-artix-7-fpga-trainer-board-recommended-for-introductory-users/)
[![Vivado](https://img.shields.io/badge/Tool-Vivado-orange.svg)](https://www.xilinx.com/products/design-tools/vivado.html)

A comprehensive 4-bit nano processor implementation designed and developed for **CS1050 Computer Organization and Digital Design** course. This project features both basic and improved versions of a fully functional processor with custom instruction sets, complete with simulation testbenches and FPGA implementation.

## 🎯 Project Overview

A **4-bit nano processor** implemented in VHDL for the *CS1050 Computer Organization and Digital Design* course.

- **Basic Version**: 4 instructions, 8 registers, 8 program memory locations


## ✨ Key Features
### Basic Version
| Feature               | Description                          |
|-----------------------|--------------------------------------|
| **4-bit Data Path**   | 8 registers (R0-R7)                  |
| **Instruction Set**   | ADD, NEG, MOVI, JZR                  |
| **Memory**            | 8×12-bit Program ROM                 |
| **I/O**              | 7-segment display + LED flags        |


## 🏗️ Architecture

### Core Components

#### Basic Version
- **Program ROM**: Stores 8 instructions (12-bit each)
- **Instruction Decoder**: 2-to-4 decoder for opcode interpretation
- **Program Counter**: 3-bit counter for instruction addressing
- **Register Bank**: 8×4-bit register file
- **ALU**: 4-bit Add/Subtract Unit
- **Multiplexers**: Data routing and selection
- **Clock Management**: Slow clock generator for synchronization

## 📋 Instruction Set

### Basic Version (4 Instructions)
| Opcode | Instruction | Format | Description |
|--------|-------------|--------|-------------|
| 00 | ADD Ra, Rb | 00 Ra Rb 0000 | Ra ← Ra + Rb |
| 01 | NEG Ra, Rb | 01 Ra Rb 0000 | Ra ← Ra - Rb |
| 10 | MOVI Ra, d | 10 Ra d | Ra ← d (immediate) |
| 11 | JZR Ra, d | 11 Ra 000 d | Jump to d if Ra = 0 |


## 🚀 Getting Started

### Prerequisites
- Xilinx Vivado Design Suite (2018.3 or later)
- Basys 3 FPGA Development Board (optional, for hardware testing)
- Basic knowledge of VHDL and digital design

git clone https://github.com/sathurshna/nanoprocessor.git
cd nanoprocessor/basic/src
vivado -mode gui &  # Open in Vivado

-- Example testbench
process
begin
  wait for 10 ns;
  assert (result = x"F") report "Test failed!" severity error;
end process;

### Installation and Setup

1. **Clone the repository**
   
2. **Open in Vivado**
   - Launch Vivado Design Suite
   - Create new project or open existing project file
   - Add source files from the repository

3. **Simulation**
   - Run individual component simulations using provided testbenches
   - Execute full processor simulation with `NanoprocessorSim.vhd`

4. **Synthesis and Implementation**
   - Synthesize the design for Basys 3 target
   - Implement and generate bitstream
   - Program the FPGA board

## 📁 Project Structure

```
nanoprocessor-design/
├── basic-version/
│   ├── src/
│   │   ├── nanoprocessor.vhd
│   │   ├── instruction_decoder.vhd
│   │   ├── register_bank.vhd
│   │   ├── program_counter.vhd
|   |   |── slowclock.vhd
│   ├── sim/
│   │   ├── nanoprocessor_sim.vhd
│   │   └── component_testbenches/
│   └── constraints/
│       └── basys3.xdc
├── improved-version/
│   ├── src/
│   │   ├── improved_nanoprocessor.vhd
│   │   ├── improved_instruction_decoder.vhd
│   ├── sim/
│   │   └── improved_testbenches/
│   └── constraints/
│       └── improved_basys3.xdc
├── docs/
│   ├── lab_report.pdf
│   ├── schematics/
│   └── timing_diagrams/
└── README.md
```

## 🔬 Testing and Simulation

### Component-Level Testing
Each component includes individual testbenches:
- Register Bank simulation
- ALU functionality testing
- Instruction Decoder verification
- Program Counter behavior
- Multiplexer operations

### System-Level Testing
- Complete processor simulation with sample programs
- Timing analysis and verification
- Resource utilization reports
- Hardware validation on Basys 3 FPGA

### Sample Test Programs

**Basic Version Example:**
```assembly
MOVI R7, 1    ; Load 1 into R7
MOVI R2, 2    ; Load 2 into R2  
ADD R7, R2    ; R7 = R7 + R2 = 3
MOVI R3, 3    ; Load 3 into R3
ADD R7, R3    ; R7 = R7 + R3 = 6
JZR R0, 7     ; Jump to address 7
```

## 📊 Performance Metrics

### Resource Utilization (Basys 3)

#### Basic Version
- **LUTs**: ~25 
#### Improved Version
- **LUTs**: ~33
## 🔧 Design Methodology

### Development Approach
1. **Modular Design**: Each component designed and tested independently
2. **Bottom-Up Integration**: Components integrated systematically
3. **Comprehensive Testing**: Multiple simulation levels
4. **Resource Optimization**: Efficient use of FPGA resources
5. **Scalable Architecture**: Easy extension and modification

### Key Design Decisions
- **Clock Management**: Slow clock generation for visual debugging
- **Memory Architecture**: LUT-based ROM for instruction storage
- **Data Path**: Optimized multiplexer networks for data routing
- **Control Logic**: Decoder-based instruction interpretation


## 📚 Documentation
- **Complete Lab Report**: [Lab Report PDF][NanoProcessor.pdf](https://github.com/user-attachments/files/21030258/NanoProcessor.pdf)
- **Design Schematics**: Available in `docs/schematics/`
- **Timing Diagrams**: Available in `docs/timing_diagrams/`
- **Component Documentation**: Individual VHDL file headers

## 🔮 Future Enhancements
- **Memory reverse action** : Deleting the lastly executed action
- **Pipeline Implementation**: Multi-stage instruction pipeline
- **Cache Memory**: Instruction and data cache systems
- **Interrupt Handling**: External interrupt processing
- **Floating Point Unit**: IEEE 754 floating-point operations
- **Extended Instruction Set**: More complex operations
- **Memory Management**: Virtual memory and protection


## 🙏 Acknowledgments

- **Course**: CS1050 Computer Organization and Digital Design
- **Institution**: University Of Moratuwa
- **Tools**: Xilinx Vivado Design Suite
- **Hardware**: Digilent Basys 3 FPGA Board

---

Router1x3 UVM Verification Project

📌 Project Overview

This project implements the `Universal Verification Methodology (UVM)` to verify a `1x3 Router` RTL design.
The router takes packets from a single input port and routes them to one of three output ports based on the packet header. The verification environment is developed in SystemVerilog with UVM, ensuring reusability, scalability, and robustness.

🎯 Objectives

* Build a `constrained-random testbench` using UVM.
* Achieve `100% assertion and functional coverage`.
* Verify router functionality across corner cases and protocol scenarios.
* Ensure compliance with design specifications.

🛠️ Features

UVM Testbench Components

  * Environment, Agent, Driver, Sequencer, Monitor, Scoreboard.
  * Config DB usage for interface connections.
  * Coverage collection (functional + code).
  * SystemVerilog Assertions (SVA) for protocol checks.

Key Highlights

  * Achieved `100% Assertions Coverage`.
  * Achieved `100% Functional Coverage`.
  * Clean and reusable UVM architecture.
  * Makefile support for simplified simulation flow.

📂 Directory Structure

```
Router1x3/
│── rtl/             # Router RTL source files
│── tb/              # UVM testbench components
│── sim/             # Makefile and simulation scripts
|-- agents/
```


📊 Verification Results

* ✅ 100% Assertion Coverage
* ✅ 100% Functional Coverage
# Detailed coverage reports are available in the `sim/` directory.


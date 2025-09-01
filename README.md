# UVM_3
This work focuses on exploring the execution order of different UVM phases by implementing them across the RAM write testbench components. The ram_wr_driver.sv file extends uvm_driver and implements all UVM phases with appropriate super.*_phase() calls and uvm_info messages. In the run phase, objections are raised and dropped with a delay of 10 time units. The ram_wr_agent.sv file extends uvm_agent, instantiates the driver in the build phase, and manages objections in the run phase with a delay of 100 time units. Similarly, ram_env.sv extends uvm_env and creates the agent in the build phase, while ram_wr_test.sv extends uvm_test and instantiates the environment. Both the environment and test also implement all UVM phases with objection handling in the run phase using a 100 time unit delay.

The package file ram_pkg.sv imports uvm_pkg and includes all required source files, while top.sv imports the package, includes UVM macros, and calls run_test("ram_wr_test") in the initial block. The simulation is executed from the sim directory using make run_test, and the output demonstrates the sequence and order of phase execution.

#Key Learnings –

Implementation of all major UVM phases (build, connect, run, etc.) across different components.

Use of super.*_phase() and uvm_info for phase tracking.

Understanding objection handling and simulation control in the run phase.

Observing and validating the UVM phase execution order.

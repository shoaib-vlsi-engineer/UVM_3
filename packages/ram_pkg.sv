package ram_pkg;

    // Import the UVM package
    import uvm_pkg::*;
  
    // Include the uvm_macros.svh
    `include "uvm_macros.svh"
    
    // Include the tb_defs.sv
    `include "tb_defs.sv"
 
    // Include ram_wr_driver,ram_wr_agent,ram_env,ram_wr_test files   
    `include "ram_wr_driver.sv"
    `include "ram_wr_agent.sv"
    `include "ram_env.sv"
    `include "ram_wr_test.sv"

endpackage

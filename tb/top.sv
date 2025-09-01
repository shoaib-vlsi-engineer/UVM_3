module top;
  
    // Import ram_pkg.sv
    import ram_pkg::*;

    // Import the UVM package
    import uvm_pkg::*;

    // Include the uvm_macros.svh
    `include "uvm_macros.svh"

    // Within initial block call run_test("ram_wr_test")
    initial begin
        run_test("ram_wr_test");
    end
  
endmodule : top

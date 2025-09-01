//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------

// Extend ram_wr_driver from uvm_driver
class ram_wr_driver extends uvm_driver;

    // Factory Registration
    `uvm_component_utils(ram_wr_driver)

    //------------------------------------------
    // METHODS
    //------------------------------------------

    // Add all the UVM phases:
    extern function new(string name = "ram_wr_driver", uvm_component parent);
    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);
    extern function void end_of_elaboration_phase(uvm_phase phase);
    extern function void start_of_simulation_phase(uvm_phase phase);
    extern task run_phase(uvm_phase phase);
    extern function void extract_phase(uvm_phase phase);
    extern function void check_phase(uvm_phase phase);
    extern function void report_phase(uvm_phase phase);

endclass

//-----------------  constructor new method  -------------------//
//Add code for new()
function ram_wr_driver::new(string name = "ram_wr_driver", uvm_component parent);
    super.new(name, parent);
endfunction:new

// Add body for all UVM phases
// NOTE : Call super.*_phase() in every phase method ,* indicates build,connect,etc  
// Hint : `uvm_info("RAM_DRIVER","This is Build Phase ", UVM_LOW)   

//-----------------  Add UVM build() phase   -------------------//
function void ram_wr_driver::build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("RAM_DRIVER", "This is Build Phase", UVM_LOW)
endfunction:build_phase

//-----------------  Add UVM connect() phase   -------------------//
function void ram_wr_driver::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("RAM_DRIVER", "This is connect phase", UVM_LOW)
endfunction:connect_phase

//-----------------  Add UVM end_of_elaboration() phase   -------------------//
function void ram_wr_driver::end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("RAM_DRIVER", "This is end_of_elaboration phase", UVM_LOW)
endfunction:end_of_elaboration_phase

//-----------------  Add UVM start_of_simulation() phase   -------------------//
function void ram_wr_driver::start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    `uvm_info("RAM_DRIVER", "This is start_of_simulation phase", UVM_LOW)
endfunction:start_of_simulation_phase

//-----------------  Add UVM run() phase   -------------------//
// Raise and drop objections  
// Within raising and dropping the objections add delay of 10 in the run phase before printing
task ram_wr_driver::run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    // Raise objection to prevent simulation from ending
    phase.raise_objection(this);
    
    // Add delay before printing
    #10;
    `uvm_info("RAM_DRIVER", "This is run phase", UVM_LOW)
    
    // Drop objection to allow simulation to proceed
    phase.drop_objection(this);
endtask:run_phase

//-----------------  Add UVM extract() phase   -------------------//
function void ram_wr_driver::extract_phase(uvm_phase phase);
    super.extract_phase(phase);
    `uvm_info("RAM_DRIVER", "This is extract phase", UVM_LOW)
endfunction:extract_phase

//-----------------  Add UVM check() phase   -------------------//
function void ram_wr_driver::check_phase(uvm_phase phase);
    super.check_phase(phase);
    `uvm_info("RAM_DRIVER", "This is check phase", UVM_LOW)
endfunction:check_phase

//-----------------  Add UVM report() phase   -------------------//
function void ram_wr_driver::report_phase(uvm_phase phase);
    super.report_phase(phase);
    `uvm_info("RAM_DRIVER", "This is report phase", UVM_LOW)
endfunction:report_phase

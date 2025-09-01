//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------

// Extend ram_wr_agent from uvm_agent
class ram_wr_agent extends uvm_agent;

    // Factory Registration
    `uvm_component_utils(ram_wr_agent)

    // Declare the ram_wr_driver handle
    ram_wr_driver drv_h;

    //------------------------------------------
    // METHODS
    //------------------------------------------

    // Add all the UVM phases
    extern function new(string name = "ram_wr_agent", uvm_component parent);
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
function ram_wr_agent::new(string name = "ram_wr_agent", uvm_component parent);
    super.new(name, parent);
endfunction:new

// Add UVM phases
// NOTE : Call super.*_phase() in every phase method ,* indicates build,connect,etc  
//        Print using `uvm_info("RAM_AGENT","This is build phase",UVM_LOW)  in all the phases 
    
//-----------------  Add UVM build() phase   -------------------//
// In build phase create the instance of driver 
function void ram_wr_agent::build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("RAM_AGENT", "This is build phase", UVM_LOW)
    
    // Create the instance of driver
    drv_h = ram_wr_driver::type_id::create("drv_h", this);
endfunction:build_phase

//-----------------  Add UVM connect() phase   -------------------//
function void ram_wr_agent::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("RAM_AGENT", "This is connect phase", UVM_LOW)
endfunction:connect_phase

//-----------------  Add UVM end_of_elaboration() phase   -------------------//
function void ram_wr_agent::end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("RAM_AGENT", "This is end_of_elaboration phase", UVM_LOW)
endfunction:end_of_elaboration_phase

//-----------------  Add UVM start_of_simulation() phase   -------------------//
function void ram_wr_agent::start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    `uvm_info("RAM_AGENT", "This is start_of_simulation phase", UVM_LOW)
endfunction:start_of_simulation_phase

//-----------------  Add UVM run() phase   -------------------//
// Raise and drop objections  
// Within raising and dropping the objections add delay of 100 in the run phase before printing
task ram_wr_agent::run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    // Raise objection to prevent simulation from ending
    phase.raise_objection(this);
    
    // Add delay before printing
    #100;
    `uvm_info("RAM_AGENT", "This is run phase", UVM_LOW)
    
    // Drop objection to allow simulation to proceed
    phase.drop_objection(this);
endtask:run_phase

//-----------------  Add UVM extract() phase   -------------------//
function void ram_wr_agent::extract_phase(uvm_phase phase);
    super.extract_phase(phase);
    `uvm_info("RAM_AGENT", "This is extract phase", UVM_LOW)
endfunction:extract_phase

//-----------------  Add UVM check() phase   -------------------//
function void ram_wr_agent::check_phase(uvm_phase phase);
    super.check_phase(phase);
    `uvm_info("RAM_AGENT", "This is check phase", UVM_LOW)
endfunction:check_phase

//-----------------  Add UVM report() phase   -------------------//
function void ram_wr_agent::report_phase(uvm_phase phase);
    super.report_phase(phase);
    `uvm_info("RAM_AGENT", "This is report phase", UVM_LOW)
endfunction:report_phase

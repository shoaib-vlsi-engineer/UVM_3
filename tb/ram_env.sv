//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------

// Extend ram_env from uvm_env
class ram_env extends uvm_env;

    // Factory Registration
    `uvm_component_utils(ram_env)

    // Declare the ram_wr_agent handle
    ram_wr_agent wr_agt_h;

    //------------------------------------------
    // METHODS
    //------------------------------------------

    // Standard UVM Methods:
    extern function new(string name = "ram_env", uvm_component parent);
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
function ram_env::new(string name = "ram_env", uvm_component parent);
    super.new(name, parent);
endfunction:new

// Add UVM phases
// NOTE : Call super.*_phase() in every phase method ,* indicates build,connect,etc  
//        Print using `uvm_info("RAM_ENV","This is build phase",UVM_LOW)  in all the phases 

//-----------------  Add UVM build() phase   -------------------//
//Create the instance of ram_wr_agent in build phase
function void ram_env::build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("RAM_ENV", "This is build phase", UVM_LOW)
    
    // Create the instance of ram_wr_agent
    wr_agt_h = ram_wr_agent::type_id::create("wr_agt_h", this);
endfunction:build_phase

//-----------------  Add UVM connect() phase   -------------------//
function void ram_env::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("RAM_ENV", "This is connect phase", UVM_LOW)
endfunction:connect_phase

//-----------------  Add UVM end_of_elaboration() phase   -------------------//
function void ram_env::end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("RAM_ENV", "This is end_of_elaboration phase", UVM_LOW)
endfunction:end_of_elaboration_phase

//-----------------  Add UVM start_of_simulation() phase   -------------------//
function void ram_env::start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    `uvm_info("RAM_ENV", "This is start_of_simulation phase", UVM_LOW)
endfunction:start_of_simulation_phase

//-----------------  Add UVM run() phase   -------------------//
// Raise and drop objections  
// Within raising and dropping the objections add 100 delay in the run phase before printing
task ram_env::run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    // Raise objection to prevent simulation from ending
    phase.raise_objection(this);
    
    // Add delay before printing
    #100;
    `uvm_info("RAM_ENV", "This is run phase", UVM_LOW)
    
    // Drop objection to allow simulation to proceed
    phase.drop_objection(this);
endtask:run_phase

//-----------------  Add UVM extract() phase   -------------------//
function void ram_env::extract_phase(uvm_phase phase);
    super.extract_phase(phase);
    `uvm_info("RAM_ENV", "This is extract phase", UVM_LOW)
endfunction:extract_phase

//-----------------  Add UVM check() phase   -------------------//
function void ram_env::check_phase(uvm_phase phase);
    super.check_phase(phase);
    `uvm_info("RAM_ENV", "This is check phase", UVM_LOW)
endfunction:check_phase

//-----------------  Add UVM report() phase   -------------------//
function void ram_env::report_phase(uvm_phase phase);
    super.report_phase(phase);
    `uvm_info("RAM_ENV", "This is report phase", UVM_LOW)
endfunction:report_phase

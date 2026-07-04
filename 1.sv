`include "uvm_macros.svh"
import uvm_pkg::*;

//////////////////////////////////////////////////
// UVM component demonstrating the build_phase,
// where components are typically created and
// configured.
//////////////////////////////////////////////////
class comp extends uvm_component;
  `uvm_component_utils(comp)
  
  function new(string path = "comp", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  // Build phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("COMP", "Build phase of comp executed", UVM_NONE);
  endfunction
  
endclass

//////////////////////////////////////////////////
// Top-level testbench
// Creates the component and manually calls the
// build_phase for demonstration.
//////////////////////////////////////////////////
module tb;
  
  comp c;
  
  initial begin
    // Create component using the UVM factory
    c = comp::type_id::create("c", null);

    // Manually invoke build_phase
    c.build_phase(null);
  end

  /*
  // Standard UVM execution
  initial begin
    run_test("comp");
  end
  */

endmodule




What this example demonstrates
build_phase() is a UVM build phase used to create and configure components.
super.build_phase(phase) executes the base class implementation before adding user logic.
type_id::create() creates the component through the UVM factory.
In this example, build_phase() is called manually using c.build_phase(null) for demonstration.
In a real UVM testbench, build_phase() is invoked automatically by the UVM phasing mechanism when run_test() is called.

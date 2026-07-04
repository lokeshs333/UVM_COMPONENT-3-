`include "uvm_macros.svh"
import uvm_pkg::*;

//////////////////////////////////////////////////
// Component A
//////////////////////////////////////////////////
class a extends uvm_component;
  `uvm_component_utils(a)
  
  function new(string path = "a", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  // Executed during build phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("a", "Class a executed", UVM_NONE);
  endfunction
  
endclass

//////////////////////////////////////////////////
// Component B
//////////////////////////////////////////////////
class b extends uvm_component;
  `uvm_component_utils(b)
  
  function new(string path = "b", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  // Executed during build phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("b", "Class b executed", UVM_NONE);
  endfunction
  
endclass

//////////////////////////////////////////////////
// Parent component that creates A and B and
// prints the UVM component hierarchy.
//////////////////////////////////////////////////
class c extends uvm_component;
  `uvm_component_utils(c)
  
  a a_inst;
  b b_inst;
  
  function new(string path = "c", uvm_component parent = null);
    super.new(path, parent);
  endfunction
  
  // Create child components
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    a_inst = a::type_id::create("a_inst", this);
    b_inst = b::type_id::create("b_inst", this);
  endfunction
  
  // Display the UVM component hierarchy
  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  endfunction
  
endclass

//////////////////////////////////////////////////
// Top-level testbench
// Starts the UVM test by running component 'c'.
//////////////////////////////////////////////////
module tb;
 
  initial begin
    run_test("c");
  end
 
endmodule




What this example demonstrates
run_test("c") creates c as the top-level UVM test component.
During build_phase(), c creates its child components a_inst and b_inst using the UVM factory.
build_phase() of both child components is then executed automatically.
end_of_elaboration_phase() is called after the entire component hierarchy has been built.
uvm_top.print_topology() prints the complete UVM component hierarchy, showing parent-child relationships.

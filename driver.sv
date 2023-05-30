class driver extends uvm_driver#(sequence_i);

    `uvm_component_utils(driver)

function new (string name="driver",uvm_component parent=null);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
//configuration 
endfunction

virtual task run_phase(uvm_phase phase);

    /**/

endtask

endclass 
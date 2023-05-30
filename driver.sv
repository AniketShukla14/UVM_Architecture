class driver extends uvm_driver#(sequence_i);

    `uvm_component_utils(driver)

    virtual mem_if intf();
    sequence_i req;

function new (string name="driver",uvm_component parent=null);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
//configuration 
endfunction

virtual task run_phase(uvm_phase phase);
    repeat(10) begin
    seq_item_port.get_next_time(req);
    /*virtual interface <= driver signal */

    seq_item_port.item_done();

    end
endtask

endclass 
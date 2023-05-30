class monitor extends uvm_monitor#(sequence_i);

    `uvm_component_utils(monitor)
    sequence_i trans;
    uvm_analysis_port #(my_seq_i) item_collected_port;
    
    function new (string name="monitor", uvm_component phase);
    super.new(name,phase);
    item_collected_port=new("write",this);
    endfunction

    function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    trans=sequence_i::type_id::create("trans",this);
    /* config file*/
    endfunction

    function void run_phase(uvm_phase phase);
        repeat(10) begin

            item_collected_port.write(trans);
        end

    endfunction

endclass 
class sequencer extends uvm_sequencer #(sequence_i);

    `uvm_component_utils(sequencer)
    
    function new(string name="";uvm_component parent=null);

        super.new(name,parent);

    endfunction


endclass
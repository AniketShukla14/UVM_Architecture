class agent extends uvm_agent;

    `uvm_component_utils(agent)
    
    sequencer seq_r;
    driver drv;
    monitor mon;

    function new(string name="agent",uvm_component parent=null);
        super.new(name,parent);
    endfunction

    function build_phase(uvm_phase phase);

        super.build_phase(phase);
        seq_r=sequencer::type_id::create("seq_r",this);
        drv=driver::type_id::create("driver",this);
        mon=monitor::type_id::create("monitor",this);
    endfunction

    function void connect_phase(uvm_phase phase);

 drv.seq_item_port.connect(seq_r.seq_item_export)
    endfunction



endclass

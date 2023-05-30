class environment extends uvm_env;

    my_scb scb;
    agent agnt;

    function new (string name="environment", uvm_component parent=null);

    super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    scb=sequencer::type_id::create("scb",this);
    agnt=agent::type_id::create("agnt",this);    


    endfunction


    function connect_phase(uvm_phase phase);
agnt.mon.item_collected_port.connect(scb.item_collected_export);
    endfunction


endclass
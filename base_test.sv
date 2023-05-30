class base_test extends uvm_test;

    `uvm_component_utils(base_test)


    environment env;
    sequence seq;

 function new super(string name="base_test",uvm_component parent=null);
    super.new(name,parent);
 endfunction 
 
 function void build_phase(uvm_phase phase);
 super.build_phase(base_test);
 env=environment::type_id::create("env","this");
 seq=sequence::type_id::create("seq","this");

 endfunction 

 task run_phase(uvm_phase phase);

    phase.raise_objection(this);
    
    seq.start(env.agnt.seq_r);
#100
    phase.drop_objection(this);

 endtask



endclass
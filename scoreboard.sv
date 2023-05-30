class my_scb extends uvm_scoreboard;

    uvm_analysis_imp#(my_seq_i, my_scb) item_collected_export;
    `uvm_component_utils(my_scb)
     my_seq_i pkt;
    my_seq_i pkt_qu[$];
   
    
    function new (string name="SCB", uvm_component parent);
      super.new(name, parent);
      item_collected_export=new("Read",this);
    endfunction 
    
    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      pkt = my_seq_i::type_id::create("scoreboard");
    endfunction
    
    virtual function void write(input my_seq_i data);
      //`uvm_info("SCB","data received",UVM_NONE);
     pkt_qu.push_back(data);
      // data.print();
    endfunction
  
    virtual task run_phase(uvm_phase phase);
     forever begin
       
        wait(pkt_qu.size() > 0);
        pkt = pkt_qu.pop_front();
      $display("a = %0b ,b = %0b ,sum = %0b ,carry = %0b ,",pkt.a,pkt.b,pkt.sum,pkt.carry);
      /* if(pkt.sum == pkt.a ^ pkt.b)  begin 
         $display(" Result:--> a = %0b ,b = %0b ,sum = %0b ,carry = %0b ",pkt.a,pkt.b,pkt.sum,pkt.carry);
       
       end
       
       if(pkt.carry  != pkt.a & pkt.b) begin 
         $display("Result:--> a = %0b ,b = %0b ,sum = %0b ,carry = %0b",pkt.a,pkt.b,pkt.sum,pkt.carry);
       end
       else  begin $display ("Carry is correct");
        
       end*/
       if((pkt.sum !== pkt.a ^ pkt.b) && (pkt.carry !== pkt.a & pkt.b)) begin
         `uvm_info("SCB", "SUM IS wrong", UVM_LOW)
         `uvm_info("SCB", "Carry IS wrong", UVM_LOW)       
       end else begin 
         `uvm_info("SCB", "SUM IS correct", UVM_LOW)
         `uvm_info("SCB", "Carry IS correct", UVM_LOW)        
       end
       
     end
       endtask
  
  endclass 
  
    
  
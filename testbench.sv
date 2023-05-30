module tb;


    //declaration clock 
    bit clk=0;
    always #10 clk=~clk;

    initial begin 
        reset=0;
        #10 reset=1;
    end

 mem_if intf(clk,reset);

    // design name(.clk(intf.clk));

 initial begin
    run_test("base_test");
 end

endmodule



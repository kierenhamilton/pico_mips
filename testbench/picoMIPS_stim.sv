module picoMIPS_stim;

  timeunit 1ns; timeprecision 100ps;

  logic Clock;
  logic [9:0] SW;
  wire [7:0] LED;


  picoMIPS picoMIPS_dut (
      .clk(Clock),
      .SW (SW),
      .LED(LED)
  );

  always begin
    Clock = 1;
    #50 Clock = 0;
    #50 Clock = 1;
  end

  initial begin
    SW[9] = 1;
    #5 SW[9] = 0;
    #5 SW[9] = 1;
  end

  initial begin
    SW[8:0] = 9'b0;
    #1000 SW[7:0] = 8'b00000010;
    #1000 SW[8] = 1;
    #5000 $finish;
  end

endmodule

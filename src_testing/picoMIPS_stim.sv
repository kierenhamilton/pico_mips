module picoMIPS_stim;

  timeunit 1ns; timeprecision 100ps;

  logic Clock;
  logic [9:0] SW;
  wire signed [7:0] LED;

  logic [7:0] output_wave;
  logic [7:0] tb_address;
  real a;
  real b;



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
  	
	for (int i=0; i<255; i++)
	begin
		SW[7:0] = i;
		SW[8] = 0;
		#1000;
		SW[8] = 1;
		#3000;
		SW[8] = 0;
		a = picoMIPS_dut.rom0.mem[i];
		b = LED;
		#500;
	end
	$finish;

  

  end

endmodule

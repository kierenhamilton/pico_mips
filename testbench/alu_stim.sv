module alu_stim;

  timeunit 1ns; timeprecision 100ps;


  logic alu_ctrl;

  logic signed [7:0] input1;
  logic signed [7:0] input2;
  logic signed [15:0] mult;
  logic signed [7:0] add;

  wire signed [7:0] result;

  logic [31:0] random;
  logic signed [7:0] tb_result;

  alu aludut (
      .alu_ctrl(alu_ctrl),
      .input1  (input1),
      .input2  (input2),
      .result  (result)
  );

  initial begin
    alu_ctrl = 1;

    for (int i = 0; i < 1000; i++) begin
      random = $urandom(i);
      input1 = random[7:0];
      input2 = random[15:8];
      tb_result = input1 + input2;
      #50
      if (result != tb_result) $display("fail");
      #50;
    end

    alu_ctrl = 0;

    for (int i = 0; i < 1000; i++) begin
      random = $urandom(i);
      input1 = random[7:0];
      input2 = random[15:8];
      mult = input1 * input2;
      tb_result = mult[14:7];
      #50;
      if (result != tb_result) $display("fail: %d", i);
      #50;
    end
    $finish;
  end
endmodule


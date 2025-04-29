module alu_stim;

  timeunit 1ns; timeprecision 100ps;


  logic alu_ctrl;

  logic [7:0] input1;
  logic [7:0] input2;

  wire [7:0] result;

  logic [31:0] random;

  alu aludut (
      .alu_ctrl(alu_ctrl),
      .input1  (input1),
      .input2  (input2),
      .result  (result)
  );

  initial begin
    alu_ctrl = 0;

    for (int i = 0; i < 1000; i++) begin
      random = $urandom(i);
      input1 = random[7:0];
      input2 = random[15:8];
      if (result != input1 + input2) $Display("fail");
    end
  end
endmodule


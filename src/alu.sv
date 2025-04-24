module alu (
    input signed [7:0] input1,
    input signed [7:0] input2,
    input alu_ctrl,  // 0 = multiply 1 = add
    output logic signed [7:0] result
);

  timeunit 1ns; timeprecision 100ps;

  always_comb
    unique case (alu_ctrl)
      0: result = input1 * input2;
      //todo change this so that the bits 15:8 are taken in the result
      1: result = input1 + input2;
    endcase

endmodule

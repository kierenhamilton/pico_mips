module alu (
    input signed [7:0] input1,
    input signed [7:0] input2,
    input alu_ctrl,  // 0 = multiply 1 = add
    output logic signed [7:0] result
);

  timeunit 1ns; timeprecision 100ps;

  logic [15:0] mult_output;

  always_comb
    unique case (alu_ctrl)
      0: begin
        mult_output = input1 * input2;
        result = mult_output[14:7];
      end
      1: result = input1 + input2;
    endcase

endmodule

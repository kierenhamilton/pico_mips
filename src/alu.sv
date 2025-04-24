module alu (
    input signed [7:0] a,
    input signed [7:0] b,
    input command,
    output logic signed [7:0] result
);

  timeunit 1ns; timeprecision 100ps;
  always_comb begin

    unique case (command)
      0: begin
        result = a + b;
      end
      1: begin
        result = a * b;
      end
    endcase
  end


endmodule

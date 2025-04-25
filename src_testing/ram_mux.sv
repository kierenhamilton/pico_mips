module ram_mux (
    input ram_flag,
    input [7:0] result_alu,
    input [7:0] prog_value,

    output logic [7:0] out0
);

  timeunit 1ns; timeprecision 100ps;

  always_comb
    unique case (ram_flag)
      0: begin
        out0 = prog_value;
      end
      1: begin
        out0 = result_alu;
      end
    endcase

endmodule

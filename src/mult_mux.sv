module mult_mux (
    input [2:0] prog_address,
    input mult_flag,
    output logic [2:0] address
);

  timeunit 1ns; timeprecision 100ps;

  always_comb
    unique case (mult_flag)
      0: address = prog_address;
      1: address = 3'd2;
    endcase
endmodule
